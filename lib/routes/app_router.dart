import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/pages/get_started_page.dart';
import 'package:planta_care/pages/auth/sign_up_page/sign_up_page.dart';
import 'package:planta_care/pages/auth/sign_in_page/sign_in_page.dart';
import 'package:planta_care/pages/initial/diagnosis/diagnosis_page.dart';
import 'package:planta_care/pages/initial/home/home_page.dart';
import 'package:planta_care/pages/initial/initial_page.dart';
import 'package:planta_care/pages/initial/premium/premium_page.dart';
import 'package:planta_care/pages/initial/profile/profile_page.dart';
import 'package:planta_care/pages/initial/categories/categories_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
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
          GoRoute(
            path: 'initial',
            name: '/initial',
            builder: (BuildContext context, GoRouterState state) {
              return const InitialPage();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'home',
                name: '/home',
                builder: (BuildContext context, GoRouterState state) {
                  return const HomePage();
                },
              ),
              GoRoute(
                path: 'profile',
                name: '/profile',
                builder: (BuildContext context, GoRouterState state) {
                  return const ProfilePage();
                },
              ),
              GoRoute(
                path: 'categories',
                name: '/categories',
                builder: (BuildContext context, GoRouterState state) {
                  return const CategoriesPage();
                },
              ),
              GoRoute(
                path: 'diagnosis',
                name: '/diagnosis',
                builder: (BuildContext context, GoRouterState state) {
                  return const DiagnosisPage();
                },
              ),
              GoRoute(
                path: 'premium',
                name: '/premium',
                builder: (BuildContext context, GoRouterState state) {
                  return const PremiumPage();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
