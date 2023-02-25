import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wireless_project/shared/theme/app.theme.dart';

class PrimaryButtonWidget extends StatefulWidget {
  const PrimaryButtonWidget(this.title, this.onPressedCallBack,
      {Key? key, this.willBeDelayed = false})
      : super(key: key);

  final String title;
  final Function onPressedCallBack;
  final bool? willBeDelayed;

  @override
  State<PrimaryButtonWidget> createState() => _PrimaryButtonWidgetState();
}

class _PrimaryButtonWidgetState extends State<PrimaryButtonWidget> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.color.secondaryGreen,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(11)),
              ),
            ),
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                letterSpacing: 1,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        if (_isLoading) const SizedBox(height: 15),
        if (_isLoading)
          const CupertinoActivityIndicator(
            animating: true,
            radius: 15,
          ),
      ],
    );
  }

  void _onPressed() async {
    if (widget.willBeDelayed! == false) {
      widget.onPressedCallBack();
      return;
    }

    setState(() {
      _isLoading = true;
    });

    await widget.onPressedCallBack();

    setState(() {
      _isLoading = false;
    });
  }
}
