// import 'package:flutter/material.dart';
// import 'package:hawk_fab_menu/hawk_fab_menu.dart';

// class MyHomePage1 extends StatefulWidget {
//   const MyHomePage1({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage1> createState() => _MyHomePage1State();
// }

// class _MyHomePage1State extends State<MyHomePage1> {
//   HawkFabMenuController hawkFabMenuController = HawkFabMenuController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Hawk Fab Menu Demo'),
//       ),
//       body: HawkFabMenu(
//         icon: AnimatedIcons.menu_arrow,
//         fabColor: Colors.yellow,
//         iconColor: Colors.green,
//         hawkFabMenuController: hawkFabMenuController,
//         items: [
//           HawkFabMenuItem(
//             label: 'Menu 1',
//             ontap: () {
//               ScaffoldMessenger.of(context).hideCurrentSnackBar();
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('Menu 1 selected')),
//               );
//             },
//             icon: const Icon(Icons.home),
//             color: Colors.red,
//             labelColor: Colors.blue,
//           ),
//           HawkFabMenuItem(
//             label: 'Menu 2',
//             ontap: () {
//               ScaffoldMessenger.of(context).hideCurrentSnackBar();
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('Menu 2 selected')),
//               );
//             },
//             icon: const Icon(Icons.comment),
//             labelColor: Colors.white,
//             labelBackgroundColor: Colors.blue,
//           ),
//           HawkFabMenuItem(
//             label: 'Menu 3 (default)',
//             ontap: () {
//               ScaffoldMessenger.of(context).hideCurrentSnackBar();
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('Menu 3 selected')),
//               );
//             },
//             icon: const Icon(Icons.add_a_photo),
//           ),
//         ],
//         body: const Center(
//           child: Text('Center of the screen'),
//         ),
//       ),
//     );
//   }
// }
