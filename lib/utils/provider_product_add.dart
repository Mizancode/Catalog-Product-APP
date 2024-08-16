import 'package:flutter/material.dart';

class ProviderProductAdd extends ChangeNotifier{
  List<Map<String,dynamic>> marked=[];
  void add(Map<String,dynamic> val){
    marked.add(val);
    notifyListeners();
  }
  void removed(Map<String,dynamic> val){
    marked.remove(val);
    notifyListeners();
  }
}