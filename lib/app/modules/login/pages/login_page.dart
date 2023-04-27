import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:wowpet/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:wowpet/app/modules/login/pages/sign_in_screen.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'Entrar'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  late final LoginStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<LoginStore>();
  }

  @override
  void dispose() {
    Modular.dispose<LoginStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ScopedBuilder<LoginStore, Exception, int>(
        store: store,
        onState: (context, counter) {
          return const SignInScreen();
        },
        onError: (context, error) => const Center(
          child: Text(
            'Put error here',
            style: TextStyle(color: Colors.red),
          ),
        ),
        onLoading: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
