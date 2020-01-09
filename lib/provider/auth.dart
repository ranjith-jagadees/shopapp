import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/httpexception.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  bool get isAuth {
    print('isAuth triggered');
    bool auth =  token != null;
    print(auth);
    return auth;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> authenticate(
      String email, String password, String authUrl) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$authUrl?key=AIzaSyCfAbTg3McFXzizdJRSTUrJNbpLPPbs8FE';
    print(email);
    try {
      final response = await http.post(url,
          body: json.encode({
            'email': '$email',
            'password': password,
            'returnSecureToken': true
          }));
      print(json.decode(response.body));
      // if (json.decode(response.body)['error'] >= 400) {
      //   throw HttpException('SignUp or SignIn error');
      // }
      _token = 'token generated';
      _userId = 'ranjith Jagadees';
      _expiryDate = DateTime.now().add(Duration(seconds: 500000));
      print('notifyListeners triggered');
      notifyListeners();
      print(json.decode(response.body));
      return json.decode(response.body);
    } catch (err) {
      throw err;
    }
  }

  Future<void> signup(String email, String password) async {
    // const url =
    //     'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCfAbTg3McFXzizdJRSTUrJNbpLPPbs8FE';
    // final response = await http.post(url,
    //     body: json.encode(
    //         {'email': email, 'password': password, 'returnSecureToken': true}));
    // print(json.decode(response.body));
    return authenticate(email, password, 'signUp');
  }

  Future<void> signin(String email, String password) async {
    // const url =
    //     'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCfAbTg3McFXzizdJRSTUrJNbpLPPbs8FE';
    // final response = await http.post(url,
    //     body: json.encode(
    //         {'email': email, 'password': password, 'returnSecureToken': true}));
    // print(json.decode(response.body));
    return authenticate(email, password, 'signInWithPassword');
  }
}
