import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:syarta_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
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
      backgroundColor: Colors.white,
      drawer: DrawersWeb(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 25.0, color: Colors.black),
        title: TabsWebList(),
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
                        if (await addData.addResponce(
                            _firstNameController.text,
                            _lastNameController.text,
                            _emailController.text,
                            _phoneController.text,
                            _messageController.text)) {
                          formKey.currentState!.reset();
                          DialogError(context, "Message sent successtuly");
                        } else {
                          DialogError(context, "Message failed to sent");
                        }
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
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
