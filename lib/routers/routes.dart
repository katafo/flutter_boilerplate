import 'package:flutter/cupertino.dart';

import '../modules/enviroment_screen.dart';
import '../modules/event/event_routes.dart';
import 'route_name.dart';

// ignore: one_member_abstracts
abstract class RouteInterface {
  CupertinoPageRoute routePage(RouteSettings settings);
}

class Routes implements RouteInterface {

  final _eventRoutes = EventRoutes();

  @override
  CupertinoPageRoute routePage(RouteSettings settings) {

    switch (_groupName(settings.name)) {
      case RouteName.event:
        return _eventRoutes.routePage(settings);

      default: //initial
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => EnvironmentScreen()
        );
    }

  }

  String _groupName(String routeName) {
    final splitNames = routeName.split('/');
    if (splitNames.length >= 1) {
      return '/${splitNames[1]}';
    }
    return routeName;
  }

}