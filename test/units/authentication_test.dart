import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:wireless_project/models/user_dto.model.dart';
import 'package:wireless_project/models/user_regist.model.dart';

void main() {
  group(
    "Generating hashcode for document Id",
    () {
      test(
        "This should be equal",
        () {
          UserDtoModel userDtoModel = UserDtoModel();
          userDtoModel.email = "test1@test.com";
          userDtoModel.password = "123456";

          UserRegistModel userRegistModel = UserRegistModel();
          userRegistModel.email = "test1@test.com";
          userRegistModel.password = "123456";

          log("${userDtoModel.hashCode}");
          log("${userRegistModel.hashCode}");

          expect(
              userDtoModel.hashCode == userRegistModel.hashCode, equals(true));
        },
      );

      test(
        "This should not be equal",
        () {
          UserDtoModel userDtoModel = UserDtoModel();
          userDtoModel.email = "test2@test.com";
          userDtoModel.password = "123456";

          UserRegistModel userRegistModel = UserRegistModel();
          userRegistModel.email = "test1@test.com";
          userRegistModel.password = "123456";

          expect(
              userDtoModel.hashCode != userRegistModel.hashCode, equals(true));
        },
      );
    },
  );
}
