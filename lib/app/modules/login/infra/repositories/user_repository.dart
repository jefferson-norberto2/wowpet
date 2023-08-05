import 'package:fpdart/fpdart.dart';

import '../../domain/entities/user.dart';
import '../../domain/erros/erros.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_datasource.dart';

class UserRepository extends IUserRepository {
  final IUserDatasource _userDatasource;

  UserRepository(this._userDatasource);

  @override
  Future<Either<IUserException, User>> getUser(User user) async {
    
    try{
      final userReceived = await _userDatasource.getUser(user);
      return right(userReceived);
    } catch (e) {
      return left(const UserException("Problem to get user, check connection"));
    }
  }
  
  @override
  Future<Either<IUserException, User>> sendUser(User user) async {
    try{
      final sucess = await _userDatasource.sendUser(user);
      return right(sucess);
    } catch (e) {
      return left(const UserException("Problem to send user, check connection"));
    }
  }
  
}