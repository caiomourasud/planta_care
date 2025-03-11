import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/pages/add_plant/app_plant_page.dart';
import 'package:planta_care/app/pages/my_place/my_place_page.dart';
import 'package:planta_care/app/pages/onboarding/experience_level_page.dart';
import 'package:planta_care/app/pages/onboarding/get_started_page.dart';
import 'package:planta_care/app/pages/auth/sign_up_page.dart';
import 'package:planta_care/app/pages/auth/sign_in_page.dart';
import 'package:planta_care/app/pages/initial/categories/categories_page.dart';
import 'package:planta_care/app/pages/initial/diagnosis/diagnosis_page.dart';
import 'package:planta_care/app/pages/initial/home/home_page.dart';
import 'package:planta_care/app/pages/initial/initial_page.dart';
import 'package:planta_care/app/pages/initial/premium/premium_page.dart';
import 'package:planta_care/app/pages/initial/profile/profile_page.dart';
import 'package:planta_care/app/pages/onboarding/where_are_your_plants.dart';
import 'package:planta_care/app/routes/guards/auth_guard.dart';
import 'package:planta_care/app/pages/root_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorMyPlaceKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellMyPlace');
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
      ShellRoute(
        builder: (context, state, child) => RootScreen(child: child),
        routes: [
          GoRoute(
            path: '/',
            redirect: (_, __) => '/login',
          ),
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
          GoRoute(
            name: 'get-started',
            path: '/get-started',
            builder: (BuildContext context, GoRouterState state) {
              return const GetStartedPage();
            },
            redirect: const AuthGuard().isNotLogged,
          ),
          GoRoute(
            name: 'where-are-your-plants',
            path: '/where-are-your-plants',
            builder: (BuildContext context, GoRouterState state) {
              return const WhereAreYourPlantsPage();
            },
            redirect: const AuthGuard().isNotLogged,
          ),
          GoRoute(
            name: 'experience-level',
            path: '/experience-level',
            builder: (BuildContext context, GoRouterState state) {
              return const ExperienceLevelPage();
            },
            redirect: const AuthGuard().isNotLogged,
          ),
          GoRoute(
            name: 'add-plant',
            path: '/add-plant',
            pageBuilder: (context, state) => const CupertinoPage(
              fullscreenDialog: true,
              child: AppPlantPage(),
            ),
            redirect: const AuthGuard().isNotLogged,
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
                    routes: [
                      GoRoute(
                        name: 'profile',
                        path: 'profile',
                        pageBuilder: (context, state) => const CupertinoPage(
                          child: ProfilePage(),
                        ),
                        redirect: const AuthGuard().isNotLogged,
                      ),
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                navigatorKey: _shellNavigatorMyPlaceKey,
                routes: [
                  GoRoute(
                    name: 'my-place',
                    path: '/my-place',
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: MyPlacePage(),
                    ),
                    routes: const [
                      // TODO: Add routes for my place page
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
      ),
    ],
  );
}
