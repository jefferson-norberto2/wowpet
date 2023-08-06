import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wowpet/app/modules/login/infra/datasources/sign_in_datasource.dart';
import '../../domain/erros/erros.dart';

class SignInDatasource implements ISignInDatasource {
  final http.Client httpClient;

  SignInDatasource(this.httpClient);
  
  @override
  Future<Map<String, dynamic>> signIn(Map<String, dynamic> user) async {
    try{
      final uriConnect = Uri.parse('http://10.0.2.2:5000/is_online');
      await httpClient.get(uriConnect).timeout(const Duration(seconds: 2));
      
      final uri = Uri.parse('http://10.0.2.2:5000/sign_in');
      final request = await httpClient.post(uri, body: user);
      final decoded = jsonDecode(request.body);
      return decoded;
    } catch (e, s) {
      throw UserDatasourceException("Problema de conexão com servidor", s);
    }
  }
  
}