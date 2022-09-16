import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales/src/features/authentication/controllers/loginController.dart';

import '../../common/services.dart';
import '../models/login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final loginController = Get?.put(LoginController());

  final _formKey = GlobalKey<FormState>();

  Login login = Login(userName: '', password: '');

  @override
  Widget build(BuildContext context) {
    return
      Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/loginTeal.jpg'), fit: BoxFit.cover
              )
          ),
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 50),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Point Of Sales',
                          style: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )),
                    SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'This field cannot be blank!';
                          } else {
                            return null;
                          }
                        },
                        controller: nameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'User Name',
                            prefixIcon: Icon(Icons.person)
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'This field cannot be blank!';
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        controller: passwordController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock)

                        ),
                      ),
                    ),
                    SizedBox(height: 30),

                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          child: const Text.rich(TextSpan(
                              children: [
                                TextSpan(text: 'Login ', style: TextStyle(fontSize: 20, color: Colors.white70)),

                                WidgetSpan(child: Icon(Icons.login, color: Colors.white70,)),
                              ]
                          )),
                          onPressed: () {
                            if(_formKey.currentState!.validate()){
                            }

                            if(nameController.text != '' && passwordController.text != ''){
                              print(nameController.text);
                              print(passwordController.text);

                              loginController?.login(nameController.text, passwordController.text);

                            }


                          },
                        )),
                    Row(
                      children: <Widget>[
                        const Text('Does not have account?', style: TextStyle(color: Colors.white30),),
                        TextButton(
                          child: const Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20, color: Colors.white54),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ],
                ),
              )),
        );
  }
  getData(String userName, String password) async {
    Login login = Login(userName: userName, password: password);
    var resp = await Services().bill(login);
    if(resp != null){
      setState(() {
        // isLoaded = true;
      });
    }
  }

}
