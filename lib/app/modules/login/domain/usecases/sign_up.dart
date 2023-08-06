import 'package:fpdart/fpdart.dart';
import '../entities/user.dart';
import '../erros/erros.dart';
import '../repositories/user_repository.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

abstract class ISignUp {
  Future<Either<IUserException, bool>> call(User user);
}

class SignUp implements ISignUp {
  final IUserRepository _userRepository;
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  SignUp(this._userRepository);

  @override
  Future<Either<IUserException, bool>> call(User user) async {
    if (user.email.isEmpty || user.password.isEmpty || user.name!.isEmpty || user.cep!.isEmpty) {
      return left(const UserException('Todos os campos precisam ser preenchidos'));
    }
    
    if (!emailRegExp.hasMatch(user.email)) {
      return left(const UserException('E-mail inválido'));
    }

    if (user.password.length < 6) {
      return left(const UserException('Senha deve conter no mínimo 6 caracteres'));
    }

    if (user.cep!.length < 8) {
      return left(const UserException('CEP inválido'));
    }
    
    return await _userRepository.signUp(
      User(name: user.name,
           email: user.email,
           password: encryptPassword(user.password),
           cep: user.cep,
            havePet: user.havePet,
      ));
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
}