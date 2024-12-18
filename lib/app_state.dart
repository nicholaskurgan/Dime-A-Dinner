import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _spoonApiKey = prefs.getString('ff_spoonApiKey') ?? _spoonApiKey;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _diet = '';
  String get diet => _diet;
  set diet(String value) {
    _diet = value;
  }

  String _spoonApiKey = '95da35b82b7d4c97b292df5502949605';
  String get spoonApiKey => _spoonApiKey;
  set spoonApiKey(String value) {
    _spoonApiKey = value;
    prefs.setString('ff_spoonApiKey', value);
  }

  bool _seatchMode = false;
  bool get seatchMode => _seatchMode;
  set seatchMode(bool value) {
    _seatchMode = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
