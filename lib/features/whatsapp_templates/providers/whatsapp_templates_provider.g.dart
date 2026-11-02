// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whatsapp_templates_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$whatsAppTemplatesListHash() =>
    r'a2b3c4d5e6f7a2b3c4d5e6f7a2b3c4d5e6f7a2b3';

/// The signed-in user's own private WhatsApp templates — the backend
/// scopes this list by the caller's user id, so there is nothing else to
/// filter here.
///
/// Copied from [WhatsAppTemplatesList].
@ProviderFor(WhatsAppTemplatesList)
final whatsAppTemplatesListProvider =
    AutoDisposeAsyncNotifierProvider<
      WhatsAppTemplatesList,
      List<WhatsAppTemplate>
    >.internal(
      WhatsAppTemplatesList.new,
      name: r'whatsAppTemplatesListProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$whatsAppTemplatesListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$WhatsAppTemplatesList =
    AutoDisposeAsyncNotifier<List<WhatsAppTemplate>>;
String _$whatsAppTemplateActionsControllerHash() =>
    r'b3c4d5e6f7a8b3c4d5e6f7a8b3c4d5e6f7a8b3c4';

/// Create/edit/delete for a single template — see `WhatsAppTemplatesList`
/// for the read side.
///
/// Copied from [WhatsAppTemplateActionsController].
@ProviderFor(WhatsAppTemplateActionsController)
final whatsAppTemplateActionsControllerProvider =
    AutoDisposeAsyncNotifierProvider<
      WhatsAppTemplateActionsController,
      void
    >.internal(
      WhatsAppTemplateActionsController.new,
      name: r'whatsAppTemplateActionsControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$whatsAppTemplateActionsControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$WhatsAppTemplateActionsController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
