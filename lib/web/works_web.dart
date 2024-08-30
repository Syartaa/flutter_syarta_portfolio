import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';

class WorksWeb extends StatefulWidget {
  const WorksWeb({super.key});

  @override
  State<WorksWeb> createState() => _WorksWebState();
}

class _WorksWebState extends State<WorksWeb> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 72.0,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  radius: 70.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/profilePhoto.jpg"),
                ),
              ),
              SizedBox(height: 15.0),
              SansBold("Syarta Pajaziti", 30.0),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () async {
                      await launchUrl(Uri.parse('https://www.instagram.com/'));
                    },
                    icon: SvgPicture.asset(
                      "assets/instagram.svg",
                      color: Colors.black,
                      width: 35.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await launchUrl(Uri.parse('https://www.github.com/'));
                    },
                    icon: SvgPicture.asset(
                      "assets/github.svg",
                      color: Colors.black,
                      width: 35.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await launchUrl(Uri.parse('https://www.twitter.com/'));
                    },
                    icon: SvgPicture.asset(
                      "assets/twitter.svg",
                      color: Colors.black,
                      width: 35.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 600.0,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(size: 25.0, color: Colors.black),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/works.jpg",
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                title: Row(
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    TabsWeb(
                      tittle: "Home",
                      route: '/',
                    ),
                    Spacer(),
                    TabsWeb(
                      tittle: "Works",
                      route: '/works',
                    ),
                    Spacer(),
                    TabsWeb(
                      tittle: "Blog",
                      route: '/blog',
                    ),
                    Spacer(),
                    TabsWeb(
                      tittle: "About",
                      route: '/about',
                    ),
                    Spacer(),
                    TabsWeb(
                      tittle: "Contact",
                      route: '/contact',
                    ),
                    Spacer(),
                  ],
                ),
              )
            ];
          },
          body: ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: 30.0),
                  SansBold("Works", 40.0),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedCard(
                        imagePath: "assets/work1.png",
                        height: 200.0,
                        width: 300.0,
                      ),
                      SizedBox(
                        width: widthDevice / 3,
                        child: Column(
                          children: [
                            SansBold("Portfolio", 30.0),
                            SizedBox(height: 15.0),
                            Sans(
                                "Deployed on Android,Ios and Web, the portfolio project was truly an achievement.I used Flutter to develop the beautiful and responsive UI and Firebase for the back-end",
                                15.0)
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: widthDevice / 2,
                        child: Column(
                          children: [
                            SansBold("Portfolio", 30.0),
                            SizedBox(height: 15.0),
                            Sans(
                                "Deployed on Android,Ios and Web, the portfolio project was truly an achievement.I used Flutter to develop the beautiful and responsive UI and Firebase for the back-end",
                                15.0)
                          ],
                        ),
                      ),
                      AnimatedCard(
                        imagePath: "assets/work1.png",
                        height: 200.0,
                        width: 300.0,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
