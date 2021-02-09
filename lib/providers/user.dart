import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class User with ChangeNotifier {
  bool _isCustomer = true;
  bool _isLoading = false;
  final Map<String, String> _formData = {};

  Map<String, String> get formData {
    Map<String, String> tempFormData = {};
    _formData.forEach((key, value) {
      tempFormData.addAll({'$key': '$value'});
    });
    return tempFormData;
  }

  bool get isCustomer => _isCustomer;

  bool get isLoading => _isLoading;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setIsCustomer(bool value) {
    _isCustomer = value;
    notifyListeners();
  }

  void toggleUserType() {
    _isCustomer = !_isCustomer;
    notifyListeners();
  }

  void addFormData(Map<String, String> data) {
    _formData.addAll(data);
  }

  Future<http.Response> signUp(
      String name, String email, String password) async {
    const url =
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=AIzaSyCFQOD5cAUqXk-kdrcG1m8O0gqb-2PTzMA';
    final response = await http.post(url,
        body: convert.json.encode({
          'name': name,
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));
    print(convert.json.decode(response.body));
    return response;
  }

  Future<http.Response> logIn(String email, String password) async {
    const url =
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyCFQOD5cAUqXk-kdrcG1m8O0gqb-2PTzMA';
    final response = await http.post(url,
        body: convert.json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));
    print(convert.json.decode(response.body));
    return response;
  }
}
