// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:video_call/pages/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VideoConferrence',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SpScrn(),
    );
  }
}

class SpScrn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(
        seconds: 2,
        navigateAfterSeconds: const HomePage(),
        image: Image.asset("assets/logo.png"),
        title: Text(
          "Welcome to MeetIn",
          style: TextStyle(
            color: Colors.green,
            fontSize: 15,
          ),
        ),
        photoSize: 50,
        styleTextUnderTheLoader: const TextStyle(),
        loaderColor: Colors.green,
      ),
    );
  }
}
