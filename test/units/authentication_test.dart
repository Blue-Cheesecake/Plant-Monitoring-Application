import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:wireless_project/models/user_dto.model.dart';
import 'package:wireless_project/models/user_regist.model.dart';
import 'package:wireless_project/utils/enums/gender.dart';

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
          userRegistModel.dob = DateTime.now();
          userRegistModel.fullName = "Test test";
          userRegistModel.gender = Gender.female;

          log("${userDtoModel.hashCode}");
          log("${userRegistModel.hashCode}");

          expect(
              userDtoModel.hashCode == userRegistModel.hashCode, equals(true));
        },
      );

      test(
        "This should be equal",
        () {
          UserDtoModel userDtoModel = UserDtoModel();
          userDtoModel.email = "test2@test.com";
          userDtoModel.password = "123456";

          UserRegistModel userRegistModel = UserRegistModel();
          userRegistModel.email = "test2@test.com";
          userRegistModel.password = "123456";
          userRegistModel.dob = DateTime.now();
          userRegistModel.fullName = "Test test";
          userRegistModel.gender = Gender.female;

          log("${userDtoModel.hashCode}");
          log("${userRegistModel.hashCode}");

          expect(
              userDtoModel.hashCode == userRegistModel.hashCode, equals(true));
        },
      );

      test(
        "This should be equal",
        () {
          UserDtoModel userDtoModel = UserDtoModel();
          userDtoModel.email = "test3@test.com";
          userDtoModel.password = "123456";

          UserRegistModel userRegistModel = UserRegistModel();
          userRegistModel.email = "test3@test.com";
          userRegistModel.password = "123456";
          userRegistModel.dob = DateTime.now();
          userRegistModel.fullName = "Test test";
          userRegistModel.gender = Gender.female;

          log("${userDtoModel.hashCode}");
          log("${userRegistModel.hashCode}");

          expect(
              userDtoModel.hashCode == userRegistModel.hashCode, equals(true));
        },
      );

      test(
        "This should be equal",
        () {
          UserDtoModel userDtoModel = UserDtoModel();
          userDtoModel.email = "s_w.piepie@kirasaka.com";
          userDtoModel.password = "argato322";

          UserRegistModel userRegistModel = UserRegistModel();
          userRegistModel.email = "s_w.piepie@kirasaka.com";
          userRegistModel.password = "argato322";
          userRegistModel.dob = DateTime.now();
          userRegistModel.fullName = "Test test";
          userRegistModel.gender = Gender.female;

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
