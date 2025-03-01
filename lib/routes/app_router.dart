import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/pages/get_started_page.dart';
import 'package:planta_care/pages/auth/sign_up_page/sign_up_page.dart';
import 'package:planta_care/pages/auth/sign_in_page/sign_in_page.dart';
import 'package:planta_care/pages/initial/categories/categories_page.dart';
import 'package:planta_care/pages/initial/diagnosis/diagnosis_page.dart';
import 'package:planta_care/pages/initial/home/home_page.dart';
import 'package:planta_care/pages/initial/initial_page.dart';
import 'package:planta_care/pages/initial/premium/premium_page.dart';
import 'package:planta_care/pages/initial/profile/profile_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellProfile');
final _shellNavigatorCategoriesKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellCategories');
final _shellNavigatorDiagnosisKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellDiagnosis');
final _shellNavigatorPremiumKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellPremium');

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return InitialPage(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: '/home',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomePage(),
                ),
                routes: const [
                  // TODO: Add routes for home page
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfileKey,
            routes: [
              GoRoute(
                path: '/profile',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ProfilePage(),
                ),
                routes: const [
                  // TODO: Add routes for profile page
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorCategoriesKey,
            routes: [
              GoRoute(
                path: '/categories',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: CategoriesPage(),
                ),
                routes: const [
                  // TODO: Add routes for categories page
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorDiagnosisKey,
            routes: [
              GoRoute(
                path: '/diagnosis',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: DiagnosisPage(),
                ),
                routes: const [
                  // TODO: Add routes for diagnosis page
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorPremiumKey,
            routes: [
              GoRoute(
                path: '/premium',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: PremiumPage(),
                ),
                routes: const [
                  // TODO: Add routes for premium page
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const GetStartedPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'login',
            name: '/login',
            builder: (BuildContext context, GoRouterState state) {
              return const SignInPage();
            },
          ),
          GoRoute(
            path: 'sign-up',
            name: '/sign-up',
            builder: (BuildContext context, GoRouterState state) {
              return const SignUpPage();
            },
          ),
        ],
      ),
    ],
  );
}
