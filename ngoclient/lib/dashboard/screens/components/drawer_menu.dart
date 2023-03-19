import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'drawer_list_tile.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(appPadding),
            child: Image.asset("images/logowithtext.png"),
          ),
          DrawerListTile(
              title: 'Dash Board',
              svgSrc: 'icons/Dashboard.svg',
              tap: () {
                print('You Click Dash Board');
              }),
          DrawerListTile(
              title: 'Blog Post', svgSrc: 'icons/BlogPost.svg', tap: () {}),
          DrawerListTile(
              title: 'Message', svgSrc: 'icons/Message.svg', tap: () {}),
          DrawerListTile(
              title: 'Statistics', svgSrc: 'icons/Statistics.svg', tap: () {}),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding * 2),
            child: Divider(
              color: grey,
              thickness: 0.2,
            ),
          ),
          DrawerListTile(
              title: 'Settings', svgSrc: 'icons/Setting.svg', tap: () {}),
          DrawerListTile(
              title: 'Logout', svgSrc: 'icons/Logout.svg', tap: () {}),
        ],
      ),
    );
  }
}
