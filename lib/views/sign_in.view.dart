import 'package:flutter/material.dart';
import 'package:wireless_project/models/user_dto.model.dart';
import 'package:wireless_project/views/sign_up.view.dart';
import 'package:wireless_project/widgets/info_form.widget.dart';
import 'package:wireless_project/widgets/password_form.widget.dart';
import 'package:wireless_project/widgets/primary_button.widget.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);
  static const routeName = "/sign-in";

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();

  final _userDto = UserDtoModel();

  final bool _isHidingPassword = true;

  SizedBox _spacing() => const SizedBox(height: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 4,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// -- ! Signin Title
                      ///
                      Text(
                        "Sign in",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      _spacing(),
                      _spacing(),

                      /// Email Field
                      ///
                      InfoFormWidget("Email", Icons.email, (newValue) {
                        _userDto.email = newValue ?? "";
                      }),
                      _spacing(),

                      /// Password Field
                      ///
                      PasswordFormWidget((newValue) {
                        _userDto.password = newValue ?? "";
                      }),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password?",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),

                      /// -- Sign in Button
                      ///
                      PrimaryButtonWidget("SIGN IN", () {
                        // validate the input
                        _formKey.currentState?.validate();

                        // save
                        _formKey.currentState?.save();

                        // Logging
                        _userDto.logCurrentInfo();

                        // TODO: Log in and navigate to home page if valid
                      }),

                      /// -- Registration Navigation
                      ///
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigate to register screen
                              Navigator.of(context)
                                  .pushNamed(SignUpView.routeName);
                            },
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.resolveWith(
                                  (states) => Colors.grey.shade200),
                              shape: MaterialStateProperty.resolveWith(
                                (states) => const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(99),
                                  ),
                                ),
                              ),
                            ),
                            child: const Text("Register here"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
