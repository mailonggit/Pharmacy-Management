import 'package:flutter/cupertino.dart';
class User with ChangeNotifier {
  final String email;
  final String password;
  final String token;

  User({
    this.token,
    this.email,
    this.password,
  });
}
