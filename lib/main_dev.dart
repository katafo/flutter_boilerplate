import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'commons/utils/simple_bloc_delegate.dart';
import 'configs/flavor_config.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  FlavorConfig(
    flavor: Flavor.dev, 
    values: FlavorValues(baseUrl: 'https://abc.com/api')
  );
  runApp(App());
}