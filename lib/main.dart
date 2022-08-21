import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'screen/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'welcome_screen',
        routes: {
          'welcome_screen': (context) => const WelcomeScreen(),
          'signup_screen': (context) => const SignupPage(),
          'login_screen': (context) => const LoginPage(),
          'home_screen': (context) => const HomePage(),
          // 'homepage': (context) => const HomeScreen(),
          // 'setting_page': (context) => const SettingPage(),
          // 'profile_page': (context) => const ProfilePage(),
          // 'QuizIntro': (context) => const QuizIntro(),
        },
      ),
    );
  }
}
