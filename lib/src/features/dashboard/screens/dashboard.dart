import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sales/src/features/common/services.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/bill_details.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  List<BillDetails>? bills;
  var isLoaded = false;


  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    bills = await Services().getBills();
    if(bills != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('Dashboard',
            style: TextStyle(color: Colors.white70),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white70),
              onPressed: () => {
                print('back click'),
                  Get.back(),
              } // Navigator.of(context).pop(),
          ),

          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  Get.toNamed("/login");
                });
              },
              icon: Icon(FontAwesomeIcons.rightFromBracket), color: Colors.white70,)
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              print('plus');
              Get.toNamed('/generateBill');

            });
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.black26,
        ),
        bottomNavigationBar:
            BottomAppBar(
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
                      // currentScreen = Dashboard();
                      // currentTab = 0;
                      // appBarValue = 'Dashboard';
                      Get.toNamed("/dashboard");
                    });
                  },
                  minWidth: 140,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.dashboard,
                        size: 30,
                        // color: currentTab == 0
                        //     ? Colors.white54
                        //     : Colors.black45,
                      ),
                      Text('Home',
                          style: TextStyle(
                              // color: currentTab == 0
                              //     ? Colors.white54
                              //     : Colors.black45
                          )
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      // currentScreen = Profile();
                      // currentTab = 1;
                      // appBarValue = 'Profile';
                      Get.toNamed("/profile");

                    });
                  },
                  minWidth: 140,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.idCard,
                          // color: currentTab == 1
                          //     ? Colors.white54
                          //     : Colors.black45
                      ),
                      Text(
                        'Profile',
                        // style: TextStyle(
                        //     color: currentTab == 1
                        //         ? Colors.white54
                        //         : Colors.black45),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
            itemCount: bills?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  dense: false,
                  title: Text(bills![index].billToName),
                  leading: Icon(FontAwesomeIcons.fileLines, size: 40),
                  subtitle: Text('Bill amount: ' + bills![index].billNo),
                  trailing: Icon(Icons.preview),
                  tileColor: Colors.teal[300],
                  onTap: () {
                    debugPrint('clicked');
                  },
                  onLongPress: () {},
                ),
              );
            },
          ),
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
  }
}
