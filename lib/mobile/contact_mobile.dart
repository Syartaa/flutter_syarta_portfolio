import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

import 'package:url_launcher/url_launcher.dart';

import '../components.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
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
      endDrawer: DrawersMobile(),
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
          child: Form(
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
                  minWidth: widthDevice / 2.2,
                  color: Colors.tealAccent,
                  child: SansBold("Submit", 20.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
