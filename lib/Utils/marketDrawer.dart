import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Pages/loginPage.dart';
import '../Pages/registerPage.dart';

class MarketDrawer extends StatelessWidget {
  const MarketDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 0, 63, 2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 100),
                child: Icon(
                  FontAwesomeIcons.cartShopping,
                  size: MediaQuery.of(context).size.width / 35,
                  color: const Color.fromRGBO(202, 255, 202, 1),
                ),
              ),
              const Text(
                "E-Market",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          const Divider(
            color: Colors.grey,
          ),
          TextButton.icon(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  )),
              icon: const Icon(
                Icons.person_add_sharp,
                color: Colors.white,
              ),
              label: const Text(
                "Register",
                style: TextStyle(color: Colors.white),
              )),
          TextButton.icon(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  )),
              icon: const Icon(
                Icons.lock_open,
                color: Colors.white,
              ),
              label: const Text(
                "Login",
                style: TextStyle(color: Colors.white),
              )),
          IconButton(
              onPressed: () async {
                await launchUrl(Uri.parse("https://www.instagram.com/"));
              },
              icon: const Icon(
                FontAwesomeIcons.instagram,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () async {
                await launchUrl(Uri.parse("https://www.twitter.com/"));
              },
              icon: const Icon(
                FontAwesomeIcons.xTwitter,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
