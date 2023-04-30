
import 'package:elys/model/ApiModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiProvider with ChangeNotifier {
  List<Api> _apis = [];
  bool _isLoading = false;

  List<Api> get apis => _apis;
  bool get isLoading => _isLoading;

  Future<void> fetchApis() async {
    try {
      _isLoading = true;
      notifyListeners();

      final response = await http.get(Uri.parse('https://api.publicapis.org/entries'));
      final responseData = json.decode(response.body);

      final List<Api> loadedApis = [];
      for (var apiData in responseData['entries']) {
        loadedApis.add(Api.fromJson(apiData));
      }

      _apis = loadedApis;
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
