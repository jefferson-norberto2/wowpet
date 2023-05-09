import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class LoginStore extends Store<int> {
  LoginStore() : super(0);

  Future<void> login() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    Modular.to.pushReplacementNamed(
        '/home/'); // <--- Destroys the login page and pushes the home page
    // Modular.to
    //     .pushNamed('/home/'); // <--- Pushes the home page over the login page
    setLoading(false);
  }
}
