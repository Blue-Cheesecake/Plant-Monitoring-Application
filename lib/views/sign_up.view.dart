import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wireless_project/models/user_regist.model.dart';
import 'package:wireless_project/utils/enums/gender.dart';
import 'package:wireless_project/views/sign_in/sign_in.view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);
  static const routeName = "/sign-up";

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();

  final _userRegist = UserRegistModel();

  bool _isHidingPassword = true;

  SizedBox _spacing() => const SizedBox(height: 15);

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 251, 251, 1),
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              elevation: 4,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(22)),
              ),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// -- ! Create Account Title
                      ///
                      Text(
                        "Create an Account",
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
                          _userRegist.email = newValue ?? "";
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
                          _userRegist.password = newValue ?? "";
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

                      Divider(
                        thickness: 0.5,
                        color: Colors.grey.shade400,
                      ),
                      _spacing(),

                      /// -- ! Create Account Title
                      ///
                      Text(
                        "Personal Info",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      _spacing(),

                      /// Full name Field
                      ///
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Fullname can't be empty";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _userRegist.fullName = newValue ?? "";
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.contact_page),
                          label: const Text("Fullname"),
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

                      /// Username Field
                      ///
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username can't be empty";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _userRegist.username = newValue ?? "";
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          label: const Text("Username"),
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

                      /// Gender Selection
                      ///
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _userRegist.gender = Gender.female;
                              });
                            },
                            splashRadius: 1,
                            icon: Icon(
                              color: _userRegist.gender == Gender.female
                                  ? Colors.pinkAccent
                                  : Colors.grey,
                              Icons.female_rounded,
                              size: 35,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _userRegist.gender = Gender.male;
                              });
                            },
                            splashRadius: 1,
                            icon: Icon(
                              color: _userRegist.gender == Gender.male
                                  ? Colors.blueAccent
                                  : Colors.grey,
                              Icons.male_rounded,
                              size: 35,
                            ),
                          )
                        ],
                      ),
                      _spacing(),

                      /// Date of Birth field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Date of Birth",
                              style: TextStyle(
                                fontSize: 19,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 13,
                                    vertical: 7,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    border: Border.all(
                                        width: 0.8,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                  child: Text(
                                    "${_userRegist.dob.month}-${_userRegist.dob.day}-${_userRegist.dob.year}",
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => _showDialog(
                                    CupertinoDatePicker(
                                      initialDateTime: _userRegist.dob,
                                      mode: CupertinoDatePickerMode.date,
                                      maximumDate: DateTime.now(),
                                      use24hFormat: true,
                                      // This is called when the user changes the time.
                                      onDateTimeChanged: (DateTime newTime) {
                                        setState(() {
                                          _userRegist.dob = newTime;
                                        });
                                      },
                                    ),
                                  ),
                                  splashRadius: 25,
                                  icon: Icon(
                                    Icons.date_range_rounded,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "Age: ${_userRegist.age}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      _spacing(),

                      /// -- Registration Button
                      ///
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // validate the input
                            _formKey.currentState?.validate();

                            // saving
                            _formKey.currentState?.save();

                            // Logging
                            _userRegist.logCurrentInfo();

                            // TODO: navigate to home page if valid
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                          ),
                          child: const Text(
                            "REGISTER",
                            style: TextStyle(letterSpacing: 1),
                          ),
                        ),
                      ),

                      /// -- Login Navigation
                      ///
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigate to sign in screen
                              Navigator.of(context)
                                  .pushNamed(SignInView.routeName);
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
                            child: const Text("Sign in"),
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
