import 'package:flutter/material.dart';
import 'src/views/pages/details_page.dart';
import 'src/views/pages/home_page.dart';

class RouteGenerator {
  // ignore: non_constant_identifier_names
  static Route<dynamic> generateRoute(RouteSettings setting) {
    final args = setting.arguments;

    switch (setting.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const HomePage());
      case '/details':
        if (args is int) {
          return MaterialPageRoute(
            builder: (context) => DetailsMoviePage(
              idMovie: args,
            ),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return const Scaffold(
            body: Center(
          child: Text('Error'),
        ));
      },
    );
  }
}
