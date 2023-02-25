import 'package:flutter/material.dart';
import 'package:wireless_project/views/home.view.dart';

class LogOutButtonWidget extends StatelessWidget {
  const LogOutButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _showWarningDialog(context),
      icon: Image.asset(
        "assets/icons/logout.png",
        width: 25,
      ),
    );
  }

  Future<void> _showWarningDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Warning",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          content: const Text("Are you sure you're logging out?"),
          actions: [
            TextButton(
                onPressed: () {
                  // TODO: Add Firebase Signout Here

                  Navigator.of(context)
                      .pushReplacementNamed(HomeView.routeName);
                },
                child: const Text("Yes")),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
