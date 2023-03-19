import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ngoclient/core/util/responsive.dart';
import 'package:ngoclient/dashboard/constants/responsive.dart';
import 'package:provider/provider.dart';

import '../core/providers/user_provider.dart';
import '../dashboard/screens/dash_board_screen.dart';
import 'footer/footer.dart';
import 'screens/categories_screen.dart';

class HomePageScreen extends StatelessWidget {
  var homepageImages = [
    Image(image: AssetImage('images/homepage/donate1_1024.jpg')),
    Image(image: AssetImage('images/homepage/donate2_1024.jpg')),
    Image(image: AssetImage('images/homepage/donate3_1024.jpg')),
  ];

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 800,
                  child: CarouselSlider(
                    //carouselController: _controller,
                    options: CarouselOptions(
                        pauseAutoPlayOnManualNavigate: false,
                        pauseAutoPlayOnTouch: false,
                        viewportFraction: 1.0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 4),
                        autoPlayAnimationDuration: Duration(seconds: 1),
                        autoPlayCurve: Curves.slowMiddle,
                        aspectRatio: 1),
                    items: homepageImages,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
              ),
              FooterComponent(),
            ],
          ),
        ));
  }
}
