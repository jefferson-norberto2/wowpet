
import '../../domain/entities/user.dart';

class UserAdapter {
  static User fromJsonSignIn(Map<String, dynamic> json) {
    try{
    return User(
      id: json['id'],
      email: json['email'],
      password: json['password'],
    );
    } catch (e) {
      throw Exception(e);
    }
  }

  static Map<String, dynamic> toJsonSignIn(User user) {
    return {
      'id': '',
      'email': user.email,
      'password': user.password,
    };
  }

  static User fromJsonSignUp(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      cep: json['cep'],
      havePet: json['havePet'],
    );
  }

  static Map<String, dynamic> toJsonSignUp(User user) {
    return {
      'id': '',
      'email': user.email,
      'password': user.password,
      'name': user.name,
      'cep': user.cep,
      'havePet': user.havePet.toString(),
    };
  }

  
}