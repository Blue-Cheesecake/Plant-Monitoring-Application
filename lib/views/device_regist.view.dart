import 'package:flutter/material.dart';
import 'package:wireless_project/models/device_regist.model.dart';
import 'package:wireless_project/shared/theme/app.theme.dart';
import 'package:wireless_project/widgets/info_form.widget.dart';
import 'package:wireless_project/widgets/primary_button.widget.dart';

class DeviceRegistView extends StatelessWidget {
  DeviceRegistView({Key? key}) : super(key: key);

  final _deviceRegist = DeviceRegistModel();

  SizedBox _spacing() => const SizedBox(height: 13);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Stack(
          children: [
            Card(
              elevation: 8,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                  horizontal: 13,
                ),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Device Registration",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      _spacing(),
                      _spacing(),

                      /// IoT Device ID Field
                      ///
                      InfoFormWidget(
                        "IoT device ID",
                        Icons.developer_board,
                        (newValue) {
                          _deviceRegist.deviceId = newValue ?? "";
                        },
                      ),
                      _spacing(),

                      /// Plant name Field
                      ///
                      InfoFormWidget(
                        "Plant name",
                        Icons.grid_goldenratio_outlined,
                        (newValue) {
                          _deviceRegist.plantName = newValue ?? "";
                        },
                      ),
                      _spacing(),
                      _spacing(),

                      PrimaryButtonWidget(
                        "CONNECT",
                        () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: IconButton(
                splashRadius: 0.1,
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.cancel_sharp,
                  color: AppTheme.color.primaryGreen,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
