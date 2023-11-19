// private navigators
import 'package:chuck_norris/src/widgets/Screens/category_screen/category_screen.dart';
import 'package:chuck_norris/src/widgets/Screens/details_screen/details_screen.dart';
import 'package:chuck_norris/src/widgets/Screens/favorite_screen/favorite_screen.dart';
import 'package:chuck_norris/src/widgets/Screens/random_joke_screen/random_joke_screen.dart';
import 'package:chuck_norris/src/widgets/Screens/search_screen/search_screen.dart';
import 'package:chuck_norris/src/widgets/common/bottom_nawbar/nested_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteNames {
  static const categoriesScreen = '/a';
  static const searchScreen = '/b';
  static const favoritesScreen = '/c';
  static const randomJokeScreen = '/d';
  static const jokeDetailScreen = '/e';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorCategoryKey =
    GlobalKey<NavigatorState>(debugLabel: 'Category');
final _shellNavigatorSearchJokeKey =
    GlobalKey<NavigatorState>(debugLabel: 'Search Joke');
final _shellNavigatorFavoriteJokeKey =
    GlobalKey<NavigatorState>(debugLabel: 'Favorite Joke');

final goRouter = GoRouter(
  initialLocation: '/c',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/d',
      builder: (context, state) => const RandomJokeScreen(),
    ),
    GoRoute(
      path: '/e',
      builder: (context, state) => const DetailsScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorFavoriteJokeKey,
          routes: [
            GoRoute(
              path: '/c',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: FavoriteJokesScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSearchJokeKey,
          routes: [
            GoRoute(
              path: '/b',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: SearchJokeScreen()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCategoryKey,
          routes: [
            GoRoute(
              path: '/a',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: CategoryScreen(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
