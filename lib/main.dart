import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sales/src/features/authentication/screens/login.dart';
import 'package:sales/src/features/bills/screens/generateBill.dart';
import 'package:sales/src/features/dashboard/screens/dashboard.dart';
import 'package:sales/src/features/profile/screens/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int currentTab = 0;
  String appBarValue = 'Dashboard';
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();
  bool isLoginScreen = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/generate' : (BuildContext context)=>GenerateBill(),
      },
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(brightness: Brightness.light, primarySwatch: Colors.teal),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      title: 'Point Of Sales',
      home: Scaffold(
        appBar: !isLoginScreen
            ? AppBar(
                title: Text(
                  appBarValue,
                  style: TextStyle(color: Colors.white70),
                ),
                leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white70),
                    onPressed: () => {

                        } // Navigator.of(context).pop(),
                    ),
                actions: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isLoginScreen = true;
                          currentScreen = LoginPage();
                          currentTab = 4;
                        });
                      },
                      icon: Icon(FontAwesomeIcons.rightFromBracket), color: Colors.white70,)
                ],
              )
            : null,
        floatingActionButtonLocation: isLoginScreen == false
            ? FloatingActionButtonLocation.centerDocked
            : null,
        floatingActionButton: isLoginScreen == false
            ? FloatingActionButton(
                onPressed: () {
                  setState(() {
                    currentScreen = GenerateBill();
                    currentTab = 1;
                    appBarValue = 'Generate Bill';

                  });
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.black26,
              )
            : null,
        bottomNavigationBar: isLoginScreen == false
            ? BottomAppBar(
                shape: CircularNotchedRectangle(),
                notchMargin: 2,
                color: Colors.teal,
                child: Container(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            currentScreen = Dashboard();
                            currentTab = 0;
                            appBarValue = 'Dashboard';
                          });
                        },
                        minWidth: 140,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.dashboard,
                              size: 30,
                              color: currentTab == 0
                                  ? Colors.white54
                                  : Colors.black45,
                            ),
                            Text('Home',
                                style: TextStyle(
                                    color: currentTab == 0
                                        ? Colors.white54
                                        : Colors.black45))
                          ],
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            currentScreen = Profile();
                            currentTab = 1;
                            appBarValue = 'Profile';
                          });
                        },
                        minWidth: 140,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.idCard,
                                color: currentTab == 1
                                    ? Colors.white54
                                    : Colors.black45),
                            Text(
                              'Profile',
                              style: TextStyle(
                                  color: currentTab == 1
                                      ? Colors.white54
                                      : Colors.black45),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : null,
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
      ),
    );
  }
}
