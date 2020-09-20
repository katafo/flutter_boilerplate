import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localizations/app_localization.dart';
import 'localizations/bloc/app_language_bloc.dart';
import 'localizations/bloc/app_language_state.dart';

import 'routers/route_name.dart';
import 'routers/routes.dart';
import 'theme.dart';

class App extends StatefulWidget {

  @override
  _AppState createState() => _AppState();
}

// ignore: prefer_mixin
class _AppState extends State<App> with WidgetsBindingObserver {

  final AppLanguageBloc appLanguageBloc = AppLanguageBloc();
  final Routes routes = Routes();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    appLanguageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppLanguageBloc(),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          //Hide keyboard when tap outside
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        },
        child: BlocBuilder<AppLanguageBloc, AppLanguageState>(
          builder: (context, state) {
            return MaterialApp(
              locale: 
                (state is AppLanguageFetchLocaleCompleted) 
                ? state.locale 
                : Locale('en'),
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              theme: AppTheme().primary,
              initialRoute: RouteName.initial,
              onGenerateRoute: routes.routePage,
            );
          },
        ),
      ),
    ); 
  }
}