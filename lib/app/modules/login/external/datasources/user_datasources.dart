import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/user.dart';
import '../../domain/erros/erros.dart';
import '../../infra/datasources/user_datasource.dart';
import '../adapters/user_adapter.dart';

class UserDatasource implements IUserDatasource {
  final http.Client httpClient;
  static const url = 'http://127.0.0.1:5001';

  UserDatasource(this.httpClient);
  
  @override
  Future<User> getUser(User user) async {
    try{
      final uri = Uri.parse('$url/sign_in');
      final body = UserAdapter.toJsonLogin(user);
      final request = await httpClient.post(uri, body: body);
      final decoded = jsonDecode(request.body);
      final sucess = UserAdapter.fromJsonLogin(decoded);
      return sucess;
    } catch (e, s) {
      print(e.toString() + s.toString());
      throw UserDatasourceException("Problem connecting to the server ${e.toString()}", s);
    }
  }
  
  @override
  Future<User> sendUser(User user) async {
    try{
      final uri = Uri.parse('$url/sign_up');
      final body = UserAdapter.toJsonRegister(user);
      final request = await httpClient.post(uri, body: body);
      final sucess = jsonDecode(request.body);
      final decoded = UserAdapter.fromJsonRegister(sucess);
      return decoded;
    } catch (e, s) {
      print(e.toString() + s.toString());
      throw UserDatasourceException("Problem connecting to the server ${e.toString()}", s);
    }
  }
}