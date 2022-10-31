import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

// utility class to manage user sessions by email & password
// using shared preferences
class UserSessions {
  static const String _key = 'user_sessions';
  static const String _emailKey = 'email';
  static const String _passwordKey = 'password';
  static const String _nameKey = 'name';
  static const String _roleKey = 'role';

  static Future<void> saveSession(String email, String password, String name, String role) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final Map<String, String> session = <String, String>{
      _emailKey: email,
      _passwordKey: password,
      _nameKey: name,
      _roleKey: role

    };
    prefs.setString(_key, json.encode(session));
  }

  static Future<Map<String, String>?> getSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? session = prefs.getString(_key);
    if (session == null) {
      return null;
    }
    return json.decode(session) as Map<String, String>;
  }

  static Future<void> deleteSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_key);
  }
}