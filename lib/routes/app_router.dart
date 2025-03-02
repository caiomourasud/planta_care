import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/pages/auth/get_started_page.dart';
import 'package:planta_care/pages/auth/sign_up_page/sign_up_page.dart';
import 'package:planta_care/pages/auth/sign_in_page/sign_in_page.dart';
import 'package:planta_care/pages/initial/categories/categories_page.dart';
import 'package:planta_care/pages/initial/diagnosis/diagnosis_page.dart';
import 'package:planta_care/pages/initial/home/home_page.dart';
import 'package:planta_care/pages/initial/initial_page.dart';
import 'package:planta_care/pages/initial/premium/premium_page.dart';
import 'package:planta_care/pages/initial/profile/profile_page.dart';
import 'package:planta_care/routes/guards/auth_guard.dart';

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
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const GetStartedPage();
        },
        routes: <RouteBase>[
          // GoRoute(
          //   path: 'get-started',
          //   name: '/get-started',
          //   builder: (BuildContext context, GoRouterState state) {
          //     return const GetStartedPage();
          //   },
          //   redirect: const AuthGuard().isLogged,
          // ),
          GoRoute(
            name: 'login',
            path: '/login',
            builder: (BuildContext context, GoRouterState state) {
              return const SignInPage();
            },
            redirect: const AuthGuard().isLogged,
          ),
          GoRoute(
            name: 'sign-up',
            path: '/sign-up',
            builder: (BuildContext context, GoRouterState state) {
              return const SignUpPage();
            },
            redirect: const AuthGuard().isLogged,
          ),
        ],
      ),
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
                name: 'home',
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
                name: 'profile',
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
                name: 'categories',
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
                name: 'diagnosis',
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
                name: 'premium',
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
    ],
  );
}
