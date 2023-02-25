import 'package:flutter/material.dart';
import 'package:wireless_project/view_models/authentication.view_model.dart';
import 'package:wireless_project/views/home.view.dart';

class LogOutButtonWidget extends StatefulWidget {
  const LogOutButtonWidget({Key? key}) : super(key: key);

  @override
  State<LogOutButtonWidget> createState() => _LogOutButtonWidgetState();
}

class _LogOutButtonWidgetState extends State<LogOutButtonWidget> {
  late AuthenticationViewModel _authenticationViewModel;

  @override
  void initState() {
    super.initState();
    _authenticationViewModel = AuthenticationViewModel(context);
  }

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
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
              ),
            ),
            TextButton(
              onPressed: () {
                _authenticationViewModel.signOut();
                Navigator.of(context).pushReplacementNamed(HomeView.routeName);
              },
              child: const Text(
                "Log out",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
