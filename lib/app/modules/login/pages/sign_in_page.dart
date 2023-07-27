import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../components/custom_text_field.dart';
import '../../../config/custom_colors.dart';
import '../stores/login_store.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final store = Modular.get<LoginStore>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int selectedIndex = 0;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // App name
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text.rich(
                        TextSpan(
                            style: const TextStyle(
                              fontSize: 40,
                            ),
                            children: [
                              const TextSpan(
                                text: 'Pet',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'Friendly',
                                style: TextStyle(
                                  color: CustomColors.customColorYellow,
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 30,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          child: AnimatedTextKit(
                            pause: Duration.zero,
                            repeatForever: true,
                            animatedTexts: [
                              FadeAnimatedText(
                                'Cuide',
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              FadeAnimatedText(
                                'Informe-se',
                              ),
                              FadeAnimatedText(
                                'Reporte',
                              ),
                              FadeAnimatedText(
                                'Encontre',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Category

                // Email
                CustomTextField(
                  icon: Icons.person,
                  label: 'Usuário',
                  controller: emailController,
                ),

                // Password
                CustomTextField(
                  icon: Icons.lock,
                  label: 'Senha',
                  isSecrect: true,
                  padding_bottom: 0.0,
                  controller: passwordController,
                ),

                // Forgot Password Button
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Modular.to.pushNamed('/forgot_password/');
                    },
                    child: Text(
                      'Esqueceu sua senha?',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ),

                // Sign In Button
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.customPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        store.login(
                            emailController.text, passwordController.text);
                        selectedIndex += 1;
                        if (selectedIndex == 5) {
                          Modular.to.pushNamed('/home/');
                        }
                      },
                      child: const Text(
                        'Entrar',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),

                // Google Button
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: SizedBox(
                    height: 45,
                    child: OutlinedButton(
                      onPressed: () {
                        Modular.to.pushNamed('/sign_up/');
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            color: CustomColors.customPrimaryColor, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(Icons.person_add, color: CustomColors.customPrimaryColor,),),
                          Text(
                            'Cadastre-se',
                            style: TextStyle(
                                fontSize: 15,
                                color: CustomColors.customPrimaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Divider
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('OU'),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                      ),
                    ),
                  ],
                ),

                // Report animal or abuse
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 20),
                  child: SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.customPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Modular.to.pushNamed('/test/');
                      },
                      child: const Text(
                        'Reportar Animal ou Denunciar Abuso',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
