import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wireless_project/models/device_regist.model.dart';
import 'package:wireless_project/shared/theme/app.theme.dart';
import 'package:wireless_project/view_models/user_plants.view_model.dart';
import 'package:wireless_project/widgets/image_picker.widget.dart';
import 'package:wireless_project/widgets/info_form.widget.dart';
import 'package:wireless_project/widgets/primary_button.widget.dart';

class DeviceRegistView extends StatefulWidget {
  const DeviceRegistView({Key? key}) : super(key: key);

  @override
  State<DeviceRegistView> createState() => _DeviceRegistViewState();
}

class _DeviceRegistViewState extends State<DeviceRegistView> {
  final _formKey = GlobalKey<FormState>();
  final _deviceRegist = DeviceRegistModel();
  late UserPlantViewModel _userPlantViewModel;
  bool _isValidRegist = true;

  @override
  void initState() {
    super.initState();
    _userPlantViewModel = UserPlantViewModel(context);
  }

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
                  key: _formKey,
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

                      const Text(
                        "Plant pictures (if any)",
                        style: TextStyle(fontSize: 18),
                      ),
                      _spacing(),
                      ImagePickerWidget((xFile) {
                        _deviceRegist.imageFile = File(xFile.path);
                      }),
                      _spacing(),
                      _spacing(),

                      PrimaryButtonWidget(
                        "CONNECT",
                        () async {
                          // validate the inputs
                          _formKey.currentState?.validate();

                          // save
                          _formKey.currentState?.save();

                          setState(() {
                            _isValidRegist = true;
                          });

                          // log(_deviceRegist.finalize().toString());
                          // await Future.delayed(const Duration(seconds: 1));
                          bool ret = await _userPlantViewModel
                              .registerDevice(_deviceRegist.finalize());

                          setState(() {
                            _isValidRegist = ret;
                          });

                          if (_isValidRegist) {
                            Navigator.of(context).pop();
                          }
                        },
                        willBeDelayed: true,
                      ),
                      if (!_isValidRegist) _spacing(),
                      if (!_isValidRegist)
                        const Center(
                          child: Text(
                            "Error on device connection\nDevice Id might be incorrect",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.red,
                            ),
                          ),
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
