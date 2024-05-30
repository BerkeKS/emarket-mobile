import 'package:http/http.dart' as http;

import '../Models/user.dart';

Future<void> register(User user) async {
  var res = await http.post(Uri.parse("http://localhost:5123/register"), body: {
    "username": user.username,
    "email": user.email,
    "password": user.password,
    "fullname": user.fullName,
    "age": user.age
  });
  if (res.statusCode == 200) {}
}

Future<void> usernameLogin(String username, String password) async {
  var res =
      await http.post(Uri.parse("http://localhost:5123/usernamelogin"), body: {
    "username": username,
    "password": password,
  });
  if (res.statusCode == 200) {}
}

Future<void> emailLogin(String email, String password) async {
  var res =
      await http.post(Uri.parse("http://localhost:5123/emaillogin"), body: {
    "email": email,
    "password": password,
  });
  if (res.statusCode == 200) {}
}
