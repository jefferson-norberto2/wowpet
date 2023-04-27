import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:wowpet/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
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
          return Center(
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                const TextField(
                  decoration: InputDecoration(labelText: 'Senha'),
                ),
                IconButton(
                  onPressed: () {
                    store.login();
                  },
                  icon: const Icon(Icons.login),
                ),
              ],
            ),
          );
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
