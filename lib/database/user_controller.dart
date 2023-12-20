// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

import 'package:financas_app/models/account_model.dart';
import 'package:financas_app/models/user_model.dart';
import 'package:financas_app/services/account_service.dart';
import 'package:financas_app/services/auth.dart';
import 'package:financas_app/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserController {
  late final AuthService _auth;
  late final UserService userService;
  late final AccountService accountService;
  UserController() {
    _auth = AuthService();
    accountService = AccountService();
    userService = UserService();
  }

  Future<bool> signUp(String email, String password) async {
    try {
      UserCredential userResponse = await _auth.signUp(email, password);
      if (userResponse.user != null) {
        String userId = userResponse.user!.uid;
        UserModel user = UserModel(
          email: email,
          id: userId,
          password: password,
        );
        await userService
            .createUser(user)
            .then((value) => {log('User created')})
            .catchError((onError) => {log(onError.toString())});
        Account account = Account(
          total: 0,
          totalIncomes: 0,
          totalExpenses: 0,
          id: userId,
        );
        await accountService
            .createAccount(account)
            .then((value) => {})
            .catchError((onError) => throw Exception(onError));
        return true;
      } else {
        throw Exception('Internal Error');
      }
    } catch (e) {
      return false;
      
    }
  }
}
