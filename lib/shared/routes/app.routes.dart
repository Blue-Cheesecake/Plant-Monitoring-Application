import 'package:wireless_project/views/home.view.dart';
import 'package:wireless_project/views/sign_in.view.dart';
import 'package:wireless_project/views/sign_up.view.dart';

class AppRoutes {
  static const initialRoute = HomeView.routeName;
  static final routes = {
    HomeView.routeName: (context) => const HomeView(),
    SignInView.routeName: (context) => const SignInView(),
    SignUpView.routeName: (context) => const SignUpView(),
  };
}
