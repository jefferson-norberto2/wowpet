class User {
  final String? id;
  final String? name;
  final String email;
  final String password;
  final String? senha;
  final String? cep;
  final bool? havePet;

  User({required this.email, required this.password, this.id, this.name, this.senha, this.cep, this.havePet,});
}