import 'package:fpdart/fpdart.dart';
import '../datasources/sign_in_datasource.dart';
import '../../domain/entities/user.dart';
import '../../domain/erros/erros.dart';
import '../../domain/repositories/user_repository.dart';
import '../adapters/user_adapter.dart';
import '../datasources/sign_up_datasource.dart';

class UserRepository extends IUserRepository {
  final ISignInDatasource _signInDatasource;
  final ISignUpDatasource _signUpDatasource;

  UserRepository(this._signInDatasource, this._signUpDatasource);

  @override
  Future<Either<IUserException, User>> signIn(User user) async {
    
    try{
      final request = UserAdapter.toJsonSignIn(user);
      final response = await _signInDatasource.signIn(request);
      try{
        final sucess = UserAdapter.fromJsonSignIn(response['sign_in']);
        return right(sucess);
      } catch (e) {
        return left(const UserException('Usuário não encontrado'));
      }
    } catch (e) {
      return left(const UserException('Problema de conexão com o servidor'));
    }
  }
  
  @override
  Future<Either<IUserException, bool>> signUp(User user) async {
    try{
      final request = UserAdapter.toJsonSignUp(user);
      final response = await _signUpDatasource.signUp(request);
      return right(response['sign_up']);
    } catch (e) {
      return left(const UserException("Problema ao cadastrar usuário"));
    }
  }
  
}