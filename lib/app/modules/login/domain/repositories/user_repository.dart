import 'package:fpdart/fpdart.dart';

import '../entities/user.dart';
import '../erros/erros.dart';

abstract class IUserRepository {
  Future<Either<IUserException, User>> signIn(User user);
  Future<Either<IUserException, User>> signUp(User user);
}