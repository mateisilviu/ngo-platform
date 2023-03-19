import 'package:flutter/material.dart';
import 'package:ngoclient/core/util/responsive.dart';
import 'package:ngoclient/dashboard/constants/responsive.dart';
import 'package:provider/provider.dart';

import '../core/providers/user_provider.dart';
import '../dashboard/screens/dash_board_screen.dart';
import 'footer/footer.dart';
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
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => DashBoardScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.business,
            ),
            label: Text('Logare Companie'), // <-- Text
          ),
        ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
              ),
              FooterComponent(),
            ],
          ),
        ));
  }
}
