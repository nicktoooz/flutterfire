import 'package:flutter/material.dart';
import 'package:flutterfire/pages/home.dart';
import 'package:flutterfire/pages/sign-in.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const MyApp());

final GoRouter _router =
    GoRouter(initialLocation: '/sign-in', routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (context, state) {
        return const Home();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'sign-in',
          builder: (context, state) {
            return const SignIn();
          },
        )
      ]),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0062E8)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF0062E8),
            elevation: 0,
          ).copyWith(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF0062E8),
            side: const BorderSide(color: Color(0xFF0062E8), width: 2.0),
            elevation: 0,
          ).copyWith(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
          ),
        ),
      ),
      routerConfig: _router,
    );
  }
}
