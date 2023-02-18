import 'package:flutter/material.dart';
import 'package:wireless_project/views/home_screen.dart';
import 'package:wireless_project/views/sign_in_screen.dart';
import 'package:wireless_project/views/sign_up_screen.dart';
import 'package:wireless_project/views/welcome_screen.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wireless Communication Project',
      theme: ThemeData(
        useMaterial3: false,
        colorSchemeSeed: const Color.fromRGBO(140, 245, 241, 1),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        SignInScreen.routeName: (context) => const SignInScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
