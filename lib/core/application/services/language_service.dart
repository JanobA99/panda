import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageService extends ChangeNotifier {
  static const String _languageKey = 'selected_language';
  static const String _defaultLanguage = 'ru'; // Default to Russian
  
  Locale _currentLocale = const Locale('ru');
  bool _isInitialized = false;
  
  Locale get currentLocale => _currentLocale;
  bool get isInitialized => _isInitialized;
  
  LanguageService() {
    _loadLanguage();
  }
  
  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_languageKey) ?? _defaultLanguage;
    _currentLocale = Locale(languageCode);
    _isInitialized = true;
    notifyListeners();
  }
  
  Future<void> setLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
    _currentLocale = Locale(languageCode);
    notifyListeners();
  }
  
  String getLanguageCode() {
    return _currentLocale.languageCode;
  }
  
  bool isRussian() => _currentLocale.languageCode == 'ru';
  bool isUzbek() => _currentLocale.languageCode == 'uz';
  bool isEnglish() => _currentLocale.languageCode == 'en';
} 