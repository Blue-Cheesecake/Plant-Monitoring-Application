import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataModel {
  final String? email;
  final String? fullname;
  final String? gender;
  final String? username;
  // ignore: library_private_types_in_public_api
  final List<Device>? devices;

  UserDataModel(
      this.email, this.fullname, this.gender, this.username, this.devices);

  factory UserDataModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    Map<String, dynamic>? data = snapshot.data();
    dynamic devices = data?['devices'];
    return UserDataModel(
      data?['email'],
      data?['fullname'],
      data?['gender'],
      data?['username'],
      devices is Iterable ? List<Device>.from(devices) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email ?? "",
      'fullname': fullname ?? "",
      'gender': gender ?? "",
      'username': username ?? "",
      'devices': devices ?? [],
    };
  }
}

class Device {
  final String? deviceId;
  final String? imagePath;
  final DateTime? addedAt;

  Device(this.deviceId, this.imagePath, this.addedAt);
}
