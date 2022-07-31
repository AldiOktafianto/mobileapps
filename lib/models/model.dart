import 'dart:convert';
import 'package:netflix_/models/dio.dart';

import 'movie_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LibraryServices extends ChangeNotifier {
  List<Films> defaultList = [];

  void updateListener(Films movie, BuildContext context) {
    defaultList.add(movie);
    notifyListeners();
    print(defaultList.length);
  }

  void deleteListener(Films movie, BuildContext context) {
    defaultList.remove(movie);
    notifyListeners();
  }
}