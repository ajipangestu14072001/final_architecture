import 'package:final_architecture/utils/Constant.dart';
import 'package:get_storage/get_storage.dart';

enum LanguageCode { en, id, kr, th }

class LanguageUtility {
  /// @author andika afif
  /// @email andika.afif@digitalcenter.id
  /// @create date 2024-08-29
  /// @modify date 2024-08-29
  /// @desc [get selected language from preference]
  Future<String> getLang() async {
    final box = GetStorage();
    String lang = box.read(CacheManagerKey.lang.toString()) ?? "";
    // LogUtility.writeLog("language get : " + lang.toString());

    if (lang != "") {
      return box.read(CacheManagerKey.lang.toString());
    } else {
      return "en";
    }
  }
}
