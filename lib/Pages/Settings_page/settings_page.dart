import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_app/Auth/auth_services.dart';
import 'package:task_app/Auth/mobile_auth_gate.dart';
import 'package:task_app/Pages/Dashboard_page/dashboard_moible.dart';

import 'package:task_app/services/firestore.dart';

class MobileSettingsPage extends StatefulWidget {
  const MobileSettingsPage({
    super.key,
  });

  @override
  State<MobileSettingsPage> createState() => _MobileNewTaskPage();
}

class _MobileNewTaskPage extends State<MobileSettingsPage> {
  final FirestoreService firestoreService = FirestoreService();

  void logOut() {
    final authservice = AuthService();
    authservice.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const mobile_AuthGate()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            const SizedBox(
              height: 160,
              width: 160,
              child: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 100,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                logOut();
              },
              child: Container(
                  height: 60,
                  width: 160,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(child: Text("Log Out"))),
            ),
            const SizedBox(
              height: 400,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Positioned(
                left: 75,
                right: 75,
                bottom: 25,
                child: Center(
                  widthFactor: 4,
                  child: Container(
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.6),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 30),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MobileDashboard()),
                            );
                          },
                          icon: const Icon(Icons.home),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MobileSettingsPage()),
                            );
                          },
                          icon: const Icon(Icons.settings),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
