import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syarta_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  Widget urlLauncher(String imgPath, String url) {
    return IconButton(
      icon: SvgPicture.asset(
        imgPath,
        color: Colors.black,
        width: 35,
      ),
      onPressed: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        } else {
          throw 'Could not launch $url';
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 72,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage("assets/profilePhoto.jpg"),
              ),
            ),
            SizedBox(height: 15.0),
            SansBold("Syarta Pajaziti", 30.0),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                urlLauncher("assets/instagram.svg",
                    "https://www.instagram.com/tomcruise/"),
                urlLauncher(
                    "assets/twitter.svg", "https://www.twitter.com/tomcruise/"),
                urlLauncher("assets/github.svg", "https://www.github.com/"),
              ],
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 25.0, color: Colors.black),
        title: Row(children: [
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
        ]),
      ),
      body: ListView(
        children: [
          //First section
          Container(
            height: heightDevice - 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: SansBold("Hello I'am", 15.0),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SansBold("Syarta Pajaziti", 55.0),
                    Sans("Flutter developer", 30.0),
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(
                          width: 20.0,
                        ),
                        Sans("syartapajaziti@gmail,com", 15.0)
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.call),
                        SizedBox(
                          width: 20.0,
                        ),
                        Sans("+01 234 256", 15.0)
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(Icons.location_pin),
                        SizedBox(
                          width: 20.0,
                        ),
                        Sans("Gjilan", 15.0)
                      ],
                    ),
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
                      backgroundImage: AssetImage("assets/profilePhoto.jpg"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //second section
          Container(
            height: heightDevice / 1.5,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/web.jpg",
                    height: heightDevice / 1.9,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SansBold("About me", 40.0),
                      SizedBox(
                        height: 15.0,
                      ),
                      Sans(
                          "Flutter developer passionate about building high-performance, cross-platform mobile apps.",
                          15.0),
                      Sans(
                          " Skilled in Dart and experienced in creating intuitive user experiences.",
                          15.0),
                      Sans(
                          " Currently interning at Progtelx to further enhance my skills",
                          15.0),
                      SizedBox(
                        height: 10.0,
                      ),
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
                ]),
          ),
          //third section
          Container(
            height: heightDevice / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold("What I do?", 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      text: "Web developer",
                      imagePath: "assets/webL.png",
                    ),
                    AnimatedCard(
                      text: "App developer",
                      imagePath: "assets/app.png",
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                    AnimatedCard(
                      text: "Back-end developer",
                      imagePath: "assets/firebase.png",
                    ),
                  ],
                )
              ],
            ),
          ),
          //forth section
          Container(
            height: heightDevice,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold("Contact me", 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        TextForm(
                          Containerwidth: 350,
                          text: "First Name",
                          hintText: "Please type your first name",
                        ),
                        SizedBox(height: 15.0),
                        TextForm(
                            text: "Email",
                            Containerwidth: 350.0,
                            hintText: "Please type your email"),
                      ],
                    ),
                    Column(
                      children: [
                        TextForm(
                            text: "Last Name",
                            Containerwidth: 350,
                            hintText: "Please type your last name"),
                        SizedBox(height: 15.0),
                        TextForm(
                          text: "Phone number",
                          Containerwidth: 350.0,
                          hintText: "Please type your phone number",
                        ),
                      ],
                    )
                  ],
                ),
                TextForm(
                    text: "Message",
                    Containerwidth: widthDevice / 1.5,
                    hintText: "Please type your message",
                    maxLines: 6),
                MaterialButton(
                  onPressed: () {},
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  height: 60.0,
                  minWidth: 200.0,
                  color: Colors.tealAccent,
                  child: SansBold("Submit", 20.0),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
