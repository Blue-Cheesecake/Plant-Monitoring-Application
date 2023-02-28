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

  String get plantImages => "plant_images";
}
