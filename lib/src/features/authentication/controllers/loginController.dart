import 'package:get/get.dart';
import 'package:sales/src/features/authentication/models/login.dart';
import 'package:sales/src/features/common/services.dart';

class LoginController extends GetxController {
  Services services = Services();

  void login( String userName, String password) {
    Login login = Login(userName: userName, password: password);
    // print(userName);
    // print(password);
    // services.bill(login);
    Get.toNamed("/dashboard");
  }
}