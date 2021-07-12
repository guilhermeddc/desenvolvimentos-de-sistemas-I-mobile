import 'dart:convert';

import 'package:ds1/http/Api.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CityManager extends ChangeNotifier {
  CityManager() {
    _loadAllCity();
  }

  Future<void> _loadAllCity() async {
    final response = await http.get(Uri.parse('${Api.BASE_URL}/cities'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
    );

    print(json.decode(response.body)[0]['name']);
    notifyListeners();
  }
}