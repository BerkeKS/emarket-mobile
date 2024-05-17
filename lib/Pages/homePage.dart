import 'package:emarket_mobile/Utils/marketDrawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MarketDrawer(),
      body: Column(),
    );
  }
}
