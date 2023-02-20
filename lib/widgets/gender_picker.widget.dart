import 'package:flutter/material.dart';
import 'package:wireless_project/utils/enums/gender.dart';

class GenderPickerWidget extends StatelessWidget {
  const GenderPickerWidget(
      {super.key,
      required this.currentGender,
      required this.selectMaleFn,
      required this.selectFemaleFn});

  final Gender currentGender;
  final Function() selectMaleFn;
  final Function() selectFemaleFn;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: selectFemaleFn,
          splashRadius: 1,
          icon: Icon(
            color: currentGender == Gender.female
                ? Colors.pinkAccent
                : Colors.grey,
            Icons.female_rounded,
            size: 40,
          ),
        ),
        IconButton(
          onPressed: selectMaleFn,
          splashRadius: 1,
          icon: Icon(
            color:
                currentGender == Gender.male ? Colors.blueAccent : Colors.grey,
            Icons.male_rounded,
            size: 40,
          ),
        )
      ],
    );
  }
}
