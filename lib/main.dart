import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:taxi_chrono_web/routes/route_generators.dart';
import 'package:taxi_chrono_web/views/login_view.dart';
import 'package:taxi_chrono_web/views/signup_view.dart';

import 'localizations/localization.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  HttpOverrides.global= MyHttpoverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
        apiKey: "AIzaSyB_bnIXrbMvREa0rRxG7ETc_qhk3sE1tP4",
        authDomain: "taxi-chrono-firebase.firebaseapp.com",
        databaseURL: "https://taxi-chrono-firebase-default-rtdb.europe-west1.firebasedatabase.app",
        projectId: "taxi-chrono-firebase",
        storageBucket: "taxi-chrono-firebase.appspot.com",
        messagingSenderId: "255452747282",
        appId: "1:255452747282:web:e16042cda78093a499eacb"
    ),
  );
  runApp(const MyApp());
}

class MyHttpoverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: "Taxi Chrono",
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('fr', 'FR')
      ],
      localeResolutionCallback:
          (Locale? locale, Iterable<Locale> supportedLocales) {
        for (Locale supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode ||
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      initialRoute: LoginView.pageName,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Inter',
          disabledColor: Colors.white,
          brightness: Brightness.light,
          primaryColorDark: const Color(0xFF343434),
          primaryColor: Colors.yellow,
          primaryColorLight: Colors.white,
          errorColor: Colors.red,
          textTheme: TextTheme(
              titleLarge: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              titleSmall: TextStyle(color: Colors.grey[700])),
          appBarTheme: const AppBarTheme(
              color: Colors.black,)),
    );
  }


}
