import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/app/pages/add_plant/add_plant_page.dart';
import 'package:planta_care/app/pages/initial/my_locations/my_locations_page.dart';
import 'package:planta_care/app/pages/initial/popular_plants_page/popular_plants_page.dart';
import 'package:planta_care/app/pages/initial/settings/settings_page.dart';
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
import 'package:planta_care/app/pages/plant_details/plant_details_page.dart';
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
  static StatefulNavigationShell? navigationShell;

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
            pageBuilder: (context, state) => CupertinoPage(
              fullscreenDialog: true,
              child: AddPlantPage(
                popularPlantId: state.uri.queryParameters['popularPlantId'],
              ),
            ),
            redirect: const AuthGuard().isNotLogged,
          ),
          StatefulShellRoute.indexedStack(
            builder: (context, state, initialNavigationShell) {
              navigationShell = initialNavigationShell;
              return InitialPage(
                navigationShell: navigationShell!,
              );
            },
            branches: [
              StatefulShellBranch(
                navigatorKey: _shellNavigatorHomeKey,
                routes: [
                  GoRoute(
                    name: 'home',
                    path: '/home',
                    pageBuilder: (context, state) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScrollControllers.getController('/home');
                      });
                      return const NoTransitionPage(
                        child: HomePage(),
                      );
                    },
                    routes: [
                      GoRoute(
                        name: 'profile',
                        path: 'profile',
                        pageBuilder: (context, state) => const CupertinoPage(
                          child: ProfilePage(),
                        ),
                        redirect: const AuthGuard().isNotLogged,
                      ),
                      GoRoute(
                        name: 'plant-details',
                        path: '/plant-details/:plantId',
                        pageBuilder: (context, state) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            ScrollControllers.getController(
                                '/home/plant-details');
                          });
                          return CupertinoPage(
                            child: PlantDetailsPage(
                              plantId: state.pathParameters['plantId'],
                            ),
                          );
                        },
                      ),
                      GoRoute(
                        name: 'popular-plants',
                        path: '/popular-plants',
                        pageBuilder: (context, state) {
                          return const CupertinoPage(
                            child: PopularPlantsPage(),
                          );
                        },
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
                    pageBuilder: (context, state) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScrollControllers.getController('/my-place');
                      });
                      return const NoTransitionPage(
                        child: MyPlacePage(),
                      );
                    },
                    routes: [
                      GoRoute(
                        name: 'settings',
                        path: 'settings',
                        pageBuilder: (context, state) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            ScrollControllers.getController(
                                '/my-place/settings');
                          });
                          return const CupertinoPage(
                            child: SettingsPage(),
                          );
                        },
                      ),
                      GoRoute(
                        name: 'my-locations',
                        path: 'my-locations',
                        pageBuilder: (context, state) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            ScrollControllers.getController(
                                '/my-place/my-locations');
                          });
                          return const CupertinoPage(
                            child: MyLocationsPage(),
                          );
                        },
                      ),
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
                    pageBuilder: (context, state) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScrollControllers.getController('/categories');
                      });
                      return const NoTransitionPage(
                        child: CategoriesPage(),
                      );
                    },
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
                    pageBuilder: (context, state) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScrollControllers.getController('/diagnosis');
                      });
                      return const NoTransitionPage(
                        child: DiagnosisPage(),
                      );
                    },
                  ),
                ],
              ),
              StatefulShellBranch(
                navigatorKey: _shellNavigatorPremiumKey,
                routes: [
                  GoRoute(
                    name: 'premium',
                    path: '/premium',
                    pageBuilder: (context, state) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScrollControllers.getController('/premium');
                      });
                      return const NoTransitionPage(
                        child: PremiumPage(),
                      );
                    },
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

class ScrollControllers {
  static final Map<String, ScrollController> controllers = {};

  static ScrollController getController(String routeName) {
    if (!controllers.containsKey(routeName)) {
      controllers[routeName] = ScrollController();
    }
    return controllers[routeName] ?? ScrollController();
  }

  static void scrollToTop(String routeName) {
    if (controllers.containsKey(routeName)) {
      controllers[routeName]?.animateTo(
        0.0,
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeInOut,
      );
    }
  }
}
