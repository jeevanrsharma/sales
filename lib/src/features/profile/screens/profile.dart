import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        body:
        Container(
          decoration: BoxDecoration(
            color: Colors.teal[200],
            // image: DecorationImage(
            //     image: AssetImage('assets/images/profileBg2.jpg'), fit: BoxFit.cover
            // )
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/login.png'),
                    radius: 40.0,
                  ),
                ),
                Divider(
                  height: 90.0,
                  color: Colors.grey[800],
                ),
                Text(
                  'Name',
                  style: TextStyle(
                    color: Colors.black45,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Cheeku',
                  style: TextStyle(
                    color: Colors.white60,
                    letterSpacing: 2.0,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Birth Date',
                  style: TextStyle(
                    color: Colors.black45,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  '06/11/21',
                  style: TextStyle(
                    color: Colors.white60,
                    letterSpacing: 2.0,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Age',
                  style: TextStyle(
                    color: Colors.black45,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  '10 Months',
                  style: TextStyle(
                    color: Colors.white60,
                    letterSpacing: 2.0,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                SizedBox(height: 10.0),
                // Row(
                //   children: <Widget>[
                //     Icon(
                //       Icons.baby,
                //       color: Colors.grey[400],
                //     ),
                //     Text(
                //       'jeevansneha@gmail.com',
                //       style: TextStyle(
                //         color: Colors.grey[400],
                //         fontSize: 18.0,
                //         letterSpacing: 1.0,
                //       ),
                //     )
                //   ],
                // )
              ],
            ),
          ),
        ),
      );


  }
}
