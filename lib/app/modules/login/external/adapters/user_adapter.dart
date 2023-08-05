
import '../../domain/entities/user.dart';

class UserAdapter {
  static User fromJsonLogin(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      password: json['password'],
    );
  }

  static Map<String, dynamic> toJsonLogin(User user) {
    return {
      'id': '',
      'email': user.email,
      'password': user.password,
    };
  }

  static User fromJsonRegister(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      cep: json['cep'],
      havePet: json['havePet'],
    );
  }

  static Map<String, dynamic> toJsonRegister(User user) {
    return {
      'id': '',
      'email': user.email,
      'password': user.password,
      'name': user.name,
      'cep': user.cep,
      'havePet': user.havePet,
    };
  }

  
}