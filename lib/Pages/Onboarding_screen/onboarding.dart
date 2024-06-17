import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/Pages/Onboarding_screen/onboarding_mobile.dart';

class OnboardingWrapper extends StatelessWidget {
  const OnboardingWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingMobile(
      onFinish: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('onboarding_complete', true);

        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   builder: (context) => const ResponsiveLayout(
        //     desktop_Scaffold: DesktopScaffold(),
        //     mobile_Scaffold: MobileScaffold(),
        //     tablet_Scaffold: TabletScaffold(),
        //   ),
        // ));
      },
    );
  }
}
