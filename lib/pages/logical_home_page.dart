import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:video_call/pages/home_page.dart';
import 'package:video_call/pages/login_page.dart';

class LogicalHomePage extends StatelessWidget {
  const LogicalHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            print("Going to Homepage");
            return HomePage();
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Something Went Wrong"),
            );
          } else {
            print("Going to LoginPage");
            return LoginPage();
          }
        },
      ),
    );
  }
}
