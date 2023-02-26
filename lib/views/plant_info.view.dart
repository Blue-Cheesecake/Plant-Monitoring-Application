import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wireless_project/models/device_data.model.dart';
import 'package:wireless_project/shared/theme/app.theme.dart';
import 'package:wireless_project/view_models/device.view_model.dart';
import 'package:wireless_project/views/plants.view.dart';
import 'package:wireless_project/widgets/plant_info_list.widget.dart';

class PlantInfoView extends StatelessWidget {
  PlantInfoView({super.key});
  static const routeName = "${PlantsView.routeName}/plant-info";
  final _deviceViewModel = DeviceViewModel();
  final _scrollCtr = ScrollController();

  @override
  Widget build(BuildContext context) {
    Map<String, String> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    String deviceId = args['deviceId']!;
    String plantName = args['plantName']!;
    String networkImage = args['networkImagePath']!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.color.lightGreen,
        title: Text(
          plantName,
          style: TextStyle(
            color: AppTheme.color.primaryGreen,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: _scrollCtr,
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.network(
                  networkImage,
                  width: 238,
                  height: 242,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: FutureBuilder(
                  future: _deviceViewModel.fetchDataById(deviceId),
                  builder: (_, futureSnapshot) {
                    if (futureSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const CupertinoActivityIndicator(radius: 13);
                    }

                    return StreamBuilder(
                      stream: futureSnapshot.data!,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CupertinoActivityIndicator(radius: 13);
                        }

                        DeviceDataModel deviceDataModel =
                            snapshot.data!.data()!;
                        return PlantInfoListWidget(
                          deviceDataModel: deviceDataModel,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          backgroundColor: AppTheme.color.primaryGreen,
          child: const Icon(
            Icons.arrow_upward_rounded,
            size: 40,
          ),
          onPressed: () {
            _scrollCtr.animateTo(
              0,
              duration: const Duration(milliseconds: 150),
              curve: Curves.linear,
            );
          },
        ),
      ),
    );
  }
}
