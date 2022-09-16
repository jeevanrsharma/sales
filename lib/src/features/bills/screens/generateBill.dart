import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenerateBill extends StatefulWidget {
  const GenerateBill({Key? key}) : super(key: key);

  @override
  State<GenerateBill> createState() => _GenerateBillState();
}

class _GenerateBillState extends State<GenerateBill> {
  final productNameCtr = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
        Center(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else {
                              return null;
                            }
                          },
                          controller: productNameCtr,
                          decoration: InputDecoration(
                            labelText: 'Product Name',
                            prefixIcon: Icon(Icons.verified_outlined),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        myButton(context),
                      ],
                    ))
              ],
            ),
          ),
        ),
      );

  }

  OutlinedButton myButton(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        // if (_formKey.currentState!.validate()) {
        //   formData.productName = productNameCtr.text;
        //   // formData.isTopProduct = listCheckVal;
        //   Navigator.push(context, MaterialPageRoute(builder: (context) {
        //     return formDetails(formData: formData);
        //   }));
        // }
      },
      child: Text('Form submission'),
    );
  }
}
