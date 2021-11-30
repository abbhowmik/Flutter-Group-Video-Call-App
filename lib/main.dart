// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:video_call/pages/home_page.dart';
import 'package:video_call/pages/login_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VideoConferrence',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SpScrn(),
    );
  }
}

class SpScrn extends StatelessWidget {
  const SpScrn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(
        seconds: 2,
        navigateAfterSeconds: const LoginPage(),
        image: Image.asset("assets/logo.png"),
        title: const Text(
          "Welcome to MeetIn",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        photoSize: 80,
        styleTextUnderTheLoader: const TextStyle(),
        loaderColor: Colors.pink,
      ),
    );
  }
}
