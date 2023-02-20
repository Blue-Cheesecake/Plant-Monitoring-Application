import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wireless_project/shared/theme/app.theme.dart';

class SignButton extends StatelessWidget {
  const SignButton({
    Key? key,
    required this.title,
    required this.destinationRoute,
  }) : super(key: key);

  final String title;
  final String destinationRoute;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(178, 48),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        backgroundColor: AppTheme.color.lightGreen,
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(destinationRoute);
      },
      child: Text(
        title,
        style: GoogleFonts.montserrat(
          color: AppTheme.color.primaryGreen,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
