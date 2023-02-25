class FirebaseCollectionPath {
  static const fireStorePath = FireStorePath();
}

class FireStorePath {
  const FireStorePath();

  String get users => "users";
  String get devices => "devices";
}
