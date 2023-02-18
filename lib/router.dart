import 'package:allyned/main_app_scaffold.dart';
import 'package:allyned/screens/home/home_screen.dart';
import 'package:allyned/screens/onboarding/onboarding_screen.dart';
import 'package:allyned/screens/login_screen.dart';
import 'package:allyned/screens/mailbox_screen.dart';
import 'package:allyned/screens/profile_screen.dart';
import 'package:allyned/screens/settings_screen.dart';
import 'package:allyned/screens/splash_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'app_service.dart';

class AppRouter {
  // Private navigators
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();
  final AppService appService;

  AppRouter(this.appService);

  GoRouter get appRouter => GoRouter(
        initialLocation: "/home",
        refreshListenable: appService,
        navigatorKey: _rootNavigatorKey,
        routes: [
          GoRoute(
            path: "/splash",
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SplashScreen(),
            ),
          ),
          GoRoute(
            path: "/onboarding",
            pageBuilder: (context, state) => const NoTransitionPage(
              child: OnboardingScreen(),
            ),
          ),
          GoRoute(
            path: "/login",
            pageBuilder: (context, state) => const NoTransitionPage(
              child: LoginScreen(),
            ),
          ),
          ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return MainAppScaffold(body: child);
            },
            routes: [
              GoRoute(
                path: "/home",
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomeScreen(),
                ),
              ),
              GoRoute(
                path: "/home",
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomeScreen(),
                ),
              ),
              GoRoute(
                path: "/mailbox",
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: MessagesScreen(),
                ),
              ),
              GoRoute(
                path: "/profile",
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ProfileScreen(),
                ),
                routes: [
                  GoRoute(
                    path: "settings",
                    builder: (context, state) => const SettingsScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
        redirect: (context, state) {
          final isLoggedIn = appService.loginState;
          final isInitialized = appService.initialized;
          final isOnboarded = appService.onboarding;

          final isGoingToLogin = state.subloc == "/login";
          final isGoingToInit = state.subloc == "/splash";
          final isGoingToOnboard = state.subloc == "/onboard";

          // If not Initialized and not going to Initialized redirect to Splash
          if (!isInitialized && !isGoingToInit) {
            return "/splash";
            // If not onboard and not going to onboard redirect to OnBoarding
          } else if (isInitialized && !isOnboarded && !isGoingToOnboard) {
            return "/onboarding";
            // If not logged in and not going to login redirect to Login
          } else if (isInitialized &&
              isOnboarded &&
              !isLoggedIn &&
              !isGoingToLogin) {
            return "/login";
            // If all the scenarios are cleared but still going to any of that screen redirect to Home
          } else if ((isLoggedIn && isGoingToLogin) ||
              (isInitialized && isGoingToInit) ||
              (isOnboarded && isGoingToOnboard)) {
            return "/home";
          } else {
            // Else Don't do anything
            return null;
          }
        },
      );
}
