import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../components/custom_text_field.dart';
import '../../../../config/custom_colors.dart';
import '../states/login_state.dart';
import '../../domain/entities/user.dart';
import '../stores/login_store.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool keepLoged = false;
  final editTextEmail = TextEditingController(text: "");
  final editTextPassword = TextEditingController(text: "");


  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<LoginStore>();
    final state = store.value;
    final height = MediaQuery.of(context).size.height;

    if (state is LoadingLoginState){
    } else if (state is ErrorLoginState){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showMyDialog(title: "Error", message: state.message, isAError: true, store: store);
      });
    } else if (state is SucessLoginState){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Modular.to.pushNamed('/task_module/', arguments: state.user);
      });
    }

    return 
    SafeArea(child: 
      Scaffold(
        body: SingleChildScrollView(
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
                  padding: EdgeInsets.symmetric(vertical: height * 0.1),
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
                  icon: Icons.email,
                  label: 'E-mail',
                  controller: editTextEmail,
                ),

                // Password
                CustomTextField(
                  icon: Icons.lock,
                  label: 'Senha',
                  isSecrect: true,
                  padding_bottom: 0.0,
                  controller: editTextPassword,
                ),

                Row(
                  children: [
                    Checkbox(
                      value: keepLoged, 
                      onChanged: (bool? onChanged){ 
                        setState(() { 
                          keepLoged = onChanged!; 
                        });
                      }),
                    const Text("Manter conectado"),
                    const Spacer(),
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
                  ],
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
                        FocusScope.of(context).unfocus();
                        store.login(User(email: editTextEmail.text, password: editTextPassword.text));
                        // Modular.to.pushNamed('/home/');
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
    ),
    ),
    );
  }

  void onExit(LoginStore store){
    store.cleanState();
    Modular.to.pushNamed('/home');
  }

  void _showMyDialog({required String title, required String message, bool isAError = false, LoginStore? store}) {
    if(MediaQuery.of(context).viewInsets.bottom == 0.0){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title, style: TextStyle(color: isAError ? Colors.red : Colors.black)),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (store != null) {
                  store.cleanState();
                }
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
  }
}

