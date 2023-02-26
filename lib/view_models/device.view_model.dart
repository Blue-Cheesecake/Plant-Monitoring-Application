import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wireless_project/models/device_data.model.dart';
import 'package:wireless_project/utils/constants/firebase_collection_path.constant.dart';

class DeviceViewModel {
  final _firestore = FirebaseFirestore.instance;

  Future<Stream<DocumentSnapshot<DeviceDataModel>>> fetchDataById(
      String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return _firestore
        .collection(FirebaseCollectionPath.fireStorePath.devices)
        .doc(id)
        .withConverter(
          fromFirestore: DeviceDataModel.fromFirestore,
          toFirestore: (value, options) =>
              DeviceDataModel("", []).toFirestore(),
        )
        .snapshots();
  }
}
