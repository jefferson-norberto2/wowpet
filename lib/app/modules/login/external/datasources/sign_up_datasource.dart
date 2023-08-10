import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wowpet/app/config/constants.dart';
import 'package:wowpet/app/modules/login/infra/datasources/sign_up_datasource.dart';
import '../../domain/erros/erros.dart';

class SignUpDatasource implements ISignUpDatasource {
  final http.Client httpClient;

  SignUpDatasource(this.httpClient);
  
  @override
  Future<Map<String, dynamic>> signUp(Map<String, dynamic> user) async {
    try{
      final uriConnect = Uri.parse('http://$ip:$port/is_online');
      await httpClient.get(uriConnect).timeout(const Duration(seconds: 2));
      
      final uri = Uri.parse('http://$ip:$port/sign_up');
      final request = await httpClient.post(uri, body: user);
      final decoded = jsonDecode(request.body);
      return decoded;
    } catch (e, s) {
      throw UserDatasourceException("Problema de conexão com servidor", s);
    }
  }
}