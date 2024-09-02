import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: DrawersWeb(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 25.0, color: Colors.black),
        title: TabsWebList(),
      ),
      body: ListView(
        children: [
          //About me
          SizedBox(
            height: 500.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 40.0),
                    SizedBox(height: 15.0),
                    Sans("Hello I am Syarta I specialize i flutter development",
                        15.0),
                    Sans(
                        "I strive to esure astounding performances with state of",
                        15.0),
                    Sans("the art security for Android, Ios, Web, Mac, Linux",
                        15.0),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        SkillWeb(text: "Flutter"),
                        SizedBox(
                          width: 7.0,
                        ),
                        SkillWeb(text: "Web"),
                        SizedBox(
                          width: 7.0,
                        ),
                        SkillWeb(text: "Android"),
                        SizedBox(
                          width: 7.0,
                        ),
                        SkillWeb(text: "Ios"),
                        SizedBox(
                          width: 7.0,
                        ),
                        SkillWeb(text: "Windows"),
                      ],
                    )
                  ],
                ),
                CircleAvatar(
                  radius: 147.0,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 143.0,
                    child: CircleAvatar(
                      radius: 140.0,
                      child: Image.asset(
                        "assets/image=circle.png",
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(
                imagePath: "assets/webL.png",
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold("Web development", 30.0),
                    SizedBox(height: 15.0),
                    Sans(
                        "I am here to build your presence online with state of the art web apps",
                        15.0),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold("App development", 30.0),
                    SizedBox(height: 15.0),
                    Sans(
                        "Do you need a high-performance, respoisve and beautiful app. Dont worry, I have you covered.",
                        15.0),
                  ],
                ),
              ),
              AnimatedCard(
                imagePath: "assets/app.png",
                height: 250.0,
                width: 250.0,
              ),
            ],
          ),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(
                imagePath: "assets/firebase.png",
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold("Back-end development", 30.0),
                    SizedBox(height: 15.0),
                    Sans(
                        "I am here to build your presence online with state of the art web apps",
                        15.0),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
