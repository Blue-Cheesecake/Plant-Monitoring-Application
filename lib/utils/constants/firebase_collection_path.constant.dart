class FirebaseCollectionPath {
  static const fireStorePath = FireStorePath();
  static const cloudStorage = CloudStorage();
}

class FireStorePath {
  const FireStorePath();

  String get users => "users";
  String get devices => "devices";
}

class CloudStorage {
  const CloudStorage();

  String get defaultPlantImage =>
      "https://firebasestorage.googleapis.com/v0/b/plant-monitoring-7517f.appspot.com/o/plant_images%2Fdefault_plant.jpg?alt=media&token=c5bf6833-c78b-4cd7-a48e-7da8c0da8ea4";
  String get plantImages => "plant_images";
}
