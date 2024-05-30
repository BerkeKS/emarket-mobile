import 'package:emarket_mobile/Pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../Models/user.dart';
import '../Service/userService.dart';
import '../Utils/marketDrawer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isUsernameVerified = false;
  bool isEmailVerified = false;
  bool isPasswordVerified = false;
  bool isFullnameVerified = false;
  bool isAgeVerified = false;
  bool isUsernameOptionSelected = true;
  bool isPasswordHidden = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  Widget usernameField() {
    return TextFormField(
      decoration: InputDecoration(
          icon: const Icon(Icons.person),
          label: const Text("Username"),
          suffixIcon: (isUsernameVerified
              ? const Icon(Icons.check, color: Colors.black)
              : const SizedBox.shrink())),
      autovalidateMode: AutovalidateMode.always,
      controller: usernameController,
      validator: (value) {
        if (usernameController.text.isNotEmpty) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            setState(() {
              isUsernameVerified = true;
            });
          });
        } else {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            setState(() {
              isUsernameVerified = false;
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
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          icon: const Icon(Icons.email),
          label: const Text("Email"),
          suffixIcon: (isEmailVerified
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
              isEmailVerified = true;
            });
          });
        } else {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            setState(() {
              isEmailVerified = false;
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
        if (RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^a-zA-Z\d]).{8,}")
            .hasMatch(passwordController.text)) {
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
          "Password must have at least 8 characters, an uppercase letter, a lowercase letter, a number and a special character.";
        }
        return null;
      },
    );
  }

  Widget fullnameField() {
    return TextFormField(
      decoration: InputDecoration(
          icon: const Icon(Icons.person),
          label: const Text("Full Name"),
          suffixIcon: (isFullnameVerified
              ? const Icon(Icons.check, color: Colors.black)
              : const SizedBox.shrink())),
      autovalidateMode: AutovalidateMode.always,
      controller: fullnameController,
      validator: (value) {
        if (fullnameController.text.isNotEmpty) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            setState(() {
              isFullnameVerified = true;
            });
          });
        } else {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            setState(() {
              isFullnameVerified = false;
            });
          });
          "This field can not be empty.";
        }
        return null;
      },
    );
  }

  Widget ageField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          icon: const Icon(Icons.person),
          label: const Text("Age"),
          suffixIcon: (isAgeVerified
              ? const Icon(Icons.check, color: Colors.black)
              : const SizedBox.shrink())),
      autovalidateMode: AutovalidateMode.always,
      controller: ageController,
      validator: (value) {
        if (ageController.text.isNotEmpty) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            setState(() {
              isAgeVerified = true;
            });
          });
        } else {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            setState(() {
              isAgeVerified = false;
            });
          });
          "Please enter a numeric value.";
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
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 50),
                            child: usernameField(),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 50),
                            child: emailField(),
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
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 50),
                            child: fullnameField(),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 50),
                            child: ageField(),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  if (isUsernameVerified &
                                      isEmailVerified &
                                      isPasswordVerified &
                                      isFullnameVerified &
                                      isAgeVerified) {
                                    User user = User(
                                        usernameController.text,
                                        emailController.text,
                                        passwordController.text,
                                        fullnameController.text,
                                        int.parse(ageController.text));
                                    register(user);
                                  }
                                },
                                child: const Text("Login")),
                            TextButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    )),
                                child: const Text("Already have an account?"))
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
