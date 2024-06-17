// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:task_app/Pages/Dashboard_page/dashboard_moible.dart';
// import 'package:task_app/Pages/Login_Page/loginPage_mobile.dart';

// class mobile_AuthGate extends StatelessWidget {
//   const mobile_AuthGate({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: ((context, snapshot) {
//             // user logged in

//             if (snapshot.hasData) {
//               return const MobileDashboard();
//             }

//             // user not logged in
//             else {
//               return const MobileLoginPage();
//             }
//           })),
//     );
//   }
// }
