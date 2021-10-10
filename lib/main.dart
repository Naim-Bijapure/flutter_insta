import 'package:flutter/material.dart';
import 'package:n_insta/screens/search/search.dart';
import 'package:provider/provider.dart';

import 'home.dart';

// const MaterialColor white = const MaterialColor(
//   0xFFFFFFFF,
//   const <int, Color>{
//     50: const Color(0xFFFFFFFF),
//     100: const Color(0xFFFFFFFF),
//     200: const Color(0xFFFFFFFF),
//     300: const Color(0xFFFFFFFF),
//     400: const Color(0xFFFFFFFF),
//     500: const Color(0xFFFFFFFF),
//     600: const Color(0xFFFFFFFF),
//     700: const Color(0xFFFFFFFF),
//     800: const Color(0xFFFFFFFF),
//     900: const Color(0xFFFFFFFF),
//   },
// );

void main() {
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  RootApp({Key? key}) : super(key: key);

  // final AppRouteDelegate _routeDelegate = AppRouteDelegate();
  // final AppRouteInformationParser _appRouteInformationParser =
  //     AppRouteInformationParser();

  // _routeDelegate = AppRouteDelegate();
  // _appRouteInformationParser = AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'N Instagram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: const Home(),
      // home: Router(
      //   routerDelegate: _routeDelegate,
      //   routeInformationParser: _appRouteInformationParser,
      // ),
    );
  }
}

// app state
class AppRouteState {
  String currentPath = "home";
  bool isUnknown = false;
  // on home
  AppRouteState.home()
      : currentPath = "home",
        isUnknown = false;

  // on search
  AppRouteState.search()
      : currentPath = "search",
        isUnknown = false;

  // on add
  AppRouteState.add()
      : currentPath = "add",
        isUnknown = false;

  // on notification
  AppRouteState.notification()
      : currentPath = "notification",
        isUnknown = false;

  // on profile
  AppRouteState.profile()
      : currentPath = "profile",
        isUnknown = false;

  // on unknown
  AppRouteState.unknown()
      : currentPath = "unknown",
        isUnknown = true;

  bool get isHomePage => currentPath != "home";
}

class AppRouteInformationParser extends RouteInformationParser<AppRouteState> {
  @override
  Future<AppRouteState> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location as String);
    // Handle '/'
    if (uri.pathSegments.isEmpty) {
      return AppRouteState.home();
    }
    return AppRouteState.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(AppRouteState configuration) {
    if (configuration.isHomePage) {
      return const RouteInformation(location: "/");
    }
    return const RouteInformation(location: "/");
  }
}

class AppRouteDelegate extends RouterDelegate<AppRouteState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRouteState> {
  late final GlobalKey<NavigatorState> navigatorKey;
  // init navigator key
  AppRouteDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  String _selectedScreen = "home";

  _handleScreenChange(screenName) {
    _selectedScreen = screenName;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        const MaterialPage(
          key: ValueKey("home"),
          child: Home(),
        ),
        if (_selectedScreen == "search")
          const MaterialPage(
            key: ValueKey("search"),
            child: Search(),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        _selectedScreen = "home";
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRouteState configuration) async {
    if (configuration.isHomePage) {
      _selectedScreen = "home";
      return;
    }
  }
}
