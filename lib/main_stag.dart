import 'package:flutter/material.dart';

import 'app/app.dart';
import 'configs/flavor_config.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.staging, 
    values: FlavorValues(baseUrl: 'https://abc.com/api')
  );
  runApp(App());
}