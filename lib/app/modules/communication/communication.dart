import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:wowpet/app/modules/login/models/user.dart';

class CommunicationStore {
  String encryptPassword(String password) {
    // Convert the password to bytes
    List<int> passwordBytes = utf8.encode(password);

    // Hash the password bytes using SHA-256
    Digest hashedBytes = sha256.convert(passwordBytes);

    // Convert the hashed bytes to a hex string
    String encryptedPassword = hashedBytes.toString();

    return encryptedPassword;
  }

  bool verifyPassword(String enteredPassword, String storedPassword) {
    return encryptPassword(enteredPassword) == storedPassword;
  }

  Future<bool> addUser(User user) async {
    var url = 'http://localhost:5000/register';

    user.password = encryptPassword(user.password);

    var response = await http.post(
      Uri.parse(url),
      body: user.toJson(),
    );

    if (response.statusCode == 200) {
      debugPrint('User registered successfully!');
      return true;
    } else {
      debugPrint('Failed to register user. Error: ${response.statusCode}');
      return false;
    }
  }
}
