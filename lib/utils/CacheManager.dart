import 'dart:convert';

import 'package:digitalcenter_mobile_basecode/models/view_data_model/login_dm.dart';
import 'package:digitalcenter_mobile_basecode/utils/Parameters.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_component/shared_component.dart';

mixin CacheManager {
  // Future<bool> saveLoginData(LoginDM loginDM) async {
  //   final storage = GetStorage();
  //   final json = jsonEncode(loginDM.toJson());
  //   final encrypt = GeneralUtilities().aesEncrypt(json, Parameters().aesKey);
  //   storage.write(LoginDataModel.loginDM.name, encrypt);
  //   return true;
  // }

  // Future<LoginDM> getLoginData() async {
  //   final storage = GetStorage();
  //   if (storage.hasData(LoginDataModel.loginDM.name)) {
  //     final data = storage.read(LoginDataModel.loginDM.name);
  //     final decrypt = GeneralUtilities().aesDecrypt(data, Parameters().aesKey);
  //     final json = jsonDecode(decrypt);
  //     return LoginDM.fromJson(json);
  //   } else {
  //     return LoginDM();
  //   }
  // }
}
