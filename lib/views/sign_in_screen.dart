import 'package:flutter/material.dart';
import 'package:wireless_project/models/user_dto.dart';
import 'package:wireless_project/views/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static const routeName = "/sign-in";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final _userDto = UserDto();

  bool _isHidingPassword = true;

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
                borderRadius: BorderRadius.all(Radius.circular(22)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
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
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      _spacing(),
                      _spacing(),

                      /// Email Field
                      ///
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email can't be empty";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _userDto.email = newValue ?? "";
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email_rounded),
                          label: const Text("Email"),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      _spacing(),

                      /// Password Field
                      ///
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password can't be empty";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _userDto.password = newValue ?? "";
                        },
                        obscureText: _isHidingPassword,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.key),
                          suffixIcon: _isHidingPassword
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isHidingPassword = !_isHidingPassword;
                                    });
                                  },
                                  icon: const Icon(Icons.remove_red_eye),
                                  splashColor: Colors.transparent,
                                )
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isHidingPassword = !_isHidingPassword;
                                    });
                                  },
                                  icon: const Icon(Icons.panorama_fish_eye),
                                  splashColor: Colors.transparent,
                                ),
                          label: const Text("Password"),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      _spacing(),

                      /// -- Sign in Button
                      ///
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // validate the input
                            _formKey.currentState?.validate();

                            // save
                            _formKey.currentState?.save();

                            // Logging
                            _userDto.logCurrentInfo();

                            // TODO: Log in and navigate to home page if valid
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                          ),
                          child: const Text(
                            "SIGN IN",
                            style: TextStyle(letterSpacing: 1),
                          ),
                        ),
                      ),

                      /// -- Registration Navigation
                      ///
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Not have an account?",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigate to register screen
                              Navigator.of(context)
                                  .pushNamed(SignUpScreen.routeName);
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
                            child: const Text("Create one"),
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
