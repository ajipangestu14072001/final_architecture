/// @author Andika Afif
/// @email andika.afif@digitalcenter.id
/// @create date 2024-08-29
/// @modify date 2024-08-29
/// @desc [This class is used to mapping the language to get library and get existing language.]

import 'dart:ui';

import 'package:digitalcenter_mobile_basecode/utils/CacheManager.dart';
import 'package:digitalcenter_mobile_basecode/utils/Localization/en_translation.dart';
import 'package:digitalcenter_mobile_basecode/utils/Localization/id_translation.dart';
import 'package:digitalcenter_mobile_basecode/utils/Localization/ko_translation.dart';
import 'package:digitalcenter_mobile_basecode/utils/Localization/th_translation.dart';
import 'package:get/get.dart';

class Localizable extends Translations with CacheManager {
  final deviceLocale = Get.deviceLocale;
  Locale? locale;

  Locale? getLanguage(String lang) {
    // LogUtility.writeLog("language : " + lang.toString());
    if (lang == "") {
      locale = const Locale('en', 'US');
    } else {
      if (lang == "id") {
        locale = const Locale('id', 'ID');
      } else if (lang == "kr") {
        locale = const Locale('ko', 'KR');
      } else if (lang == "th") {
        locale = const Locale('th', 'TH');
      } else {
        locale = const Locale('en', 'US');
      }
    }

    return locale;
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'id_ID': idID,
        'ko_KR': koKR,
        'th_TH': thTH,
      };
}
