import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'dart:convert';

class CommunicationStore {
  Future<void> registerUser() async {
    var url = 'http://localhost:5000/register';

    String password = encryptPassword('password321');

    var response = await http.post(
      Uri.parse(url),
      body: {
        'full_name': 'John Doe',
        'email': 'johndoe@example.com',
        'password': password,
        'street': '123 Main St',
        'neighborhood': 'my',
        'CEP': '59300-000',
        'phone': '555-1234',
        'has_pet': '1',
      },
    );

    if (response.statusCode == 200) {
      print('User registered successfully!');
    } else {
      print('Failed to register user. Error: ${response.statusCode}');
    }
  }

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
}
