// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: unused_element

import 'package:go_router/go_router.dart';
import 'package:guardzone/core/presentation/theme/theme.dart';
import 'package:guardzone/main.dart';

import 'package:turn_page_transition/turn_page_transition.dart';

import 'route.dart';

/// This sample app shows an app with two screens.
///
/// The first route '/' is mapped to [HomeScreen], and the second route
/// '/details' is mapped to [DetailsScreen].
///
/// The buttons use context.go() to navigate to each destination. On mobile
/// devices, each destination is deep-linkable and on the web, can be navigated
/// to using the address bar.

/// The route configuration.


final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routes.index,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const MyHomePage(title: '',), //esto por ahora lo coloco para que no de error pero debo crear un splash screen
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) =>
            TurnPageTransition(
          animation: animation,
          overleafColor: context.primary_background,
          animationTransitionPoint: 0.5,
          direction: TurnDirection.rightToLeft,
          child: child,
        ),
      ),

      routes: <RouteBase>[
        GoRoute(
          path: Routes.home,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const MyHomePage(title: '',), //esto por ahora lo coloco para que no de error pero debo crear un home screen
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) =>
                TurnPageTransition(
              animation: animation,
              overleafColor: context.primary_background,
              animationTransitionPoint: 0.5,
              direction: TurnDirection.rightToLeft,
              child: child,
            ),
          ),

        ),

      ],
    ),
  ],
);
