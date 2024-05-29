import 'package:emarket_mobile/Models/item.dart';
import 'package:emarket_mobile/Service/itemService.dart';
import 'package:emarket_mobile/Utils/marketDrawer.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MarketDrawer(),
      body: Builder(
        builder: (context) => Row(
          children: [
            IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(Icons.menu)),
            FutureBuilder<List<Item>>(
              future: getItems(),
              builder: (context, itemSnapshot) {
                if (itemSnapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (itemSnapshot.hasError) {
                  return Text(itemSnapshot.error.toString());
                }
                return GridView.builder(
                  itemCount: itemSnapshot.data!.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 3),
                  itemBuilder: (context, index) => Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Text(itemSnapshot.data![index].name),
                        Text(itemSnapshot.data![index].category),
                        Image.network(itemSnapshot.data![index].image!),
                        Text("Amount: ${itemSnapshot.data![index].amount}"),
                        Text(itemSnapshot.data![index].price.toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text("ADD TO BASKET"))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
