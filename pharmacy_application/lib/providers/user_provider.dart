// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:pharmacy_application/models/user.dart';

// class UserProvider with ChangeNotifier {
//   List<User> _users = [];

//   final String token;
//   List<User> get users {
//     return [..._users];
//   }

//   UserProvider(this.token, this._users);
//   Future<void> fetchAndSetUsers() async {
//     final url =
//         'https://pharmacy-management-36ca9-default-rtdb.firebaseio.com/users/$token.json?auth=$token';
//     final response = await http.get(url);

//     final List<User> loadedUsers = [];
//     final extractedData = json.decode(response.body) as Map<String, dynamic>;
//     if (extractedData == null) {
//       return;
//     }
//     extractedData.forEach((userId, userData) {
//       loadedUsers.add(
//         User(
//           token: userId,
//           email: userData['email'],
//           password: userData['password'],
//         ),
//       );
//     });

//     _users = loadedUsers;
//     print('fetch users successfully');
//     notifyListeners();
//   }

//   Future<void> addUser(String newEmail, String newPassword) async {
//     final url =
//         'https://pharmacy-management-36ca9-default-rtdb.firebaseio.com/usres/$token.json?auth=$token';
//     final response = await http.post(
//       url,
//       body: json.encode(
//         {
//           'email': newEmail,
//           'password': newPassword,
//         },
//       ),
//     );
//     _users.insert(
//       0,
//       User(
//         token: json.decode(response.body)['name'],
//         email: newEmail,
//         password: newPassword,
//       ),
//     );
//     notifyListeners();
//   }
// }
