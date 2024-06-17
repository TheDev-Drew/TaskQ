import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/Responsive/desktop_scaffold.dart';
import 'package:task_app/Responsive/mobile_scaffold.dart';
import 'package:task_app/Responsive/responsive_layout.dart';
import 'package:task_app/Responsive/tablet_scaffold.dart';
import 'package:task_app/firebase_options.dart';
import 'package:task_app/themes/dark_mode.dart';
import 'package:task_app/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,
      darkTheme: darkMode,
      themeMode: ThemeMode.system,
      home: const ResponsiveLayout(
        desktop_Scaffold: DesktopScaffold(),
        mobile_Scaffold: MobileScaffold(),
        tablet_Scaffold: TabletScaffold(),
      ),
    );
  }
}
