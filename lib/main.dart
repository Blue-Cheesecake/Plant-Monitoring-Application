import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        colorSchemeSeed: Colors.deepPurpleAccent,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegistrationScreen.routeName: (context) => const RegistrationScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routeName = "/welcome";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 135,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Plant Watering App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 49,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                    fontStyle: FontStyle.italic,
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        colors: <Color>[
                          Colors.deepPurpleAccent,
                          Colors.pinkAccent,
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
                      onPressed: () => Navigator.of(context)
                          .pushNamed(LoginScreen.routeName),
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String _emailDto = "";

  String _passwordDto = "";

  bool _isHidingPassword = true;

  SizedBox _spacing() => const SizedBox(height: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          return null;
                        },
                        onSaved: (newValue) {
                          _emailDto = newValue ?? "";
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
                          return null;
                        },
                        onSaved: (newValue) {
                          _passwordDto = newValue ?? "";
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

                            // navigate to home page if valid
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

enum Gender { male, female }

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);
  static const routeName = "/registration";

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  // Variables of inputs
  String _fullName = "";

  String _username = "";

  String _email = "";

  String _password = "";

  Gender _gender = Gender.female;

  bool _isHidingPassword = true;

  DateTime _dob = DateTime(2023);
  int _age = DateTime.now().year - 2023;

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
                          return null;
                        },
                        onSaved: (newValue) {
                          _email = newValue ?? "";
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
                          return null;
                        },
                        onSaved: (newValue) {
                          _password = newValue ?? "";
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
                          return null;
                        },
                        onSaved: (newValue) {
                          _fullName = newValue ?? "";
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
                          return null;
                        },
                        onSaved: (newValue) {
                          _username = newValue ?? "";
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
                                _gender = Gender.female;
                              });
                            },
                            splashRadius: 1,
                            icon: Icon(
                              color: _gender == Gender.female
                                  ? Colors.pinkAccent
                                  : Colors.grey,
                              Icons.female_rounded,
                              size: 35,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _gender = Gender.male;
                              });
                            },
                            splashRadius: 1,
                            icon: Icon(
                              color: _gender == Gender.male
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
                                    "${_dob.month}-${_dob.day}-${_dob.year}",
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
                                      initialDateTime: _dob,
                                      mode: CupertinoDatePickerMode.date,
                                      maximumDate: DateTime.now(),
                                      use24hFormat: true,
                                      // This is called when the user changes the time.
                                      onDateTimeChanged: (DateTime newTime) {
                                        setState(() {
                                          _dob = newTime;
                                          _age =
                                              DateTime.now().year - _dob.year;
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
                                  "Age: $_age",
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

                            // navigate to home page if valid
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: Container(),
    );
  }
}
