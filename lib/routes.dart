import 'package:flutter/material.dart';
import 'package:syarta_portfolio/mobile/landing_page_mobile.dart';
import 'package:syarta_portfolio/web/landing_page_web.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(builder: (context, constrains) {
            if (constrains.maxWidth > 800) {
              return LandingPageWeb();
            } else {
              return LandingPageMobile();
            }
          }),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => LayoutBuilder(builder: (context, constrains) {
            if (constrains.maxWidth > 800) {
              return LandingPageWeb();
            } else {
              return LandingPageMobile();
            }
          }),
        );
    }
  }
}
