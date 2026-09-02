import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/accounts/presentation/screens/account_detail_screen.dart';
import '../../features/accounts/presentation/screens/accounts_list_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/providers/session_provider.dart';
import '../../features/app_updates/presentation/screens/updates_screen.dart';
import '../../features/calls/presentation/screens/call_logs_screen.dart';
import '../../features/checkins/presentation/screens/checkin_form_screen.dart';
import '../../features/checkins/presentation/screens/checkins_feed_screen.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/followups/presentation/screens/followups_screen.dart';
import '../../features/leads/domain/lead.dart';
import '../../features/leads/presentation/screens/create_lead_screen.dart';
import '../../features/leads/presentation/screens/edit_lead_screen.dart';
import '../../features/leads/presentation/screens/lead_detail_screen.dart';
import '../../features/leads/presentation/screens/leads_list_screen.dart';
import '../../features/leads/presentation/screens/re_enquiries_screen.dart';
import '../../features/notifications/presentation/screens/notifications_screen.dart';
import '../../features/opportunities/presentation/screens/opportunities_list_screen.dart';
import '../../features/opportunities/presentation/screens/opportunity_detail_screen.dart';
import '../../features/payments/presentation/screens/payments_list_screen.dart';
import '../../features/products/presentation/screens/products_list_screen.dart';
import '../../features/reports/presentation/screens/reports_screen.dart';
import '../../features/reports/presentation/screens/top_performers_screen.dart';
import '../../features/search/presentation/screens/search_screen.dart';
import '../../features/targets/presentation/screens/targets_screen.dart';
import 'app_shell.dart';
import 'circular_reveal_page.dart';

part 'app_router.g.dart';

class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const home = '/home';
  static const leads = '/leads';
  static const opportunities = '/opportunities';
  static const accounts = '/accounts';
  static const followups = '/followups';
  static const checkins = '/checkins';
  static const targets = '/targets';
  static const payments = '/payments';
  static const search = '/search';
  static const reports = '/reports';
  static const topPerformers = '/reports/leaderboard';
  static const notifications = '/notifications';
  static const products = '/products';
  static const reEnquiries = '/re-enquiries';
  static const calls = '/calls';
  static const updates = '/updates';
}

