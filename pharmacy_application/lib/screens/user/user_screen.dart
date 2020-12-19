// import 'package:flutter/material.dart';
// import 'package:pharmacy_application/providers/user_provider.dart';
// import 'package:pharmacy_application/screens/user/single_user.dart';
// import 'package:provider/provider.dart';

// class UserScreen extends StatelessWidget {
//   static const routeName = '/user-screen';
//   @override
//   Widget build(BuildContext context) {
//     final userData = Provider.of<UserProvider>(context, listen: true);
//     final users = userData.users;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('List Of User'),
//         backgroundColor: Colors.red[900],
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           color: Colors.black,
//         ),
//       ),
//       body: FutureBuilder(
//         future: Provider.of<UserProvider>(context, listen: false)
//             .fetchAndSetUsers(),
//         builder: (_, dataSnapshot) {
//           if (dataSnapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             return Consumer<UserProvider>(
//               builder: (ctx, userData, child) => ListView.builder(
//                 itemCount: users.length,
//                 itemBuilder: (ctx, i) => SingleUser(
//                   userData.users[i],
//                   i + 1,
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
