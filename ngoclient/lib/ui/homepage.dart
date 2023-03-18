import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/providers/user_provider.dart';
import 'screens/categories_screen.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Unde donam?"), actions: [
          ElevatedButton.icon(
            onPressed: () {
              Provider.of<UserModel>(context, listen: false).loginDonator();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CategoriesScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.person,
            ),
            label: Text('Logare Donator'), // <-- Text
          ),
          ElevatedButton.icon(
            onPressed: () {
              Provider.of<UserModel>(context, listen: false).loginNGO();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CategoriesScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.people,
            ),
            label: Text('Logare ONG'), // <-- Text
          ),
          ElevatedButton.icon(
            onPressed: () {
              Provider.of<UserModel>(context, listen: false).loginCompany();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CategoriesScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.business,
            ),
            label: Text('Logare Companie'), // <-- Text
          ),
        ]),
        body: Column(
          children: [],
        ));
  }
}
