import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class TabsWeb extends StatefulWidget {
  final tittle;
  final route;
  const TabsWeb({super.key, this.tittle, this.route});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
          //print("Entered");
        },
        onExit: (_) {
          setState(() {
            isSelected = false;
          });
          //print("Exit");
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(microseconds: 100),
          curve: Curves.elasticIn,
          style: isSelected
              ? GoogleFonts.roboto(
                  shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(0, -5),
                      ),
                    ],
                  color: Colors.transparent,
                  fontSize: 25.0,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationColor: Colors.tealAccent)
              : GoogleFonts.roboto(color: Colors.black, fontSize: 20.0),
          child: Text(
            widget.tittle,
          ),
        ),
      ),
    );
  }
}

class TabsWebList extends StatefulWidget {
  const TabsWebList({super.key});

  @override
  State<TabsWebList> createState() => _TabsWebListState();
}

class _TabsWebListState extends State<TabsWebList> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class TabsMobile extends StatefulWidget {
  final text;
  final route;
  const TabsMobile({super.key, @required this.text, @required this.route});

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: 20.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        height: 50.0,
        minWidth: 200.0,
        color: Colors.black,
        child: Text(
          widget.text,
          style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(widget.route);
        });
  }
}

class DrawersWeb extends StatefulWidget {
  const DrawersWeb({super.key});

  @override
  State<DrawersWeb> createState() => _DrawersWebState();
}

class _DrawersWebState extends State<DrawersWeb> {
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
    return Drawer(
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
    );
  }
}

class DrawersMobile extends StatefulWidget {
  const DrawersMobile({super.key});

  @override
  State<DrawersMobile> createState() => _DrawersMobileState();
}

class _DrawersMobileState extends State<DrawersMobile> {
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
    return Drawer(
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
    );
  }
}

class SansBold extends StatelessWidget {
  final text;
  final size;
  const SansBold(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class Sans extends StatelessWidget {
  final text;
  final size;
  const Sans(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size),
    );
  }
}

class TextForm extends StatelessWidget {
  final text;
  final Containerwidth;
  final hintText;
  final maxLines;
  final controller;
  final validator;

  const TextForm(
      {super.key,
      @required this.text,
      @required this.Containerwidth,
      @required this.hintText,
      this.maxLines,
      this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Sans(text, 16.0),
          SizedBox(height: 5.0),
          SizedBox(
            width: Containerwidth,
            child: TextFormField(
              validator: validator,
              controller: controller,
              maxLines: maxLines == null ? null : maxLines,
              decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.tealAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                hintText: hintText,
                hintStyle: GoogleFonts.poppins(fontSize: 14.0),
              ),
            ),
          ),
        ])
      ],
    );
  }
}

class AnimatedCard extends StatefulWidget {
  final imagePath;
  final text;
  final fit;
  final reverse;
  final height;
  final width;
  const AnimatedCard(
      {super.key,
      this.text,
      @required this.imagePath,
      this.fit,
      this.reverse,
      this.height,
      this.width});

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);

  late Animation<Offset> _animation = Tween(
    begin: widget.reverse == true ? Offset(0, 0.08) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : Offset(0, 0.08),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.tealAccent),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                height: widget.height == null ? 200.0 : widget.height,
                width: widget.width == null ? 200.0 : widget.width,
                fit: widget.fit == null ? null : widget.fit,
              ),
              SizedBox(
                height: 10.0,
              ),
              widget.text == null ? SizedBox() : SansBold(widget.text, 15.0),
            ],
          ),
        ),
      ),
    );
  }
}

class SkillMobile extends StatefulWidget {
  final String text; // Ensure type safety by declaring text as String
  const SkillMobile({super.key, required this.text});

  @override
  _SkillMobileState createState() => _SkillMobileState();
}

class _SkillMobileState extends State<SkillMobile> {
  bool _isHovered = false; // State to track hover status

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        decoration: BoxDecoration(
          color: _isHovered
              ? Colors.tealAccent
              : Colors.transparent, // Change background color on hover
          border: Border.all(
            color: Colors.tealAccent,
            style: BorderStyle.solid,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.all(7.0),
        child: Text(
          widget
              .text, // Using widget.text to access the text property of the SkillMobile widget
          style: GoogleFonts.openSans(fontSize: 15.0),
        ),
      ),
    );
  }
}

class SkillWeb extends StatefulWidget {
  final String text; // Ensure type safety by declaring text as String
  const SkillWeb({super.key, required this.text});

  @override
  _SkillWebState createState() => _SkillWebState();
}

class _SkillWebState extends State<SkillWeb> {
  bool _isHovered = false; // State to track hover status

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        decoration: BoxDecoration(
          color: _isHovered
              ? Colors.tealAccent
              : Colors.transparent, // Change background color on hover
          border: Border.all(
            color: Colors.tealAccent,
            style: BorderStyle.solid,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: EdgeInsets.all(7.0),
        child: Sans(widget.text,
            15.0), // Using widget.text to access the text property of the SkillWeb widget
      ),
    );
  }
}

class AbelCustom extends StatelessWidget {
  final text;
  final size;
  final color;
  final fontWeight;

  const AbelCustom(
      {super.key,
      @required this.text,
      @required this.size,
      this.color,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
          fontSize: size,
          color: color == null ? Colors.black : color,
          fontWeight: fontWeight == null ? FontWeight.normal : fontWeight),
    );
  }
}

class AddDataFirestore {
  var logger = Logger();
  CollectionReference response =
      FirebaseFirestore.instance.collection("messages");
  Future addResponce(final firstName, final lastName, final email,
      final phoneNumber, final message) async {
    return response.add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'phone number': phoneNumber,
      'message': message,
    }).then((value) {
      logger.d("Success");
      return true;
    }).catchError((error) {
      logger.d(error);
      return false;
    });
  }
}

Future DialogError(BuildContext context, String title) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: SansBold(title, 20.0),
          ));
}

//validation example
// inputFormatters: [
//   LengthLimitingTextInputFormatter(10),
//   FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
// ],
// validator: (text) {
// if (RegExp("\\bsyarta\\b", caseSensitive: false)
//     .hasMatch(text.toString())) {
// return "Match Found";
// }
// },
// autovalidateMode: AutovalidateMode.onUserInteraction,
