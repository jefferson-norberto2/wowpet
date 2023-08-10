import 'package:fpdart/fpdart.dart';
import '../erros/erros.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

abstract class IGetUser{
  Future<Either<IUserException, User>> call(User user);
}

class GetUser implements IGetUser{
  final IUserRepository _userRepository;

  GetUser(this._userRepository);

  @override
  Future<Either<IUserException, User>> call(User user) async {
    if (user.email.isEmpty || user.password.isEmpty) {
      return left(const UserException('Todos os campos precisam ser preenchidos'));
    }

    
    return await _userRepository.signIn(User(name: user.name,
           email: user.email,
           password: encryptPassword(user.password),
           cep: user.cep,));
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