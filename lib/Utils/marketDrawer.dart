import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MarketDrawer extends StatelessWidget {
  const MarketDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 0, 63, 2),
      child: Column(
        children: [
          IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ,)), icon: Icon(Icons.person_add)),
          IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ,)), icon: Icon(Icons.lock_open)),
          IconButton(onPressed: () =>, icon: Icon(FontAwesomeIcons.instagram))
        ],
      ),
    );
  }
}
