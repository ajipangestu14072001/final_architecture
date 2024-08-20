import 'dart:convert';
import 'package:flutter/foundation.dart';

class RemoteConfigUtils {
  Future<Map<String, bool>> parseJsonConfig(String rawJson) async {
    final Map<String, dynamic> parsed = await compute(decodeJsonWithCompute, rawJson);
    return parsed.map((key, value) => MapEntry(key, value as bool));
  }

  static Map<String, dynamic> decodeJsonWithCompute(String rawJson) {
    return jsonDecode(rawJson) as Map<String, dynamic>;
  }
}
