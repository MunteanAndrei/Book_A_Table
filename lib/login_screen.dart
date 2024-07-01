// login_screen.dart
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final Function(bool) onLogin;

  LoginScreen({required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            onLogin(true); // semnalizează că autentificarea a avut succes
          },
          child: Text('Log In'),
        ),
      ),
    );
  }
}
