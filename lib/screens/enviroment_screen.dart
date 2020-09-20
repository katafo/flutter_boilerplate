import 'package:flutter/material.dart';
import '../configs/flavor_config.dart';
import '../routers/route_name.dart';

class EnvironmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        'Environment ${FlavorConfig.instance.flavor.toString()}')
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('Event Details'),
            onPressed: () => {
              Navigator.pushNamed(context, RouteName.eventDetails)
          })
        )
      ),
    );
  }
}