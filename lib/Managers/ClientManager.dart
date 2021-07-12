import 'dart:convert';

import 'package:ds1/http/Api.dart';
import 'package:ds1/interfaces/Client.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ClientManager extends ChangeNotifier {
  ClientManager() {
    _loadAllClient();
  }

  List<Client> clients = [];

  Future<void> _loadAllClient() async {
    final response = await http.get(Uri.parse('${Api.BASE_URL}/clients'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    Iterable i = json.decode(response.body);
    clients = List<Client>.from(i.map((model) => Client.fromJson(model)));

    notifyListeners();
  }
}