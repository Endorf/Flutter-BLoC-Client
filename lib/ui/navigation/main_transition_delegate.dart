import 'package:bloc_app/ui/theme/resources/pages.dart';
import 'package:flutter/material.dart';

class MainTransitionDelegate extends TransitionDelegate<void> {
  @override
  Iterable<RouteTransitionRecord> resolve(
      {required List<RouteTransitionRecord> newPageRouteHistory,
      required Map<RouteTransitionRecord?, RouteTransitionRecord>
          locationToExitingPageRoute,
      required Map<RouteTransitionRecord?, List<RouteTransitionRecord>>
          pageRouteToPagelessRoutes}) {
    final List<RouteTransitionRecord> results = <RouteTransitionRecord>[];

    for (final RouteTransitionRecord pageRoute in newPageRouteHistory) {
      if (pageRoute.isWaitingForEnteringDecision) {
        pageRoute.markForPush();
      }
      results.add(pageRoute);
    }
    for (final RouteTransitionRecord exitingPageRoute
        in locationToExitingPageRoute.values) {
      // TODO: create validation
      if (allowedPageAnimation(exitingPageRoute)) {
        exitingPageRoute.markForComplete();
      } else {
        exitingPageRoute.markForPop();
      }
      // exitingPageRoute.markForPop();

      final List<RouteTransitionRecord>? pagelessRoutes =
          pageRouteToPagelessRoutes[exitingPageRoute];
      if (pagelessRoutes != null) {
        for (final RouteTransitionRecord pagelessRoute in pagelessRoutes) {
          pagelessRoute.markForRemove();
        }
      }
      results.add(exitingPageRoute);
    }
    return results;
  }

  bool allowedPageAnimation(RouteTransitionRecord exitingPageRoute) {
    return exitingPageRoute.route.settings.name != Pages.splash;
  }
}
