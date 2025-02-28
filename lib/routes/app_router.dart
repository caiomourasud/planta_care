import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planta_care/pages/auth/get_started_page.dart';
import 'package:planta_care/pages/auth/sign_up_page.dart';
import 'package:planta_care/pages/auth/sign_in_page.dart';

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
              return const SignUpPage();
            },
          ),
          GoRoute(
            path: 'signin',
            name: '/signin',
            builder: (BuildContext context, GoRouterState state) {
              return const SignInPage();
            },
          ),
        ],
      ),
    ],
  );
}
