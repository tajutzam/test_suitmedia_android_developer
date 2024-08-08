import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_suitmedia/const/route.dart';
import 'package:test_suitmedia/controllers/home_controller.dart';
import 'package:test_suitmedia/controllers/user_controller.dart';
import 'package:test_suitmedia/pages/home.dart';
import 'package:test_suitmedia/pages/second.dart';
import 'package:test_suitmedia/pages/thrid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: [
        GetPage(
          name: MyRoute.home,
          page: () => Home(),
          binding: InitialScreenBindings(), // Binding untuk Home
        ),
        GetPage(
          name: MyRoute.second,
          page: () => SecondScreen(
            name: Get.parameters['name']!,
          ),
          binding: InitialScreenBindings(), // Binding untuk Home
        ),
        GetPage(
          name: MyRoute.thrid,
          page: () => const ThridScreen(),
          binding: InitialScreenBindings(), // Binding untuk Home
        ),
      ],
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily!,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: MyRoute.home,
      initialBinding: RootBinding(),
    );
  }
}

class InitialScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(UserController());
  }
}

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
