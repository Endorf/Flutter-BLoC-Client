import 'package:bloc_app/domain/creation/creation_bloc.dart';
import 'package:bloc_app/domain/initialization/event.dart';
import 'package:bloc_app/domain/initialization/initialization_bloc.dart';
import 'package:bloc_app/domain/router/router_bloc.dart';
import 'package:bloc_app/domain/router/state.dart';
import 'package:bloc_app/ui/navigation/router_delegate.dart';
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
        BlocProvider(create: (context) => RouterBloc()),
        BlocProvider(create: (context) => CreationBloc())
      ],
      child: MaterialApp(
        title: Strings.appName,
        theme: ThemeConfig.themeData(ThemeData.light()),
        darkTheme: ThemeConfig.themeData(ThemeData.dark()),
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
}
