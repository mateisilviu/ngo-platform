import 'package:flutter/material.dart';
import 'dart:html' as html;

import '../../core/util/responsive.dart';
import 'social-links.dart';

class FooterComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? buildMobileFooter(context)
        : buildDesktopFooter(context);
  }

  Widget buildDesktopFooter(BuildContext context) {
    return Container(
        height: 360,
        width: double.infinity,
        child: (Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 10,
              thickness: 5,
              color: Color(Colors.blue.value),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 100),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildLogo(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [...buildMenu(context)],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [...buildInfo()],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        //  crossAxisAlignment: CrossAxisAlignment.start,
                        children: [...buildCompany(context)],
                      ),
                    ])),
            Divider(
              height: 10,
              thickness: 5,
              color: Color(Colors.blue.value),
            ),
            SocialLinks()
          ],
        )));
  }

  Widget buildLogo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: AspectRatio(
          aspectRatio: 2.63,
          child: Container(
            //width: 618,
            //height: 235,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'))),
            child: Container(),
          ),
        ),
      ),
    );
  }

  List<Widget> buildMenu(BuildContext context) {
    return [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Text("Meniu", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: Text("Misiunea noastra"),
      ),
      Padding(
          padding: EdgeInsets.all(5),
          child: InkWell(
            onTap: () => {
              // NavigatorService(context)
              //     .pushReplacementNamed(HowToScreen.routeName)
            },
            child: Text(
              'Cum functioneaza platforma',
            ),
          )),
      Padding(
        padding: EdgeInsets.all(5),
        child: Text("Doneaza 2% ca persoana fizica"),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: Text("Doneaza 20% ca persoana juridica"),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: Text("Statistici"),
      )
    ];
  }

  List<Widget> buildInfo() {
    return [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Text("Info", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: Text("Politica de confidentialitate"),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: Text("Cookie folosite de site"),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: Text("Conditii de utilizare site"),
      )
    ];
  }

  List<Widget> buildCompany(BuildContext context) {
    return [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Text("Unde Donam ONG",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: InkWell(
            onTap: () => {
                  // NavigatorService(context)
                  //     .pushReplacementNamed(FaqScreen.routeName)
                },
            child: Text("Intrebari frecvente")),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: Text("Despre noi"),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: Text("Suport"),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: InkWell(
            onTap: () => {},
            //{html.window.open("https://blog.immoequityfund.com/", "_self")},
            child: Text("Blog")),
      ),
      Padding(
        padding: EdgeInsets.all(5),
        child: Text("Contact"),
      )
    ];
  }

  Widget buildMobileFooter(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: 20,
        ),
        Divider(
          height: 10,
          thickness: 5,
          color: Color(Colors.blue.value),
        ),
        buildLogo(),
        ...buildMenu(context),
        ...buildInfo(),
        ...buildCompany(context),
        Divider(
          height: 10,
          thickness: 5,
          color: Color(Colors.blue.value),
        ),
        SocialLinks(
          isMobile: true,
        )
      ]),
    );
  }
}
