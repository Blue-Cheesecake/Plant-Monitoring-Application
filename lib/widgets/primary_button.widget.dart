import 'package:flutter/material.dart';
import 'package:wireless_project/shared/theme/app.theme.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget(this.title, this.onPressedCallBack, {Key? key})
      : super(key: key);

  final String title;
  final void Function() onPressedCallBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressedCallBack,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.color.secondaryGreen,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            letterSpacing: 1,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
