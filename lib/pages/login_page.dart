import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:video_call/provider/google_sign_in.dart';

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
          'Login',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(left: 34, right: 34),
            child: ElevatedButton.icon(
              icon: FaIcon(
                FontAwesomeIcons.google,
                color: Colors.blueAccent,
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(13),
                primary: Colors.red.withOpacity(0.7),
                onPrimary: Colors.black,
                minimumSize: Size(double.infinity, 50),
              ),
              label: Text(
                "  Sign In With Google",
                style: TextStyle(
                    fontSize: 18, fontFamily: GoogleFonts.lato().fontFamily),
              ),
              onPressed: () {
                signIn(context);
              },
            ),
          ),
        ),
      ),
    );
  }

  Future signIn(BuildContext context) async {
    final provider =
        await Provider.of<GoogleSignInProvider>(context, listen: false);
    provider.googleLogin();
  }
}
