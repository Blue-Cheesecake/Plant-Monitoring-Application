import 'package:flutter/material.dart';
import 'package:wireless_project/shared/routes/app.routes.dart';
import 'package:wireless_project/shared/theme/app.theme.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wireless Communication Project',
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}
