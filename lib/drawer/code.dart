// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// //
// // // function to trigger app build
// // void main() => runApp(const MyApp());
// //
// // class MyApp extends StatelessWidget {
// //   final appTitle = 'Flutter Drawer Demo';
// //
// //   const MyApp({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return GetMaterialApp(
// //       title: appTitle,
// //       home: MyHomePagedrawer(title: appTitle),
// //     ); // MaterialApp
// //   }
// // }
// //
// // class MyHomePagedrawer extends StatelessWidget {
// //   final String title;
// //
// //   const MyHomePagedrawer({Key? key, required this.title}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(title),
// //         backgroundColor: Colors.green,
// //       ),
// //
// //       drawer: Drawer(
// //         child: ListView(
// //           padding: const EdgeInsets.all(0),
// //           children: [
// //             const DrawerHeader(
// //               decoration: BoxDecoration(
// //                 color: Colors.green,
// //               ), //BoxDecoration
// //               child: UserAccountsDrawerHeader(
// //                 decoration: BoxDecoration(color: Colors.green),
// //                 accountName: Text(
// //                   "Abhishek Mishra",
// //                   style: TextStyle(fontSize: 18),
// //                 ),
// //                 accountEmail: Text("abhishekm977@gmail.com"),
// //                 currentAccountPictureSize: Size.square(50),
// //                 currentAccountPicture: CircleAvatar(
// //                   backgroundColor: Color.fromARGB(255, 165, 255, 137),
// //                   child: Text(
// //                     "A",
// //                     style: TextStyle(fontSize: 30.0, color: Colors.blue),
// //                   ), //Text
// //                 ), //circleAvatar
// //               ), //UserAccountDrawerHeader
// //             ), //DrawerHeader
// //             ListTile(
// //               leading: const Icon(Icons.person),
// //               title: const Text(' My Profile '),
// //               onTap: () {
// //                 Navigator.pop(context);
// //               },
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.book),
// //               title: const Text(' My Course '),
// //               onTap: () {
// //                 Navigator.pop(context);
// //               },
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.workspace_premium),
// //               title: const Text(' Go Premium '),
// //               onTap: () {
// //                 Navigator.pop(context);
// //               },
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.video_label),
// //               title: const Text(' Saved Videos '),
// //               onTap: () {
// //                 Navigator.pop(context);
// //               },
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.edit),
// //               title: const Text(' Edit Profile '),
// //               onTap: () {
// //                 Navigator.pop(context);
// //               },
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.logout),
// //               title: const Text('LogOut'),
// //               onTap: () {
// //                 Navigator.pop(context);
// //               },
// //             ),
// //           ],
// //         ),
// //       ), //Drawer
// //     );
// //   }
// // }
//
//
//
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'EduCo Lottie Animation',
//       home: LottieAnimationScreen(),
//     );
//   }
// }
//
// class LottieAnimationScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('EduCo Lottie Animation'),
//       ),
//       body: Center(
//         child: Lottie.asset(
//           'assests/mathsgo.jpg', // Replace with the path to your animation file
//           width: 300,
//           height: 300,
//           fit: BoxFit.contain,
//           repeat: true, // Set this to true if you want the animation to loop
//         ),
//       ),
//     );
//   }
// }
