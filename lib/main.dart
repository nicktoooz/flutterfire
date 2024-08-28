import 'package:flutter/material.dart';
import 'package:flutterfire/pages/home.dart';
import 'package:flutterfire/pages/sign-in.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(routes: <RouteBase>[
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
      routerConfig: _router,
    );
  }
}
