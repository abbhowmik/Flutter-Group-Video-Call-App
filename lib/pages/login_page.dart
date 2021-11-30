import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.38,
        centerTitle: true,
        title: Text(
          'Login ',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.only(left: 29, right: 29),
              child: Image.asset(
                "assets/signIn.png",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
