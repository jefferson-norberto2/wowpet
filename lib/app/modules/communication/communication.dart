import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'dart:convert';

import '../login/domain/entities/user.dart';

class CommunicationStore {
  // final ip = 'http://192.168.1.72:5000';

  // String encryptPassword(String password) {
  //   // Convert the password to bytes
  //   List<int> passwordBytes = utf8.encode(password);

  //   // Hash the password bytes using SHA-256
  //   Digest hashedBytes = sha256.convert(passwordBytes);

  //   // Convert the hashed bytes to a hex string
  //   String encryptedPassword = hashedBytes.toString();

  //   return encryptedPassword;
  // }

  // bool verifyPassword(String enteredPassword, String storedPassword) {
  //   return encryptPassword(enteredPassword) == storedPassword;
  // }

  // Future<String?> login(String email, String password) async {
  //   var url = '$ip/login';

  //   var response = await http.post(
  //     Uri.parse(url),
  //     body: {
  //       'email': email,
  //       'password': encryptPassword(password),
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     debugPrint('User logged in successfully!');
  //     return response.body;
  //   } else {
  //     debugPrint('Failed to login user. Error: ${response.statusCode}');
  //     return null;
  //   }
  // }

  // Future<bool> addUser(User user) async {
  //   String url = '$ip/register';

  //   user.password = encryptPassword(user.password);

  //   var response = await http.post(
  //     Uri.parse(url),
  //     body: user.toJson(),
  //   );

  //   if (response.statusCode == 200) {
  //     debugPrint('User registered successfully!');
  //     return true;
  //   } else {
  //     debugPrint('Failed to register user. Error: ${response.statusCode}');
  //     return false;
  //   }
  // }

  // Future<bool> recover_password(String? email, String? password) {
  //   return Future.delayed(const Duration(seconds: 2), () => true);
  // }
}
