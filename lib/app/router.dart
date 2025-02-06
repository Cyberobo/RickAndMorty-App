import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/views/app_view.dart';
import 'package:rickandmorty/views/screens/characters_view/characters_view.dart';
import 'package:rickandmorty/views/screens/characters_view/characters_view_model.dart';
import 'package:rickandmorty/views/screens/favorites_view/favorites_view.dart';
import 'package:rickandmorty/views/screens/locations_view/locations_view.dart';
import 'package:rickandmorty/views/screens/sections_view/sections_view.dart';
import 'package:provider/provider.dart';

final _routerKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();

  static const String characters = '/';
  static const String favorites = '/favorites';
  static const String locations = '/locations';
  static const String sections = '/sections';
}

final router = GoRouter(
    navigatorKey: _routerKey,
    initialLocation: AppRoutes.characters,
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => AppView(
                navigationShell: navigationShell,
              ),
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                  path: AppRoutes.characters,
                  builder: (context, state) => ChangeNotifierProvider(
                        create: (context) => CharactersViewModel(),
                        child: CharactersView(),
                      ))
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: AppRoutes.favorites,
                builder: (context, state) => const FavoritesView(),
              )
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: AppRoutes.locations,
                builder: (context, state) => const LocationsView(),
              )
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: AppRoutes.sections,
                builder: (context, state) => const SectionsView(),
              )
            ])
          ])
    ]);
