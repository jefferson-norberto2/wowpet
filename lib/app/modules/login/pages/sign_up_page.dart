import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../components/custom_text_field.dart';
import '../../../config/custom_colors.dart';
import '../entities/user.dart';
import '../stores/sing_up_store.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

enum Pet { yes, no }

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerCpf = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerRua = TextEditingController();
  final TextEditingController controllerBairro = TextEditingController();
  final TextEditingController controllerCEP = TextEditingController();
  final SignUpStore _signUpStore = Modular.get();
  late User _user;

  final cepFormartter = MaskTextInputFormatter(
    mask: '##.###-###',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final cpfFormartter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final phoneFormartter = MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  Pet pet = Pet.yes;

  @override
  void dispose() {
    controllerName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerPhone.dispose();
    controllerRua.dispose();
    controllerBairro.dispose();
    controllerCEP.dispose();
    _signUpStore.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Text(
                  'Cadastro',
                  style: TextStyle(
                    color: CustomColors.customPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    icon: Icons.person,
                    label: 'Nome',
                    controller: controllerName,
                  ),
                  CustomTextField(
                    icon: Icons.card_membership,
                    label: 'CPF',
                    keyboardType: TextInputType.number,
                    inputFormatters: [cpfFormartter],
                    controller: controllerCpf,
                  ),
                  CustomTextField(
                    icon: Icons.email,
                    label: 'Email',
                    controller: controllerEmail,
                  ),
                  CustomTextField(
                    icon: Icons.phone,
                    label: 'Celular',
                    keyboardType: TextInputType.phone,
                    inputFormatters: [phoneFormartter],
                    controller: controllerPhone,
                  ),
                  CustomTextField(
                    icon: Icons.lock,
                    isSecrect: true,
                    label: 'Senha',
                    controller: controllerPassword,
                  ),
                  CustomTextField(
                    icon: Icons.file_copy,
                    label: 'Endereço',
                    controller: controllerRua,
                  ),
                  CustomTextField(
                    icon: Icons.file_copy,
                    label: 'Bairro',
                    controller: controllerBairro,
                  ),
                  CustomTextField(
                    icon: Icons.file_copy,
                    label: 'CEP',
                    keyboardType: TextInputType.number,
                    inputFormatters: [cepFormartter],
                    controller: controllerCEP,
                  ),
                  Text(
                    'Você tem algum animal de estimação?',
                    style: TextStyle(
                        fontSize: 16,
                        color: CustomColors.customPrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                        value: Pet.yes,
                        groupValue: pet,
                        onChanged: (value) {
                          setState(() {
                            pet = value!;
                          });
                        },
                      ),
                      const Text('Sim'),
                      SizedBox(
                        width: size.width * 0.1,
                      ),
                      Radio(
                        value: Pet.no,
                        groupValue: pet,
                        onChanged: (value) {
                          setState(() {
                            pet = value!;
                          });
                        },
                      ),
                      const Text('Não'),
                    ],
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
                          if (pet == Pet.yes) {
                            Modular.to.pushNamed('/register_pet/');
                          } else {
                            _user = User(
                              controllerName.text,
                              controllerCpf.text,
                              controllerEmail.text,
                              controllerPhone.text,
                              controllerPassword.text,
                              controllerRua.text,
                              controllerBairro.text,
                              controllerCEP.text,
                              false,
                            );
                            _signUpStore.singUp(_user);
                          }
                        },
                        child: const Text(
                          'Continuar',
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
