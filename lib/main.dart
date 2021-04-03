import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hope_doctor/bloc/default.dart';
import 'package:hope_doctor/screens/splash-screen.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  // Register all the models and services before the app starts

  await DotEnv().load('.env');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runZoned<Future<Null>>(() async {
      runApp(new MyApp());
    },);
  });
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainBloc>(
      create: (context) => MainBloc(),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: MaterialApp(
          title: 'Hope Doctor',
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          navigatorObservers: [],
        ),
      ),
    );
  }
}
