import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales/sample.dart';
import 'package:sales/src/features/authentication/models/login.dart';
import 'package:sales/src/features/bills/screens/generateBill.dart';
import 'package:sales/src/features/dashboard/screens/dashboard.dart';
import 'package:sales/src/features/profile/screens/profile.dart';

import 'src/features/authentication/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
      ThemeData(brightness: Brightness.light, primarySwatch: Colors.teal),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      title: 'Flutter Demo',
      initialRoute: "/login",
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/dashboard', page: () => Dashboard()),
        GetPage(name: '/profile', page: () => Profile()),
        GetPage(name: '/generateBill', page: () => GenerateBill()),
      ],
      home: Scaffold(
        appBar: AppBar(title: Text('Getx')),
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    // Get.toNamed("/home");
                  },
                  child: Text('Go to home'))
            ],
          ),
        ),
      ),
    );
  }
}