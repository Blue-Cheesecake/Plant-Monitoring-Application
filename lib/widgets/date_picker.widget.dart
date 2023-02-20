import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget(
      {Key? key,
      required this.currentDate,
      required this.currentAge,
      required this.onDateTimeChangedCallBack})
      : super(key: key);

  final DateTime currentDate;
  final int currentAge;
  final Function(DateTime) onDateTimeChangedCallBack;

  void _showDialog(BuildContext context, Widget child) {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Date of Birth",
            style: TextStyle(
              fontSize: 14,
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
                  horizontal: 38,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      width: 0.8,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                child: Text(
                  "${currentDate.month}-${currentDate.day}-${currentDate.year}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => _showDialog(
                  context,
                  CupertinoDatePicker(
                    initialDateTime: currentDate,
                    mode: CupertinoDatePickerMode.date,
                    maximumDate: DateTime.now(),
                    use24hFormat: true,
                    // This is called when the user changes the time.
                    onDateTimeChanged: onDateTimeChangedCallBack,
                  ),
                ),
                splashRadius: 25,
                icon: Image.asset("assets/icons/calendar.png", height: 23),
              ),
              const Spacer(),
              Text(
                "Age: $currentAge",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
