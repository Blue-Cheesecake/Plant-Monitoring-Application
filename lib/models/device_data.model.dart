import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wireless_project/models/detected_data.model.dart';

class DeviceDataModel {
  final String? deviceId;
  final List<DetectedData>? data;

  DeviceDataModel(this.deviceId, this.data);

  factory DeviceDataModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    Map<String, dynamic>? data = snapshot.data();
    dynamic d = data?['data'];
    return DeviceDataModel(
      data?['deviceId'],
      d is Iterable
          ? List<DetectedData>.from(d.map((e) => DetectedData.fromJson(e)))
          : [],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'deviceId': deviceId ?? "",
      'data': data ?? [],
    };
  }
}
