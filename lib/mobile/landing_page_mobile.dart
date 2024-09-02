import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:syarta_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
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

  var logger = Logger();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 35.0, color: Colors.black),
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DrawerHeader(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.0, color: Colors.black),
                ),
                child: Image.asset('assets/image=circle.png'),
              ),
            ),
            TabsMobile(text: "Home", route: '/'),
            SizedBox(height: 20.0),
            TabsMobile(text: "About", route: '/about'),
            SizedBox(height: 20.0),
            TabsMobile(text: "Works", route: '/works'),
            SizedBox(height: 20.0),
            TabsMobile(text: "Blog", route: '/blog'),
            SizedBox(height: 20.0),
            TabsMobile(text: "Contact", route: '/contact'),
            SizedBox(height: 40.0),
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
      body: ListView(
        children: [
          //first section intro
          CircleAvatar(
            radius: 117.0,
            backgroundColor: Colors.tealAccent,
            child: CircleAvatar(
              radius: 110.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/image=circle.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          )),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: SansBold("Hi I am", 15.0),
                    ),
                    SansBold("Syarta Pajaziti", 40.0),
                    SansBold("Flutter developer", 20.0)
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 3.0,
                      children: [
                        Icon(Icons.email),
                        Icon(Icons.call),
                        Icon(Icons.location_pin),
                      ],
                    ),
                    SizedBox(width: 40.0),
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 8.0,
                      children: [
                        Sans("syartapajaziti@gmail,com", 15.0),
                        Sans("+01 234 256", 15.0),
                        Sans("Gjilan, nr.13", 15.0)
                      ],
                    )
                  ],
                )
              ],
            ),
          ),

          SizedBox(height: 90.0),
          //second section about me
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SansBold("About me", 35.0),
                Sans(
                    "Flutter developer passionate about building high-performance, cross-platform mobile apps.",
                    15.0),
                Sans(
                    " Skilled in Dart and experienced in creating intuitive user experiences.",
                    15.0),
                Sans(
                    " Currently interning at Progtelx to further enhance my skills",
                    15.0),
                SizedBox(height: 10.0),
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
          SizedBox(height: 60.0),
          //third section What i do
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SansBold("What I do?", 35.0),
              AnimatedCard(
                text: "Web developer",
                imagePath: "assets/webL.png",
                width: 300.0,
              ),
              SizedBox(height: 35.0),
              AnimatedCard(
                text: "App developer",
                imagePath: "assets/app.png",
                fit: BoxFit.contain,
                reverse: true,
                width: 300.0,
              ),
              SizedBox(height: 35.0),
              AnimatedCard(
                text: "Back-End developer",
                imagePath: "assets/firebase.png",
                width: 300.0,
              ),
              SizedBox(height: 60.0),
              //Contact forth section
              Form(
                key: formKey,
                child: Wrap(
                  runSpacing: 20.0,
                  spacing: 20.0,
                  alignment: WrapAlignment.center,
                  children: [
                    SansBold("Contact me", 35.0),
                    TextForm(
                      text: "First Name",
                      Containerwidth: widthDevice / 1.4,
                      hintText: "Please enter first name",
                      controller: _firstNameController,
                      validator: (text) {
                        if (text.toString().isEmpty) {
                          return "First name is required";
                        }
                      },
                    ),
                    TextForm(
                        text: "Last Name",
                        Containerwidth: widthDevice / 1.4,
                        hintText: "Please enter last name",
                        controller: _lastNameController,
                        validator: (text) {
                          if (text.toString().isEmpty) {
                            return "Last name is required";
                          }
                        }),
                    TextForm(
                        text: "Email",
                        Containerwidth: widthDevice / 1.4,
                        hintText: "Please enter email",
                        controller: _emailController,
                        validator: (text) {
                          if (text.toString().isEmpty) {
                            return "email is required";
                          }
                        }),
                    TextForm(
                        text: "Phone number",
                        Containerwidth: widthDevice / 1.4,
                        hintText: "Please enter phone number",
                        controller: _phoneController,
                        validator: (text) {
                          if (text.toString().isEmpty) {
                            return "Phone number is required";
                          }
                        }),
                    TextForm(
                        text: "Message",
                        Containerwidth: widthDevice / 1.4,
                        hintText: "message",
                        controller: _messageController,
                        maxLines: 10,
                        validator: (text) {
                          if (text.toString().isEmpty) {
                            return "Message is required";
                          }
                        }),
                    MaterialButton(
                      onPressed: () async {
                        logger.d(_firstNameController.text);
                        final addData = new AddDataFirestore();
                        if (formKey.currentState!.validate()) {
                          await addData.addResponce(
                              _firstNameController.text,
                              _lastNameController.text,
                              _emailController.text,
                              _phoneController.text,
                              _messageController.text);
                          formKey.currentState!.reset();
                          DialogError(context);
                        }
                      },
                      elevation: 20.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      height: 60.0,
                      minWidth: widthDevice / 2.2,
                      color: Colors.tealAccent,
                      child: SansBold("Submit", 20.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0)
            ],
          )
        ],
      ),
    );
  }
}
