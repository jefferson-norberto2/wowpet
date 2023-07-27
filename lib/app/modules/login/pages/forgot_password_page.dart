import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wowpet/app/modules/login/stores/forgot_password_store.dart';
import '../components/custom_text_field.dart';
import '../../../config/custom_colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final ForgotPasswordStore _forgotPasswordStore = Modular.get();

  
  final phoneFormartter = MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );


  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPhone.dispose();
    _forgotPasswordStore.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.customPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Center(
                child: Text(
                  'Recuperar Senha',
                  style: TextStyle(
                    color: CustomColors.customPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),

            // Form fields
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    icon: Icons.email,
                    label: 'Email',
                    controller: controllerEmail,
                    padding_bottom: 0,
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
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                  CustomTextField(
                    icon: Icons.phone,
                    label: 'Celular',
                    keyboardType: TextInputType.phone,
                    inputFormatters: [phoneFormartter],
                    controller: controllerPhone,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.customPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          
                        },
                        child: const Text(
                          'Solicitar nova senha',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
