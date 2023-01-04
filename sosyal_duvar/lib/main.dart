import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sosyal_duvar/constants/colors.dart';
import 'package:sosyal_duvar/constants/get_pages_constants.dart';
import 'package:sosyal_duvar/constants/route_constants.dart';
import 'package:sosyal_duvar/ui/views/dene.dart';
import 'package:sosyal_duvar/ui/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
            appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: kWriteColor,
          toolbarTextStyle: TextStyle(color: Color.fromARGB(255, 136, 56, 50)),
        )),
        debugShowCheckedModeBanner: false,
        getPages: Pages.pages,
        initialRoute: Routes.HomeScreen,
        home: Dene());
  }
}
