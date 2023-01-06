
import 'package:comments_app/screens/auth/login.dart';
import 'package:comments_app/screens/auth/registration.dart';
import 'package:comments_app/screens/home/home.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: LoginPage.routeName,
  routes: [
    GoRoute(
      path: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: LoginPage.routeName,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RegistrationPage.routeName,
      builder: (context, state) => const RegistrationPage(),
    ),
  ],
);
