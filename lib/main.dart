// import 'package:consumindo_api/src/shared/utils/app_colors.dart';
import 'package:consumindo_api/route_generator.dart';
import 'package:flutter/material.dart';

// import 'src/views/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: RouteGenerator.generateRoute,
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const HomePage(),
      // },
    );
  }
}
