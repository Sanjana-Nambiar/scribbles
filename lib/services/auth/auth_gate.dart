import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:messaging_app/services/auth/login_or_resgister.dart";
import "package:messaging_app/pages/welcome_page.dart";

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return WelcomePage();
          } else {
            return const LoginOrRegister();
          }
        },
        )
    );
  }
}