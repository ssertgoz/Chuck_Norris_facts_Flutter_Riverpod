// private navigators
import 'package:chuck_norris/routing/nested_navigation.dart';
import 'package:chuck_norris/src/screens/category_screen/category_screen.dart';
import 'package:chuck_norris/src/screens/favorite_screen/favorite_screen.dart';
import 'package:chuck_norris/src/screens/random_joke_screen/random_joke_screen.dart';
import 'package:chuck_norris/src/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorCategoryKey =
    GlobalKey<NavigatorState>(debugLabel: 'Category');
final _shellNavigatorSearchJokeKey =
    GlobalKey<NavigatorState>(debugLabel: 'Search Joke');
final _shellNavigatorFavoriteJokeKey =
    GlobalKey<NavigatorState>(debugLabel: 'Favorite Joke');

// the one and only GoRouter instance
final goRouter = GoRouter(
  initialLocation: '/a',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/d',
      builder: (context, state) => const RandomJokeScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return NestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        // first branch (A)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCategoryKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/a',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: CategoryScreen(),
              ),
            ),
          ],
        ),

        StatefulShellBranch(
          navigatorKey: _shellNavigatorSearchJokeKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/b',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: SearchJokeScreen()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorFavoriteJokeKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/c',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: FavoriteJokesScreen(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
