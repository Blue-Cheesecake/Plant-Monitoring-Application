import 'package:flutter/material.dart';
import 'package:wireless_project/models/user_regist.model.dart';
import 'package:wireless_project/utils/enums/gender.dart';
import 'package:wireless_project/views/plants.view.dart';
import 'package:wireless_project/views/sign_in.view.dart';
import 'package:wireless_project/widgets/date_picker.widget.dart';
import 'package:wireless_project/widgets/gender_picker.widget.dart';
import 'package:wireless_project/widgets/info_form.widget.dart';
import 'package:wireless_project/widgets/password_form.widget.dart';
import 'package:wireless_project/widgets/primary_button.widget.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);
  static const routeName = "/sign-up";

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();

  final _userRegist = UserRegistModel();

  SizedBox _spacing() => const SizedBox(height: 15);

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
                        "Sign up",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      _spacing(),
                      _spacing(),

                      /// Email Field
                      ///
                      InfoFormWidget("Email", Icons.email, (newValue) {
                        _userRegist.email = newValue ?? "";
                      }),
                      _spacing(),

                      /// Password Field
                      ///
                      PasswordFormWidget((newValue) {
                        _userRegist.password = newValue ?? "";
                      }),
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
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      _spacing(),

                      /// Full name Field
                      ///
                      InfoFormWidget(
                        "Fullname",
                        Icons.contact_mail,
                        (newValue) {
                          _userRegist.fullName = newValue ?? "";
                        },
                      ),
                      _spacing(),

                      /// Username Field
                      ///
                      InfoFormWidget("Username", Icons.person, (newValue) {
                        _userRegist.username = newValue ?? "";
                      }),
                      _spacing(),

                      /// Gender Selection
                      ///
                      GenderPickerWidget(
                        currentGender: _userRegist.gender,
                        selectMaleFn: () {
                          setState(() {
                            _userRegist.gender = Gender.male;
                          });
                        },
                        selectFemaleFn: () {
                          setState(() {
                            _userRegist.gender = Gender.female;
                          });
                        },
                      ),
                      _spacing(),

                      /// Date of Birth field
                      ///
                      DatePickerWidget(
                        currentDate: _userRegist.dob,
                        currentAge: _userRegist.age,
                        onDateTimeChangedCallBack: (DateTime newTime) {
                          setState(() {
                            _userRegist.dob = newTime;
                          });
                        },
                      ),
                      _spacing(),

                      /// -- Registration Button
                      ///
                      PrimaryButtonWidget(
                        "SIGN UP",
                        () {
                          // validate the input
                          bool isValid = _formKey.currentState!.validate();

                          if (!isValid) {
                            return;
                          }

                          // saving
                          _formKey.currentState?.save();

                          // Logging
                          _userRegist.logCurrentInfo();

                          // TODO: navigate to home page if valid
                          // FIXME: This is just temporary entering plants view without any validation
                          // Please use firebase to improve this
                          Navigator.of(context).pushNamed(PlantsView.routeName);
                        },
                        willBeDelayed: true,
                      ),

                      /// -- Login Navigation
                      ///
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontSize: 13,
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
                            child: const Text("Sign in here",
                                style: TextStyle(
                                  fontSize: 13,
                                )),
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
