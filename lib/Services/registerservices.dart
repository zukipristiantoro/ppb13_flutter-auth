import 'package:firebase/Controller/user_controller.dart';
import 'package:flutter/material.dart';

class RegisterServices {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  void updateController(TextEditingController controller, String value) {
    controller.value = controller.value.copyWith(
      text: value,
      selection: TextSelection.collapsed(offset: value.length),
    );
  }

  UserController currentUser = UserController();

//  Future<bool> registerServicesToFirebase(String email, String password){
// }
}
