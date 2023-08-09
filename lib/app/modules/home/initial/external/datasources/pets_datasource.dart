import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../domain/erros/error.dart';
import '../../infra/datasources/pets_datasource.dart';

class PetsDatasource implements IPetsDatasource {
  final http.Client client;

  PetsDatasource(this.client);

  @override
  Future<List> getLostPets() async {
    try{
      final uri = Uri.parse('http://10.0.2.2:5000/lost_pets');
      final request = await client.get(uri);
      final decoded = jsonDecode(request.body);
      return decoded['lost_pets'];
    } catch (e, s) {
      throw PetDatasourceException("Problema de conexão com servidor", s);
    }
  }

}