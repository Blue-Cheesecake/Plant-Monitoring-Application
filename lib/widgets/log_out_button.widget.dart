import 'package:flutter/material.dart';
import 'package:wireless_project/views/home.view.dart';

class LogOutButtonWidget extends StatelessWidget {
  const LogOutButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(HomeView.routeName);
      },
      icon: Image.asset(
        "assets/icons/logout.png",
        width: 25,
      ),
    );
  }
}
