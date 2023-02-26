import 'package:flutter/cupertino.dart';
import 'package:wireless_project/views/plant_info.view.dart';

class PlantCardWidget extends StatelessWidget {
  const PlantCardWidget(
      {Key? key,
      required this.deviceId,
      required this.plantName,
      required this.networkImagePath})
      : super(key: key);

  final String deviceId;
  final String plantName;
  final String networkImagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          PlantInfoView.routeName,
          arguments: {
            'deviceId': deviceId,
            'plantName': plantName,
            'networkImagePath': networkImagePath,
          },
        );
      },
      child: Column(
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.network(
                filterQuality: FilterQuality.high,
                networkImagePath,
                height: 157,
                width: 127,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 9),
          Text(
            plantName,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
