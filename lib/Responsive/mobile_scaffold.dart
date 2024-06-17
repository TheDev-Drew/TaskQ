import 'package:flutter/material.dart';
import 'package:task_app/Auth/mobile_auth_gate.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return const mobile_AuthGate();
  }
}
