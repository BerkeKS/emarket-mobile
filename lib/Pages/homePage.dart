import 'package:flutter/material.dart';

import '../Utils/marketDrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                icon: const Icon(Icons.menu))
          ],
        ),
      ),
    );
  }
}
