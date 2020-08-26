import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class sharedPreferences{

  // Save
  addStringToSF(String keyName, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(keyName, value);
  }

  addIntToSF(String keyName, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(keyName, value);
  }

  addBoolToSF(String keyName, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(keyName, value);
  }

  addDoubleToSF(String keyName, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(keyName, value);
  }

  // Read
  getStringValuesSF(String keyName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(keyName) ?? null;
    return stringValue;
  }

  getBoolValuesSF(String keyName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool boolValue = prefs.getBool(keyName);
    return boolValue;
  }

  getIntValuesSF(String keyName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int intValue = prefs.getInt(keyName)?? 0;
    return intValue;
  }

  getDoubleValuesSF(String keyName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double doubleValue = prefs.getDouble(keyName)?? 0;
    return doubleValue;
  }

  // Remove
  removeValues(String keyName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(keyName);
  }

  // Check value if present or not? (True/False)
  check(String keyName) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool CheckValue = prefs.containsKey(keyName);
    return CheckValue;
  }

}


// How to use it

// - Add 'shared_preferences:' to yamel file

// - Store Data :
// var SPmethods = sharedPreferences();
// SPmethods.addStringToSF('key', value);

// - Get Data :
// final SavedPage = await SPmethods.getStringValuesSF('key');