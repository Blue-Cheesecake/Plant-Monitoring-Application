import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:wireless_project/shared/theme/app.theme.dart';
import 'package:wireless_project/views/device_regist.view.dart';
import 'package:wireless_project/widgets/log_out_button.widget.dart';
import 'package:wireless_project/widgets/plants_grid.widget.dart';

class PlantsView extends StatelessWidget {
  const PlantsView({super.key});
  static const routeName = "/plants";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.color.lightGreen,
        leading: const SizedBox.shrink(),
        actions: const [
          LogOutButtonWidget(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 36,
            horizontal: 47,
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  "My plants",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              const SizedBox(height: 36),
              const PlantsGridWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              // Show modal buttom sheet
              showCupertinoModalBottomSheet(
                context: context,
                builder: (context) => const DeviceRegistView(),
              );
            },
            backgroundColor: AppTheme.color.primaryGreen,
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
