import 'package:enum_to_string/enum_to_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PreferenceKey {
  counter,
}

class Preference {
  final preference = SharedPreferences.getInstance();

  Future<int> getInt(PreferenceKey key) async {
    final pref = await preference;
    final value = pref.getInt(EnumToString.convertToString(key)) ?? 0;
    return value;
  }

  Future<void> setInt(PreferenceKey key, int value) async {
    final pref = await preference;
    await pref.setInt(EnumToString.convertToString(key), value);
  }
}
