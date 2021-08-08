import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/cubit/app_cubit.dart';
import '../app/cubit/app_state.dart';
import '../configs/flavor_config.dart';
import '../routers/route_name.dart';

class EnvironmentScreen extends StatelessWidget {
  const EnvironmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<AppCubit>();

    return Scaffold(
      appBar: AppBar(
          title:
              Text('Environment ${FlavorConfig.instance?.flavor.toString()}')),
      body: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
        return Center(
            child: ElevatedButton(
                child: Text(
                  'Event Details',
                  style: appCubit.styles.defaultTextStyle(),
                ),
                onPressed: () =>
                    {Navigator.pushNamed(context, RouteName.eventDetails)}));
      }),
    );
  }
}
