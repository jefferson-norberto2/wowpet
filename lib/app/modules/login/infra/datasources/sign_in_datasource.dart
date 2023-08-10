abstract class ISignInDatasource{
  Future<Map<String, dynamic>> signIn(Map<String, dynamic> request);
}