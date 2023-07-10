import 'package:bloc_app/domain/router/router_bloc.dart';
import 'package:bloc_app/domain/router/state.dart';
import 'package:bloc_app/ui/screen/home/page/home_page.dart';
import 'package:bloc_app/ui/screen/login/page/login_page.dart';
import 'package:bloc_app/ui/screen/splash.dart';
import 'package:flutter/material.dart';

class RootRouterDelegate extends RouterDelegate<RouterState> {
  static const splashKey = "app://splash";
  static const loginKey = "app://login";
  static const homeKey = "app://home";
  static const creationKey = "app://creation";

  final GlobalKey<NavigatorState> _navigatorKey;
  final RouterBloc _routerBloc;

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  RootRouterDelegate(
    GlobalKey<NavigatorState> navigatorKey,
    RouterBloc routerBloc,
  )   : _navigatorKey = navigatorKey,
        _routerBloc = routerBloc;

  @override
  void addListener(VoidCallback listener) {}

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        pages: _pages,
        onPopPage: _onPopPageParser,
        transitionDelegate: const DefaultTransitionDelegate<dynamic>(),
      );

  bool _onPopPageParser(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) return false;
    popRoute();
    return true;
  }

  // TODO: add skip backpress logic
  @override
  Future<bool> popRoute() async => false;

  @override
  void removeListener(VoidCallback listener) {}

  @override
  Future<void> setNewRoutePath(RouterState configuration) async {}

  List<Page> get _pages {
    if (_routerBloc.state is SplashState) {
      return _splashPageStack;
    }
    if (_routerBloc.state is LoginState) {
      return _loginPageStack;
    }
    if (_routerBloc.state is HomeState) {
      return _homePageStack;
    }
    return List.empty();
  }

  List<Page> get _splashPageStack {
    return [
      _materialPage(
        valueKey: splashKey,
        child: const SplashScreen(),
      ),
    ];
  }

  List<Page> get _loginPageStack {
    return [LoginPage()];
  }

  List<Page> get _homePageStack {
    return [HomePage()];
  }

  Page _materialPage({
    required String valueKey,
    required Widget child,
  }) =>
      MaterialPage(key: ValueKey<String>(valueKey), child: child);
}
