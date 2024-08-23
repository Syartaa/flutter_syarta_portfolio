import 'package:flutter/material.dart';
import 'package:syarta_portfolio/mobile/landing_page_mobile.dart';
import 'package:syarta_portfolio/web/landing_page_web.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return LandingPageWeb();
          } else {
            return LandingPageMobile();
          }
        },
      ),
    );
  }
}
