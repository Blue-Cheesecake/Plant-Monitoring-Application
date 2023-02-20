import 'package:flutter/material.dart';
import 'package:wireless_project/views/sign_in.view.dart';
import 'package:wireless_project/views/sign_up.view.dart';
import 'package:wireless_project/widgets/sign_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 67),
                  Text(
                    "Plant Monitoring \nApplication",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(height: 30),
                  const SignButton(
                    title: "Sign Up",
                    destinationRoute: SignUpView.routeName,
                  ),
                  const SizedBox(height: 21),
                  const SignButton(
                    title: "Sign In",
                    destinationRoute: SignInView.routeName,
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/images/welcome_tree.png",
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }
}
