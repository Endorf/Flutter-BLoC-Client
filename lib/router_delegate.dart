import 'package:bloc_app/main_transition_delegate.dart';
import 'package:bloc_app/domain/router/event.dart';
import 'package:bloc_app/domain/router/router_bloc.dart';
import 'package:bloc_app/domain/router/state.dart';
import 'package:bloc_app/ui/screen/creation/page/creation_page.dart';
import 'package:bloc_app/ui/screen/home/page/home_page.dart';
import 'package:bloc_app/ui/screen/login/page/login_page.dart';
import 'package:bloc_app/ui/screen/splash/page/splash_page.dart';
import 'package:flutter/material.dart';

class RootRouterDelegate extends RouterDelegate<RouteState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteState> {
  final GlobalKey<NavigatorState> _navigatorKey;
  final RouterBloc _routerBloc;

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  RootRouterDelegate(
    GlobalKey<NavigatorState> navigatorKey,
    RouterBloc routerBloc,
  )   : _navigatorKey = navigatorKey,
        _routerBloc = routerBloc;

  List<Page> get _pages {
    if (_routerBloc.state is SplashState) return [SplashPage()];
    if (_routerBloc.state is LoginState) return [LoginPage()];
    if (_routerBloc.state is HomeState) return [HomePage()];
    if (_routerBloc.state is CreationState) return [CreationPage()];
    return List.empty();
  }

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        pages: _pages,
        onPopPage: _onPopPage,
        transitionDelegate: MainTransitionDelegate(),
      );

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) {
      return false;
    }

    return true;
  }

  @override
  Future<bool> popRoute() async {
    if (_routerBloc.state is CreationState) {
      _routerBloc.add(HomeEvent());
      return true;
    }
    return false;
  }

  @override
  Future<void> setNewRoutePath(RouteState configuration) async {}
}
