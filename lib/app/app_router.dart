import 'package:ecnictech_fnb_ui/features/auth/bloc/authentication_bloc.dart';
import 'package:ecnictech_fnb_ui/features/auth/pages/login.dart';
import 'package:ecnictech_fnb_ui/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        name: 'Login',
        builder: (context, state) => const LoginPage(),
        routes: [
          GoRoute(
            path: 'register',
            name: 'Register',
            builder: (context, state) => const LoginPage(),
            routes: [
              GoRoute(
                path: 'google',
                name: 'GoogleLogin',
                builder: (context, state) => const LoginPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/home',
        name: 'Home',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'profile',
            name: 'Profile',
            builder: (context, state) => const LoginPage(),
            routes: [
              GoRoute(
                path: 'detail',
                name: 'ProfileDetail',
                builder: (context, state) => const LoginPage(),
              ),
              GoRoute(
                path: 'edit',
                name: 'ProfileEdit',
                builder: (context, state) => const LoginPage(),
              ),
            ],
          ),
          GoRoute(
            path: 'transaction',
            name: 'Transaction',
            builder: (context, state) => const LoginPage(),
            routes: [
              GoRoute(
                path: 'maintenance',
                name: 'TransactionMaintenance',
                builder: (context, state) => const LoginPage(),
                routes: [
                  GoRoute(
                    path: 'approval',
                    name: 'TransactionMaintenanceApproval',
                    builder: (context, state) => const LoginPage(),
                  ),
                ],
              ),
              GoRoute(
                path: 'report',
                name: 'TransactionReport',
                builder: (context, state) => const LoginPage(),
                routes: [
                  GoRoute(
                    path: 'detail',
                    name: 'TransactionReportDetail',
                    builder: (context, state) => const LoginPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: _guard,
  );

  static String? _guard(BuildContext context, GoRouterState state) {
    final bool loggingIn = state.matchedLocation == '/login';
    if (context.read<AuthenticationBloc>().state is! LoggedIn) {
      return '/login';
    }
    // If the user is logged in but still on the login page, send them to
    // the profile page
    if (loggingIn) {
      return '/home';
    }
    return null;
  }
}
