import 'package:flutter/cupertino.dart';

import '../../routers/route_name.dart';
import '../../routers/routes.dart';
import 'event_details_screen.dart';

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