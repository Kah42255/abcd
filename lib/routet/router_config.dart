import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ihateu/main.dart';
import 'package:ihateu/screens/LoginPage.dart';
import 'package:ihateu/screens/signup_page.dart';

final router = GoRouter(
  initialLocation: '/',
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: const Center(child: Text('Page not found')),
    ),
  ),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyApp(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const singup(),
    ),
  ],
);
