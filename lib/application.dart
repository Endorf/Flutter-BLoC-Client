import 'package:bloc_app/domain/initialization/event.dart';
import 'package:bloc_app/domain/initialization/initialization_bloc.dart';
import 'package:bloc_app/ui/screen/home/home.dart';
import 'package:bloc_app/ui/screen/home/creation/creation.dart';
import 'package:bloc_app/ui/screen/home/list/list.dart';
import 'package:bloc_app/ui/screen/login/login.dart';
import 'package:bloc_app/ui/screen/splash/splash.dart';
import 'package:bloc_app/ui/theme/material_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Application extends StatelessWidget {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (context) => InitializationBloc()..add(Event()),
          ),
        ],
        child: MaterialApp.router(
          theme: ThemeConfig.themeData(ThemeData.light()),
          darkTheme: ThemeConfig.themeData(ThemeData.dark()),
          debugShowCheckedModeBanner: true,
          routerConfig: GoRouter(
            navigatorKey: _rootNavigatorKey,
            initialLocation: '/splash',
            redirect: (context, state) {
              if (state.path == '/') {
                return '/splash';
              }
              return null;
            },
            debugLogDiagnostics: true,
            routes: [
              _buildSplashRoute(),
              _buildLoginRoute(),
              _buildHomeRoute(),
            ],
          ),
        ));
  }

  GoRoute _buildSplashRoute() {
    return GoRoute(
      path: '/splash',
      pageBuilder: (context, state) {
        return MaterialPage(
          restorationId: 'route.splash',
          fullscreenDialog: true,
          child: SplashScreen(onInitialization: (index) {
            if (index == 0) {
              context.go('/home');
            } else {
              context.go('/login');
            }
          }),
        );
      },
    );
  }

  GoRoute _buildLoginRoute() {
    return GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/login',
      pageBuilder: (context, state) {
        return MaterialPage(
          restorationId: 'route.login',
          fullscreenDialog: true,
          child: LoginScreen(
            onLogin: () {
              context.go('/home');
            },
          ),
        );
      },
    );
  }

  ShellRoute _buildHomeRoute() {
    return ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return MaterialPage(
            restorationId: 'router.home',
            child: RootScreen(
              child: child,
              onFabClick: () {
                context.push('/home/creation');
              },
            ),
          );
        },
        routes: [
          GoRoute(
              path: '/home',
              pageBuilder: (context, state) {
                return const MaterialPage(
                  restorationId: 'route.home',
                  child: ListScreen(),
                );
              },
              routes: [
                GoRoute(
                  path: 'creation',
                  pageBuilder: (context, state) {
                    return MaterialPage(
                      restorationId: 'route.home.creation',
                      child: CreationScreen(
                        onCreate: () {
                          context.pop('/home');
                        },
                      ),
                    );
                  },
                )
              ]),
        ]);
  }
}
