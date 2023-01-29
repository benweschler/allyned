import 'package:allyned/screens/home_screen.dart';
import 'package:allyned/screens/messages_screen.dart';
import 'package:allyned/screens/profile_screen.dart';
import 'package:allyned/screens/settings_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      name: "home",
      path: "/",
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          name: "messages",
          path: "messages",
          builder: (context, state) => const MessagesScreen(),
        ),
        GoRoute(
          name: "profile",
          path: "profile",
          builder: (context, state) => const ProfileScreen(),
          routes: [
            GoRoute(
              name: "settings",
              path: "settings",
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
