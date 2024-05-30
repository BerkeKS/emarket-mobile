import 'package:emarket_mobile/Pages/registerPage.dart';
import 'package:emarket_mobile/Service/userService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../Utils/marketDrawer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVerified = false;
  bool isPasswordVerified = false;
  bool isUsernameOptionSelected = true;
  bool isPasswordHidden = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget usernameField() {
    return TextFormField(
      decoration: InputDecoration(
          icon: const Icon(Icons.person),
          label: const Text("Username"),
          suffixIcon: (isVerified
              ? const Icon(Icons.check, color: Colors.black)
              : const SizedBox.shrink())),
      autovalidateMode: AutovalidateMode.always,
      controller: usernameController,
      validator: (value) {
        if (usernameController.text.isNotEmpty) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            setState(() {
              isVerified = true;
            });
          });
        } else {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            setState(() {
              isVerified = true;
            });
          });
          "This field can not be empty.";
        }
        return null;
      },
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
          icon: const Icon(Icons.email),
          label: const Text("Email"),
          suffixIcon: (isVerified
              ? const Icon(Icons.check, color: Colors.black)
              : const SizedBox.shrink())),
      autovalidateMode: AutovalidateMode.always,
      controller: emailController,
      validator: (value) {
        if (RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(emailController.text)) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            setState(() {
              isVerified = true;
            });
          });
        } else {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            setState(() {
              isVerified = true;
            });
          });
          "Enter a valid email.";
        }
        return null;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
          icon: const Icon(Icons.password),
          label: const Text("Password"),
          suffixIcon: IconButton(
              onPressed: () => setState(() {
                    isPasswordHidden = !isPasswordHidden;
                  }),
              icon: (isPasswordHidden)
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off))),
      autovalidateMode: AutovalidateMode.always,
      obscureText: isPasswordHidden,
      controller: passwordController,
      validator: (value) {
        if (passwordController.text.isNotEmpty) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            setState(() {
              isPasswordVerified = true;
            });
          });
        } else {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            setState(() {
              isPasswordVerified = true;
            });
          });
          "This field can not be empty.";
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MarketDrawer(),
        body: Builder(
          builder: (context) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const Icon(Icons.menu)),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 5),
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(196, 232, 210, 0.368)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 50),
                            child: (isUsernameOptionSelected)
                                ? usernameField()
                                : emailField(),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 50),
                            child: passwordField(),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  if (isVerified & isPasswordVerified) {
                                    if (isUsernameOptionSelected) {
                                      usernameLogin(usernameController.text,
                                          passwordController.text);
                                    } else {
                                      emailLogin(emailController.text,
                                          passwordController.text);
                                    }
                                  }
                                },
                                child: const Text("Login")),
                            TextButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterPage(),
                                    )),
                                child: const Text("Don't have an account?"))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
