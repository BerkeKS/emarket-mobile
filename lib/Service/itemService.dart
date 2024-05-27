import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/item.dart';

Future<List<Item>> getItems() async {
  var res = await http.get(Uri.parse("http://localhost:5123/items"));
  if (res.statusCode == 200) {
    List<Item> items = [];
    var jsonResponse = jsonDecode(utf8.decode(res.bodyBytes));
    for (var i in jsonResponse) {
      Item item =
          Item(i["name"], i["image"], i["category"], i["amount"], i["price"]);
      items.add(item);
    }
    return items;
  } else {
    throw "Server error!";
  }
}
