import 'package:bloc_app/domain/initialization/event.dart';
import 'package:bloc_app/domain/initialization/initialization_bloc.dart';
import 'package:bloc_app/domain/router/router_bloc.dart';
import 'package:bloc_app/domain/router/state.dart';
import 'package:bloc_app/router_delegate.dart';
import 'package:bloc_app/ui/theme/material_theme_data.dart';
import 'package:bloc_app/ui/theme/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Application extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => InitializationBloc()..add(Event()),
        ),
        BlocProvider(create: (context) => RouterBloc())
      ],
      child: MaterialApp(
        title: Strings.appName,
        // TODO: add check device dark\light mode
        theme: themeData(ThemeData.light()),
        home: _routers,
      ),
    );
  }

  Widget get _routers => BlocBuilder<RouterBloc, RouteState>(
        builder: (context, state) => Router(
          routerDelegate: RootRouterDelegate(
            navigatorKey,
            context.read<RouterBloc>(),
          ),
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      );

  ThemeData get _theme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
  }

  ThemeData themeData(ThemeData theme) {
    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        secondary: ThemeConfig.experimentalAccentColor,
      ),
      primaryColor: Colors.lightBlue[800],
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
      ),
      useMaterial3: true,
    );
  }
}
