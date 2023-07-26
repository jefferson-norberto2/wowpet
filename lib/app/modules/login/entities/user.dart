class User {
  String _name;
  String _cpf;
  String _email;
  String _phone;
  String _password;
  String _street;
  String _neighborhood;
  String _cep;
  bool _hasPet;

  User(this._name, this._cpf, this._email, this._phone, this._password,
      this._street, this._neighborhood, this._cep, this._hasPet);

  String get name => _name;
  String get cpf => _cpf;
  String get email => _email;
  String get phone => _phone;
  String get password => _password;
  String get street => _street;
  String get neighborhood => _neighborhood;
  String get cep => _cep;
  bool get hasPet => _hasPet;

  set name(String name) => _name.isNotEmpty ? _name = name : _name;
  set cpf(String cpf) => _cpf.isNotEmpty ? _cpf = cpf : _cpf;
  set email(String email) => _email.isNotEmpty ? _email = email : _email;
  set phone(String phone) => _phone.isNotEmpty ? _phone = phone : _phone;
  set password(String password) =>
      _password.isNotEmpty ? _password = password : _password;
  set street(String street) => _street.isNotEmpty ? _street = street : _street;
  set neighborhood(String neighborhood) =>
      _neighborhood.isNotEmpty ? _neighborhood = neighborhood : _neighborhood;
  set cep(String cep) => _cep.isNotEmpty ? _cep = cep : _cep;
  set hasPet(bool hasPet) => _hasPet != hasPet ? _hasPet = hasPet : _hasPet;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['urser_name'],
      json['cpf'],
      json['email'],
      json['phone'],
      json['password'],
      json['street'],
      json['neighborhood'],
      json['CEP'],
      json['has_pet'] == '1' ? true : false,
    );
  }

  Map<String, dynamic> toJson() => {
        'user_name': _name,
        'cpf': _cpf,
        'email': _email,
        'password': _password,
        'street': _street,
        'neighborhood': _neighborhood,
        'CEP': _cep,
        'phone': _phone,
        'has_pet': _hasPet ? '1' : '0',
      };
}
