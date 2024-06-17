import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:task_app/Auth/auth_services.dart';
import 'package:task_app/Pages/Dashboard_page/dashboard_moible.dart';
import 'package:task_app/Pages/Login_Page/loginPage_mobile.dart';

class MobileRegisterPage extends StatefulWidget {
  const MobileRegisterPage({
    super.key,
  });

  @override
  State<MobileRegisterPage> createState() => _MobileRegisterPageState();
}

class _MobileRegisterPageState extends State<MobileRegisterPage> {
  // Text Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cfrmpasswordController = TextEditingController();

  void register(BuildContext context) async {
    final authservice = AuthService();

    // try register
    if (_passwordController == _cfrmpasswordController) {
      try {
        await authservice.signUpwithEmailPassword(
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
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Passwords do not natch"),
              ));
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _cfrmpasswordController.dispose();
    super.dispose();
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 120,
                    //   width: 120,
                    //   child: Lottie.asset(
                    //       fit: BoxFit.contain,
                    //       'https://lottie.host/70487e51-fc20-45de-9fb3-70db754e5759/5cfgtoICIq.json'),
                    // ),
                    // Welcome and CTA
                    const Padding(
                      padding: EdgeInsets.only(top: 125),
                      child: Text(
                        "Welcome to TaskQ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    const Text(
                      "Please create your account",
                      style: TextStyle(fontSize: 13, height: 1),
                    ),

                    // Name
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 40, right: 40),
                      child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(),
                            hintText: "Please enter your name"),
                      ),
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
                        controller: _passwordController,
                        decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(),
                            hintText: "Please enter your password"),
                      ),
                    ),

                    // Confirm Password
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 40, right: 40),
                      child: TextField(
                        obscureText: true,
                        controller: _cfrmpasswordController,
                        decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(),
                            hintText: "Please confirm your password"),
                      ),
                    ),

                    // Create Account Button
                    Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: GestureDetector(
                          onTap: () => register(context),
                          child: Container(
                            width: 170,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(12)),
                            child: const Center(
                                child: Text(
                              "Create Account",
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
                            "Already have an account?",
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
                                        const MobileLoginPage()),
                              );
                            },
                            child: const Text(
                              "Log in",
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
            ),
          )
        ],
      ),
    );
  }
}
