import 'package:flutter/material.dart';
import 'package:wireless_project/models/device_data.model.dart';
import 'package:wireless_project/shared/theme/app.theme.dart';

class PlantInfoListWidget extends StatelessWidget {
  const PlantInfoListWidget({Key? key, required this.deviceDataModel})
      : super(key: key);

  final DeviceDataModel deviceDataModel;

  SizedBox _spacing() => const SizedBox(height: 23);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 339,
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 21,
            horizontal: 14,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Plant Information",
                style: TextStyle(
                  color: AppTheme.color.primaryGreen,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _spacing(),
              ListView.builder(
                reverse: true,
                shrinkWrap: true,
                itemCount: deviceDataModel.data!.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 13),
                  child: ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          deviceDataModel.data![index].formattedDetectedAt,
                          style: TextStyle(
                            color: AppTheme.color.primaryGreen,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    title: Text(
                      "Temp ${deviceDataModel.data![index].temperature} °C",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Text(
                      "Humidity ${deviceDataModel.data![index].humidity}%",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      side: BorderSide(width: 0.75, color: Colors.grey),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
