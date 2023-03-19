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

  List<Widget> partners = [
    Image.asset('images/parteneri/horecano.png'),
    Image.asset('images/parteneri/immobiliari.png'),
    Image.asset('images/parteneri/trowit.png')
  ];

  @override
  Widget build(BuildContext context) {
    //   List<int> indexPartnerImg = [1,2,3].shuffle();

    // List<String> partnerImgLink = [
    //   'images/parteneri/horecano.png',
    //   'images/parteneri/immobiliari.png',
    //   'images/parteneri/trowit.png'
    // ].shuffle();
    partners.shuffle();
    return Scaffold(
        appBar: AppBar(title: Text("Unde sa donez?"), actions: [
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
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Unde sa donez? Iti raspundem la intrebare",
                    style: TextStyle(fontSize: 30)),
              ),
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
                        aspectRatio: 16 / 9),
                    items: homepageImages,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Parteneri", style: TextStyle(fontSize: 26)),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [...partners]),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Parteneri ONG-uri",
                          style: TextStyle(fontSize: 26)),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                              'images/parteneri/ong-uri/logo-autismvoce.png')
                        ]),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Parteneri media",
                          style: TextStyle(fontSize: 26)),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: []),
                  ],
                ),
              ),
              FooterComponent(),
            ],
          ),
        ));
  }
}
