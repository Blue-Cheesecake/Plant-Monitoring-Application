import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:wireless_project/models/user_data.model.dart';
import 'package:wireless_project/providers/user_devices.provider.dart';
import 'package:wireless_project/view_models/user_plants.view_model.dart';
import 'package:wireless_project/widgets/plant_card.widget.dart';

class PlantsGridWidget extends StatefulWidget {
  const PlantsGridWidget({Key? key}) : super(key: key);

  @override
  State<PlantsGridWidget> createState() => _PlantsGridWidgetState();
}

class _PlantsGridWidgetState extends State<PlantsGridWidget> {
  late final UserPlantViewModel _userPlantViewModel;

  @override
  void initState() {
    super.initState();
    _userPlantViewModel = UserPlantViewModel(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserDevicesProvider>(
      builder: (context, value, child) {
        log("----------Plant Grid----------");
        log("fetching device data");
        log("------------------------------");

        return FutureBuilder(
          future: _userPlantViewModel.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [CupertinoActivityIndicator()],
              );
            }
            log(snapshot.data?.data().toString() ?? "No");
            UserDataModel userDataModel = snapshot.data!.data()!;
            List<Device> devices = userDataModel.devices!;

            return GridView.builder(
              shrinkWrap: true,
              itemCount: devices.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return PlantCardWidget(
                  deviceId: devices[index].deviceId ?? "",
                  plantName: devices[index].plantName ?? "",
                  networkImagePath: devices[index].imagePath ?? "",
                );
              },
            );
          },
        );
      },
    );
  }
}
