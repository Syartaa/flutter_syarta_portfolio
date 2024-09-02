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
        drawer: DrawersWeb(),
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
                title: TabsWebList(),
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
