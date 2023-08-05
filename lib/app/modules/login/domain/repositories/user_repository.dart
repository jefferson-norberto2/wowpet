import 'package:fpdart/fpdart.dart';

import '../entities/user.dart';
import '../erros/erros.dart';

abstract class IUserRepository {
  Future<Either<IUserException, User>> getUser(User user);
  Future<Either<IUserException, User>> sendUser(User user);
}