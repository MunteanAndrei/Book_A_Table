import 'package:flutter/material.dart';
import 'reservation_screen.dart';
import 'restaurant.dart';

class HomeScreen extends StatelessWidget {
  final List<Restaurant> restaurants;
  final Function() onLogout;

  HomeScreen({required this.restaurants, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants'),
        actions: [
          IconButton(
            onPressed: () {
              onLogout(); // semnalizează că utilizatorul s-a deconectat
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(restaurants[index].name),
            subtitle: Text('${restaurants[index].cuisine} - ${restaurants[index].address}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReservationScreen(restaurant: restaurants[index])),
              );
            },
            // Verificare pentru backgroundImage
            leading: restaurants[index].backgroundImage != null
                ? Image.asset(
                    restaurants[index].backgroundImage!, // Utilizează ! pentru a elimina avertismentul null safety
                    fit: BoxFit.cover, // Poți ajusta cum se potrivește imaginea în caseta de vizualizare
                  )
                : null, // Dacă nu există backgroundImage, nu setați nici o imagine
          );
        },
      ),
    );
  }
}
