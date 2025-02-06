import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppView extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppView({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      appBar: _appBarWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(context),
    );
  }

  NavigationBarTheme _bottomNavigationBarWidget(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
          labelTextStyle: WidgetStateTextStyle.resolveWith(
        (states) {
          return states.contains(WidgetState.selected)
              ? TextStyle(color: Theme.of(context).colorScheme.primary)
              : TextStyle(color: Theme.of(context).colorScheme.tertiary);
        },
      )),
      child: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (index) => navigationShell.goBranch(index),
          indicatorColor: Colors.transparent,
          destinations: [
            _menuItem(context,
                index: 0,
                currentIndex: navigationShell.currentIndex,
                icon: Icons.face,
                label: 'Characters'),
            _menuItem(context,
                index: 1,
                currentIndex: navigationShell.currentIndex,
                icon: Icons.bookmark,
                label: 'Favorites'),
            _menuItem(context,
                index: 2,
                currentIndex: navigationShell.currentIndex,
                icon: Icons.location_on,
                label: 'Locations'),
            _menuItem(context,
                index: 3,
                currentIndex: navigationShell.currentIndex,
                icon: Icons.menu,
                label: 'Chapters'),
          ]),
    );
  }

  AppBar _appBarWidget() {
    return AppBar(
      title: Text(
        'Rick and Morty',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings))],
    );
  }
}

Widget _menuItem(BuildContext context,
    {required int index,
    required int currentIndex,
    required IconData icon,
    required String label}) {
  return NavigationDestination(
      icon: Icon(
        icon,
        color: currentIndex == index
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.tertiary,
      ),
      label: label);
}
