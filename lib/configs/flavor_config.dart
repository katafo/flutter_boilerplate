import 'package:flutter/material.dart';

enum Flavor { 
  dev, 
  staging,
  production 
}

class FlavorValues {
  FlavorValues({@required this.baseUrl});
  final String baseUrl;
}

class FlavorConfig {
  
  final Flavor flavor;
  final FlavorValues values;
  static FlavorConfig instance;

  factory FlavorConfig({ 
    @required Flavor flavor,
    @required FlavorValues values
  }) {
    instance ??= FlavorConfig._internal(flavor, values);
    return instance;
  }

  FlavorConfig._internal(this.flavor, this.values);

}
