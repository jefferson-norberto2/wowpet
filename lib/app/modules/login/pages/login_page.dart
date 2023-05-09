import 'package:flutter_triple/flutter_triple.dart';
import 'package:wowpet/app/config/custom_colors.dart';
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
  final store = LoginStore();
  late Disposer disposer;

  @override
  void initState() {
    super.initState();
    disposer = store.observer(onState: print);
  }

  @override
  void dispose() {
    super.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.customPrimaryColor,
      child: SafeArea(
        child: Scaffold(
          body: ScopedBuilder<LoginStore, int>(
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
        ),
      ),
    );
  }
}
