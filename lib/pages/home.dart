import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    double type = MediaQuery.sizeOf(context).width > 780 ? 500 : 100;
    String email = "";

    return const Scaffold(
      body: Column(),
    );
  }
}
