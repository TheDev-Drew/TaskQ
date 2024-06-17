import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task_app/Auth/auth_services.dart';
import 'package:task_app/Pages/Dashboard_page/dashboard_moible.dart';
import 'package:task_app/Pages/Register_page/registerPage_mobile.dart';

class MobileLoginPage extends StatefulWidget {
  const MobileLoginPage({
    super.key,
  });

  @override
  State<MobileLoginPage> createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login(BuildContext context) async {
    final authservice = AuthService();

    // try login
    try {
      await authservice.signInwithEmailPassword(
          _emailController.text, _passwordController.text);
    }

    // catch errors
    catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // BackGround
          const MobileDashboard(),
          BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.transparent,
              )),

          // Actual Registration Page
          Padding(
            padding:
                const EdgeInsets.only(top: 30, bottom: 30, left: 15, right: 15),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.15),
                        blurRadius: 20,
                        offset: const Offset(0, 10))
                  ]),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  // Welcome and CTA
                  const Padding(
                    padding: EdgeInsets.only(top: 255),
                    child: Text(
                      "Welcome to TaskQ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  const Text(
                    "Please create your account",
                    style: TextStyle(fontSize: 13, height: 1),
                  ),

                  //Email
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 40, right: 40),
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(),
                          hintText: "Please enter your email"),
                    ),
                  ),
                  // PassWord
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 40, right: 40),
                    child: TextField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(),
                          hintText: "Please enter your password"),
                    ),
                  ),

                  // Login Button
                  Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: GestureDetector(
                        onTap: () => login(context),
                        child: Container(
                          width: 170,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                              child: Text(
                            "Log In",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ),
                      )),

                  // or with Google

                  // ALready have an account
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 10),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MobileRegisterPage()),
                            );
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