@Riverpod(keepAlive: true)
GoRouter goRouter(ProviderRef<GoRouter> ref) {
  // Built exactly once. Do NOT `ref.watch` session state here — that would
  // recreate the whole GoRouter (and reset navigation) on every auth change.
  // `refreshListenable` re-runs `redirect` on this same instance instead,
  // and `redirect` reads the session fresh, at redirect-time, via `ref.read`.
  return GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: GoRouterRefreshStream(ref),
    redirect: (context, state) {
      final sessionAsync = ref.read(sessionControllerProvider);
      final location = state.matchedLocation;

      // `sessionAsync.isLoading` covers two very different situations: the
      // initial session-restore on app launch, AND a login-form submission
      // in progress (SessionController.login() also sets state to loading).
      // Bouncing to the splash screen for the latter is wrong — LoginForm
      // already shows its own button spinner, and if the login request
      // then fails, redirecting *back* from splash to a brand-new /login
      // instance means LoginScreen's error listener was never mounted to
      // catch it, so the failure reason silently vanishes. Staying put on
      // /login (or /splash, for the real initial-restore case) avoids both
      // problems.
      if (sessionAsync.isLoading) {
        if (location == AppRoutes.splash || location == AppRoutes.login) return null;
        return AppRoutes.splash;
      }

      final isLoggedIn = sessionAsync.valueOrNull != null;
      final isOnLogin = location == AppRoutes.login;

      if (!isLoggedIn) {
        return isOnLogin ? null : AppRoutes.login;
      }

      // Logged in: never leave the user stranded on splash/login.
      if (isOnLogin || location == AppRoutes.splash) {
        return AppRoutes.home;
      }

      return null;
    },
    routes: [
      GoRoute(path: AppRoutes.splash, builder: (context, state) => const SplashScreen()),
      GoRoute(path: AppRoutes.login, builder: (context, state) => const LoginScreen()),
      ShellRoute(
        builder: (context, state, child) => AppShell(location: state.matchedLocation, child: child),
        routes: [
          GoRoute(path: AppRoutes.home, builder: (context, state) => const DashboardScreen()),
          GoRoute(path: AppRoutes.leads, builder: (context, state) => const LeadsListScreen()),
          GoRoute(path: AppRoutes.search, builder: (context, state) => const SearchScreen()),
          GoRoute(path: AppRoutes.followups, builder: (context, state) => const FollowUpsScreen()),
          GoRoute(path: AppRoutes.reports, builder: (context, state) => const ReportsScreen()),
        ],
      ),
      GoRoute(
        path: '/leads/new',
        builder: (context, state) => const CreateLeadScreen(),
      ),
      GoRoute(
        path: '/leads/:id',
        builder: (context, state) => LeadDetailScreen(leadId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/leads/:id/edit',
        builder: (context, state) => EditLeadScreen(lead: state.extra! as Lead),
      ),
      // Opportunities and Accounts are demoted from primary tabs to pushed
      // screens (see AppShell — the 5 tabs are now Dashboard/Leads/Search/
      // Follow Ups/Reports). Each is still fully reachable: Opportunities
      // from dashboard tiles/lead conversion, Accounts from its own AppBar
      // shortcut on the Dashboard.
      GoRoute(path: AppRoutes.opportunities, builder: (context, state) => const OpportunitiesListScreen()),
      GoRoute(
        path: '/opportunities/:id',
        builder: (context, state) => OpportunityDetailScreen(opportunityId: state.pathParameters['id']!),
      ),
      GoRoute(path: AppRoutes.accounts, builder: (context, state) => const AccountsListScreen()),
      GoRoute(
        path: '/accounts/:id',
        builder: (context, state) => AccountDetailScreen(accountId: state.pathParameters['id']!),
      ),
      GoRoute(path: AppRoutes.checkins, builder: (context, state) => const CheckInsFeedScreen()),
      GoRoute(
        path: '/checkins/new',
        builder: (context, state) => CheckInFormScreen(
          leadId: state.uri.queryParameters['leadId'],
          contactId: state.uri.queryParameters['contactId'],
          accountId: state.uri.queryParameters['accountId'],
        ),
      ),
      GoRoute(path: AppRoutes.targets, builder: (context, state) => const TargetsScreen()),
      GoRoute(path: AppRoutes.payments, builder: (context, state) => const PaymentsListScreen()),
      GoRoute(path: AppRoutes.topPerformers, builder: (context, state) => const TopPerformersScreen()),
      GoRoute(
        path: AppRoutes.notifications,
        // Circular white reveal expanding from wherever the bell icon was
        // tapped (see NotificationBellButton), instead of the default
        // platform slide — `extra` carries that tap position as an Offset.
        pageBuilder: (context, state) => CircularRevealPage(
          key: state.pageKey,
          origin: state.extra as Offset?,
          child: const NotificationsScreen(),
        ),
      ),
      // Sidebar-only destinations (see core/widgets/app_drawer.dart) — no
      // existing bottom tab or dashboard shortcut covers these.
      GoRoute(path: AppRoutes.products, builder: (context, state) => const ProductsListScreen()),
      GoRoute(path: AppRoutes.reEnquiries, builder: (context, state) => const ReEnquiriesScreen()),
      GoRoute(path: AppRoutes.calls, builder: (context, state) => const CallLogsScreen()),
      GoRoute(path: AppRoutes.updates, builder: (context, state) => const UpdatesScreen()),
    ],
  );
}

/// Bridges Riverpod state changes into go_router's `Listenable`-based
/// refresh mechanism so the guard above re-evaluates whenever the session
/// AsyncValue changes (login, logout, forced 401 logout).
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(ProviderRef<GoRouter> ref) {
    ref.listen(sessionControllerProvider, (_, _) => notifyListeners());
  }
}
