// main.dart
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'home_screen.dart';
import 'restaurant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      home: AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatefulWidget {
  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  bool isAuthenticated = false;

  void onLogin(bool success) {
    setState(() {
      isAuthenticated = success;
    });
  }

  void onLogout() {
    setState(() {
      isAuthenticated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isAuthenticated) {
      return HomeScreen(
        restaurants: [
          Restaurant(name: 'Bella Italia', cuisine: 'Italian', address: 'Oriunde dar nu în Italia', backgroundImage: '\assets/pizza.jpeg'),
          Restaurant(name: 'Marele Restaurant Chinezesc', cuisine: 'Restaurant Chinezesc', address: 'Clar nu în China', backgroundImage: '\assets/restaurant chinezesc.jpeg'),
          Restaurant(name: 'Bucurii Marine', cuisine: 'Fructe de Mare', address: 'Undeva la munte', backgroundImage: '\assets/Fructe de Mare.jpeg'),
          Restaurant(name: 'Steak și Gust', cuisine: 'SteakHouse', address: 'Vegan Street', backgroundImage: '\assets/steak.jpeg'),
          Restaurant(name: 'ColibaCuPește', cuisine: 'Pește', address: 'PrinDeșert', backgroundImage: '\assets/restaurant de peste.jpeg'),
          Restaurant(name: 'Delicii Regale', cuisine: 'Fine Dining', address: 'Ferentari', backgroundImage: '\assets/Fine Dining.jpeg'),
          Restaurant(name: 'Pofta de Dulce Café', cuisine: 'Cafenea&Patiserie', address: 'Piața Badea Cârțan', backgroundImage: '\assets/Cafenea si patiserie.jpeg'),
          

          // adaugă alte restaurante
        ],
        onLogout: onLogout,
      );
    } else {
      return LoginScreen(onLogin: onLogin);
    }
  }
}
