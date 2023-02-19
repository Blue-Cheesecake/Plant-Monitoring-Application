import 'package:flutter/material.dart';
import 'package:wireless_project/views/sign_in.view.dart';
import 'package:wireless_project/views/sign_up.view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 110,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Plant Monitoring \n Application",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 49,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                    // fontStyle: FontStyle.italic,
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        colors: <Color>[
                          Colors.lightBlue,
                          Colors.green,
                          //add more color here.
                        ],
                      ).createShader(
                          const Rect.fromLTWH(0.0, 0.0, 500.0, 100.0)),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed(SignUpView.routeName),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 46,
                          vertical: 15,
                        ),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed(SignInView.routeName),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),

                    // Add Sign Up here
                  ],
                ),
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
