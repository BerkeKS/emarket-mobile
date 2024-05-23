import 'package:flutter/material.dart';

import '../Utils/marketDrawer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVerified = false;
  bool isUsernameOptionSelected = true;
  bool isPasswordHidden = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget usernameField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.always,
      controller: usernameController,
      validator: (value) {
        if (usernameController.text.isNotEmpty) {
          setState(() {
            isVerified = true;
          });
        } else {
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
          setState(() {
            isVerified = true;
          });
        } else {
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
          setState(() {
            isVerified = true;
          });
        } else {
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
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(196, 232, 210, 0.368)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      (isUsernameOptionSelected)
                          ? usernameField()
                          : emailField(),
                      passwordField(),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Login"))
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
