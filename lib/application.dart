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
        BlocProvider(create: (context) => RouterBloc())
      ],
      child: MaterialApp(
        title: Strings.appName,
        // TODO: add check device dark\light mode. Reuse ThemeConfig[light|dark]
        theme: _themeLightData(ThemeData.light()),
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

  ThemeData _themeLightData(ThemeData theme) {
    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: ThemeConfig.experimentalAccentColor,
        // secondary: ThemeConfig.experimentalAccentColor,
        // onPrimary: ThemeConfig.experimentalAccentColor,
        // primaryContainer: ThemeConfig.experimentalAccentColor,
        // onPrimaryContainer: ThemeConfig.experimentalAccentColor,
        // onSecondary: ThemeConfig.experimentalAccentColor,
        // secondaryContainer: ThemeConfig.experimentalAccentColor,
        // onSecondaryContainer: ThemeConfig.experimentalAccentColor,
        // tertiary: ThemeConfig.experimentalAccentColor,
        // onTertiary: ThemeConfig.experimentalAccentColor,
        // tertiaryContainer: ThemeConfig.experimentalAccentColor,
        // onTertiaryContainer: ThemeConfig.experimentalAccentColor,
        // required this.error,
        // required this.onError,
        // Color? errorContainer,
        // Color? onErrorContainer,
        background: ThemeConfig.experimentalBackgroundColor,
        // onBackground: ThemeConfig.experimentalAccentColor,
        // surface: ThemeConfig.experimentalAccentColor,
        // onSurface: ThemeConfig.experimentalAccentColor,
        // surfaceVariant: ThemeConfig.experimentalAccentColor,
        onSurfaceVariant: ThemeConfig.experimentalTextColor,
        // outline: ThemeConfig.experimentalAccentColor,
        // outlineVariant: ThemeConfig.experimentalAccentColor,
        // shadow: ThemeConfig.experimentalAccentColor,
        // scrim: ThemeConfig.experimentalAccentColor,
        // inverseSurface: ThemeConfig.experimentalAccentColor,
        // onInverseSurface: ThemeConfig.experimentalAccentColor,
        // inversePrimary: ThemeConfig.experimentalAccentColor,
        // surfaceTint: ThemeConfig.experimentalAccentColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: ThemeConfig.experimentalAccentColor,
            foregroundColor: ThemeConfig.experimentalTertiary,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
      ),
      textTheme: const TextTheme(
        displayMedium: TextStyle(color: ThemeConfig.experimentalTextColor),
        displaySmall: TextStyle(color: ThemeConfig.experimentalTextColor),
        headlineMedium: TextStyle(color: ThemeConfig.experimentalTextColor),
        headlineSmall: TextStyle(color: ThemeConfig.experimentalTextColor),
        titleLarge: TextStyle(color: ThemeConfig.experimentalTextColor),
        titleMedium: TextStyle(color: ThemeConfig.experimentalTextColor),
        titleSmall: TextStyle(color: ThemeConfig.experimentalTextColor),
        bodyLarge: TextStyle(color: ThemeConfig.experimentalTextColor),
        bodyMedium: TextStyle(color: ThemeConfig.experimentalTextColor),
        bodySmall: TextStyle(color: ThemeConfig.experimentalTextColor),
        labelLarge: TextStyle(color: ThemeConfig.experimentalAccentColor),
        labelMedium: TextStyle(color: ThemeConfig.experimentalAccentColor),
        labelSmall: TextStyle(color: ThemeConfig.experimentalAccentColor),
      ),
      useMaterial3: true,
    );
  }
}
