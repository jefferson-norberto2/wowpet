
import '../../domain/entities/user.dart';

abstract class IUserDatasource{
  Future<User> getUser(User user);
  Future<User> sendUser(User user);
}