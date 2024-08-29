import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:url_launcher/url_launcher.dart';

import '../components.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
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
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 400.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(size: 35.0, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/contact_image.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 25.0),
          child: Wrap(
            runSpacing: 20.0,
            spacing: 20.0,
            alignment: WrapAlignment.center,
            children: [
              SansBold("Contact me", 35.0),
              TextForm(
                  text: "First Name",
                  Containerwidth: widthDevice / 1.4,
                  hintText: "Please enter first name"),
              TextForm(
                  text: "Last Name",
                  Containerwidth: widthDevice / 1.4,
                  hintText: "Please enter last name"),
              TextForm(
                  text: "Email",
                  Containerwidth: widthDevice / 1.4,
                  hintText: "Please enter email"),
              TextForm(
                  text: "Phone number",
                  Containerwidth: widthDevice / 1.4,
                  hintText: "Please enter phone number"),
              TextForm(
                text: "Message",
                Containerwidth: widthDevice / 1.4,
                hintText: "message",
                maxLines: 10,
              ),
              MaterialButton(
                onPressed: () {},
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
      ),
    );
  }
}
