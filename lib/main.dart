import 'package:flutter/material.dart';
import 'package:flutter_application_exam/controller/home_screen_controller.dart';
import 'package:flutter_application_exam/view/home_screen/home_screen.dart';
import 'package:flutter_application_exam/view/product_details_screen/product_details_screen.dart';
import 'package:flutter_application_exam/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
