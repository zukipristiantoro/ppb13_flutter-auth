import 'package:firebase/Controller/user_controller.dart';

import 'package:firebase/Screen/signup.dart';
import 'package:firebase/Services/loginservices.dart';
import 'package:flutter/material.dart';

import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class LoginScreen extends StatelessWidget {
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  LoginScreen({
    super.key,
  });

  final LoginServices loginServices = LoginServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 60,
              ),
              TextField(
                controller: loginServices.emailContoller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Email"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: loginServices.passwordContoller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Password"),
              ),
              const SizedBox(
                height: 30,
              ),
              RoundedLoadingButton(
                  controller: btnController,
                  onPressed: () {
                    UserController().loginUser(
                        context,
                        loginServices.emailContoller.text,
                        loginServices.passwordContoller.text);
                  },
                  child: const Text(
                    "LogIn",
                    style: TextStyle(fontSize: 16),
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: const Text(
                      "SignUp",
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
