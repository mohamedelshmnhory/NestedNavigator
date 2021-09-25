import 'package:flutter/material.dart';
import 'package:shormehh/modules/cart.dart';
import 'package:shormehh/modules/home_screen.dart';
import 'package:shormehh/modules/meals.dart';
import 'package:shormehh/modules/place_details_screen.dart';

class HomeNestedNavigator extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeNestedNavigator> {
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return NestedNavigator(
        navigationKey: navigationKey,
        initialRoute: '/',
        routes: {
          // default rout as '/' is necessary!
          '/': (context) => HomeScreen(),
          '/two': (context) => PlaceDetailsScreen(),
          '/three': (context) => MealsScreen(),
          '/four': (context) => CartScreen(),
        },
      );
  }
}

class NestedNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigationKey;
  final String initialRoute;
  final Map<String, WidgetBuilder> routes;

  NestedNavigator({
    required this.navigationKey,
    required this.initialRoute,
    required this.routes,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Navigator(
        key: navigationKey,
        initialRoute: initialRoute,
        onGenerateRoute: (RouteSettings routeSettings) {
          WidgetBuilder builder = routes[routeSettings.name]!;
          if (routeSettings.name == '/') {
            return PageRouteBuilder(
              pageBuilder: (context, __, ___) => builder(context),
              settings: routeSettings,
            );
          } else {
            return MaterialPageRoute(
              builder: builder,
              settings: routeSettings,
            );
          }
        },
      ),
      onWillPop: () {
        if (navigationKey.currentState!.canPop()) {
          navigationKey.currentState!.pop();
          return Future<bool>.value(false);
        }
        return Future<bool>.value(true);
      },
    );
  }
}
