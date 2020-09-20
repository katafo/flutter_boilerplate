import 'package:flutter/cupertino.dart';
import '../screens/event_details_screen.dart';
import 'route_name.dart';
import 'routes.dart';

class EventRoutes implements RouteInterface {

  @override
  CupertinoPageRoute routePage(RouteSettings settings) {
    return CupertinoPageRoute(
      settings: settings,
      builder: (context) {
        switch (settings.name) {
          case RouteName.eventDetails:
            return EventDetailsScreen();
          default:
            return Container();
        }
      }
    );
  }

}