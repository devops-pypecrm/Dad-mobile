import java.util.Properties

plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

// ---------------------------------------------------------------------------------------------
// Two build modes, one codebase.
//   live (default)      application id com.pypecrm.dad_mobile, existing signing, in-app updater.
//   Google Play         `PLAY_STORE=true` (env var; the Dart side gets the same flag through
//                       --dart-define=PLAY_STORE=true). Own application id, own upload key, and no
//                       self-updating code (Play forbids it). See BUILDING.md / local_builds/.
// With the flag unset nothing below changes the live build.
// ---------------------------------------------------------------------------------------------
val isPlay = System.getenv("PLAY_STORE") == "true"
val LIVE_APPLICATION_ID = "com.pypecrm.dad_mobile"
val PLAY_APPLICATION_ID = "com.pypecrm.crm" // permanent once uploaded to Play — change here only, BEFORE the first upload

val keyProps = Properties().apply {
    val f = rootProject.file("key.properties")
    if (f.exists()) f.inputStream().use { load(it) }
}

// Firebase config for the Play id. Preferred: a real google-services-play.json (register the Play
// package in the Firebase console). Fallback: derive one from the live file with the package name
// swapped so the build works; push (FCM) for the Play build is only guaranteed once the real file exists.
// Written to src/release/ (variant-specific files win over app/google-services.json) and removed
// again in live mode, so a live build can never pick it up.
run {
    val target = file("src/release/google-services.json")
    if (isPlay) {
        val real = file("google-services-play.json")
        val live = file("google-services.json")
        target.parentFile.mkdirs()
        when {
            real.exists() -> real.copyTo(target, overwrite = true)
            live.exists() -> target.writeText(live.readText().replace("\"package_name\": \"$LIVE_APPLICATION_ID\"", "\"package_name\": \"$PLAY_APPLICATION_ID\""))
            else -> throw GradleException("PLAY_STORE build needs android/app/google-services-play.json (or google-services.json)")
        }
    } else if (target.exists()) {
        target.delete()
    }
}


android {
    namespace = "com.pypecrm.dad_mobile"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
        // Required by flutter_local_notifications.
        isCoreLibraryDesugaringEnabled = true
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = if (isPlay) PLAY_APPLICATION_ID else LIVE_APPLICATION_ID
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    if (isPlay) {
        signingConfigs {
            create("play") {
                val storePath = keyProps.getProperty("play.storeFile")
                    ?: throw GradleException("PLAY_STORE build needs play.storeFile/play.storePassword/play.keyAlias/play.keyPassword in android/key.properties")
                storeFile = file(storePath)
                storePassword = keyProps.getProperty("play.storePassword")
                keyAlias = keyProps.getProperty("play.keyAlias")
                keyPassword = keyProps.getProperty("play.keyPassword")
            }
        }
        // Removes REQUEST_INSTALL_PACKAGES and the APK FileProvider (self-updater) from the Play build only.
        sourceSets.getByName("release").manifest.srcFile("src/play/AndroidManifest.xml")
    }

    buildTypes {
        release {
            // Live build: unchanged (debug-signed, as published today). Play build: the upload key.
            signingConfig = if (isPlay) signingConfigs.getByName("play") else signingConfigs.getByName("debug")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}

flutter {
    source = "../.."
}
