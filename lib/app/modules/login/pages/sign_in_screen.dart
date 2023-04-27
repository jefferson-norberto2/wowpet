import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../pages/sign_up_screen.dart';
import '../components/custom_text_field.dart';
import '../../../config/custom_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                const CustomTextField(
                    icon: Icons.email, label: 'Usuário ou Email'),

                // Password
                const CustomTextField(
                  icon: Icons.lock,
                  label: 'Senha',
                  isSecrect: true,
                  padding_bottom: 0.0,
                ),

                // Forgot Password Button
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
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
                      onPressed: () {},
                      child: const Text(
                        'Entrar',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),

                // Create Account Button
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: SizedBox(
                    height: 45,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (c) => SignUpScreen()));
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
                            child: Image.asset(
                              'assets/images/logo_google.png',
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                          ),
                          Text(
                            'Entrar com o Google',
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

                // Report animal
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
                      onPressed: () {},
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
