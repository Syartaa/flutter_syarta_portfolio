import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:syarta_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  var logger = Logger();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
              child: Form(
                key: formKey,
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
                              controller: _firstNameController,
                              validator: (text) {
                                if (text.toString().isEmpty) {
                                  return "First name is required";
                                }
                              },
                            ),
                            SizedBox(height: 15.0),
                            TextForm(
                                text: "Email",
                                Containerwidth: 350.0,
                                hintText: "Please type your email",
                                controller: _emailController,
                                validator: (text) {
                                  if (text.toString().isEmpty) {
                                    return "email is required";
                                  }
                                }),
                          ],
                        ),
                        Column(
                          children: [
                            TextForm(
                                text: "Last Name",
                                Containerwidth: 350,
                                hintText: "Please type your last name",
                                controller: _lastNameController,
                                validator: (text) {
                                  if (text.toString().isEmpty) {
                                    return "Last name is required";
                                  }
                                }),
                            SizedBox(height: 15.0),
                            TextForm(
                                text: "Phone number",
                                Containerwidth: 350.0,
                                hintText: "Please type your phone number",
                                controller: _phoneController,
                                validator: (text) {
                                  if (text.toString().isEmpty) {
                                    return "Phone number is required";
                                  }
                                }),
                          ],
                        )
                      ],
                    ),
                    TextForm(
                        text: "Message",
                        Containerwidth: widthDevice / 1.5,
                        hintText: "Please type your message",
                        controller: _messageController,
                        maxLines: 6,
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
                      minWidth: 200.0,
                      color: Colors.tealAccent,
                      child: SansBold("Submit", 20.0),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
