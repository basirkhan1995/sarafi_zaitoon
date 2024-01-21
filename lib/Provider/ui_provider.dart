 import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

 class UiProvider extends ChangeNotifier{

   bool _isOnboarding = true;
   bool get isOnboarding => _isOnboarding;


   late SharedPreferences prefs;


   disableOnboarding(){
     _isOnboarding = false;
     prefs.setBool("isOnboarding", _isOnboarding);
     notifyListeners();
   }

  init()async{
   prefs = await SharedPreferences.getInstance();
   _isOnboarding = prefs.getBool("isOnboarding")??true;
    notifyListeners();
  }
 }