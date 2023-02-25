import 'package:flutter/material.dart';

class PlantCardWidget extends StatelessWidget {
  const PlantCardWidget(
      {Key? key, required this.plantName, required this.networkImagePath})
      : super(key: key);

  final String plantName;
  final String networkImagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(plantName),
      ],
    );
  }
}
