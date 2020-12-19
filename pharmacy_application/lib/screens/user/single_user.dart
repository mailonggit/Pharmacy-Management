// import 'package:flutter/material.dart';
// import 'package:pharmacy_application/models/user.dart';

// class SingleUser extends StatelessWidget {
//   final User user;
//   final int orderNumber;
//   SingleUser(this.user, this.orderNumber);
//   @override
//   Widget build(BuildContext context) {
//     final scaffold = Scaffold.of(context);
//     return Row(
//       children: <Widget>[
//         CircleAvatar(
//           child: Icon(
//             Icons.person,
//             color: Colors.white,
//             size: 10,
//           ),
//           maxRadius: 40,
//         ),
//         Column(
//           children: <Widget>[
//             Text(
//               'Email: ${user.email}',
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               'Password: ${user.password}',
//               style: TextStyle(fontSize: 20),
//             ),
//           ],
//         ),
//         IconButton(
//           icon: Icon(
//             Icons.delete,
//             size: 30,
//             color: Colors.black,
//           ),
//           onPressed: () async {
//             try {
//               // await Provider.of<UserProvider>(context, listen: false)
//               //     .deleteProduct(this.id);
//             } catch (error) {
//               scaffold.showSnackBar(
//                 SnackBar(
//                   content: Text(
//                     'Deleting fail',
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               );
//             }
//           },
//         ),
//       ],
//     );
//   }
// }
