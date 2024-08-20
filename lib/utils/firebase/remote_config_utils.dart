import 'dart:convert';

class RemoteConfigUtils {
  Future<Map<String, bool>> parseJsonConfig(String rawJson) async {
    final Map<String, dynamic> jsonMap = jsonDecode(rawJson);
    final Map<String, bool> visibilityMap = jsonMap.map((key, value) => MapEntry(key, value == true));
    print('Parsed visibility map: $visibilityMap');
    return visibilityMap;
  }
}
