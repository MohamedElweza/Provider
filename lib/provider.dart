import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier{

  String? conUserName;
  String? conEmail;
  String? conPassword;
  String? image;
  String? phone;
  int counter =0;


  void increment(){
    counter++;
    notifyListeners();
}

  void decrement(){
    counter--;
    notifyListeners();
  }

}