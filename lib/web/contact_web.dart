import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syarta_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
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
                    "assets/contact_image.jpg",
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
          body: SingleChildScrollView(
            child: Container(
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
          )),
    );
  }
}
