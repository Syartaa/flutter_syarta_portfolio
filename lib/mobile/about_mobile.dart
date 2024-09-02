import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(size: 35.0, color: Colors.black),
        ),
        endDrawer: DrawersMobile(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              //indrudoction
              CircleAvatar(
                radius: 117.0,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  radius: 113.0,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      "assets/image=circle.png",
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SansBold("About me", 35.0),
                    SizedBox(height: 10.0),
                    Sans(
                        "Flutter developer passionate about building high-performance, cross-platform mobile apps.",
                        15.0),
                    Sans(
                        "Skilled in Dart and experienced in creating intuitive user experiences.",
                        15.0),
                    Sans(
                        "Currently interning at Progtelx to further enhance my skills",
                        15.0),
                    SizedBox(height: 15.0),
                    Wrap(
                      spacing: 7.0,
                      runSpacing: 7.0,
                      children: [
                        SkillMobile(text: "Flutter"),
                        SkillMobile(text: "Web"),
                        SkillMobile(text: "Ios"),
                        SkillMobile(text: "Android"),
                        SkillMobile(text: "Windows"),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 40.0),

              //Web development, second section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(
                    imagePath: "assets/webL.png",
                    width: 200.0,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SansBold("Web development", 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              Sans(
                  "I am here to build your presence online with state of the art web apps",
                  15.0),

              //App developmet
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(
                    imagePath: "assets/app.png",
                    width: 200.0,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SansBold("App development", 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              Sans(
                  "Do you need a high-performance, respoisve and beautiful app. Dont worry, I have you covered.",
                  15.0),

              //back-end
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(
                    imagePath: "assets/firebase.png",
                    width: 200.0,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SansBold("Back-end development", 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              Sans(
                  "I am here to build your presence online with state of the art web apps",
                  15.0),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
