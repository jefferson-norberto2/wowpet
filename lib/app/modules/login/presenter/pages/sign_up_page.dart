import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wowpet/app/modules/login/presenter/states/sign_up_state.dart';
import 'package:wowpet/app/modules/login/presenter/stores/sign_up_store.dart';
import '../components/custom_text_field.dart';
import '../../../../config/custom_colors.dart';
import '../../domain/entities/user.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

enum Pet { yes, no }

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerCpf = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerRua = TextEditingController();
  final TextEditingController controllerBairro = TextEditingController();
  final TextEditingController controllerCEP = TextEditingController();
  late User user;

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<SignUpStore>();
    final state = store.value;

    if (state is LoadingSignUpState){
    } else if (state is ErrorSignUpState){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showMyDialog(title: "Error", message: state.message, isAError: true, store: store);
      });
    } else if (state is SuccessSignUpState){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showMyDialog(title: "Cadastro realizado", message: "Verifique seu e-mail para confirmar seu cadastro", isAError: false, store: store);
      });
    }

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
      body: Column(
        mainAxisSize: MainAxisSize.max,
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextField(
                    icon: Icons.person,
                    label: 'Nome',
                    controller: controllerName,
                  ),
                  // CustomTextField(
                  //   icon: Icons.card_membership,
                  //   label: 'CPF',
                  //   keyboardType: TextInputType.number,
                  //   inputFormatters: [cpfFormartter],
                  //   controller: controllerCpf,
                  // ),
                  CustomTextField(
                    icon: Icons.email,
                    label: 'Email',
                    controller: controllerEmail,
                  ),
                  // CustomTextField(
                  //   icon: Icons.phone,
                  //   label: 'Celular',
                  //   keyboardType: TextInputType.phone,
                  //   inputFormatters: [phoneFormartter],
                  //   controller: controllerPhone,
                  // ),
                  CustomTextField(
                    icon: Icons.lock,
                    isSecrect: true,
                    label: 'Senha',
                    controller: controllerPassword,
                  ),
                  // CustomTextField(
                  //   icon: Icons.file_copy,
                  //   label: 'Endereço',
                  //   controller: controllerRua,
                  // ),
                  // CustomTextField(
                  //   icon: Icons.file_copy,
                  //   label: 'Bairro',
                  //   controller: controllerBairro,
                  // ),
                  CustomTextField(
                    icon: Icons.file_copy,
                    label: 'CEP',
                    keyboardType: TextInputType.number,
                    inputFormatters: [cepFormartter],
                    controller: controllerCEP,
                  ),
                  const Spacer(),
                  // Text(
                  //   'Você tem algum animal de estimação?',
                  //   style: TextStyle(
                  //       fontSize: 16,
                  //       color: CustomColors.customPrimaryColor,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Radio(
                  //       value: Pet.yes,
                  //       groupValue: pet,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           pet = value!;
                  //         });
                  //       },
                  //     ),
                  //     const Text('Sim'),
                  //     SizedBox(
                  //       width: size.width * 0.1,
                  //     ),
                  //     Radio(
                  //       value: Pet.no,
                  //       groupValue: pet,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           pet = value!;
                  //         });
                  //       },
                  //     ),
                  //     const Text('Não'),
                  //   ],
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 45),
                        backgroundColor: CustomColors.customPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        user =  User(
                            name: controllerName.text,
                            email: controllerEmail.text,
                            password: controllerPassword.text,
                            cep: controllerCEP.text,
                            havePet: pet == Pet.yes ? true : false,
                          );
                        store.registerUser(user);
                        
                      },
                      child: const Text(
                        'Confirmar',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onExit(SignUpStore store){
    store.cleanState();
    Modular.to.pushNamed('/home');
  }

  void _showMyDialog({required String title, required String message, bool isAError = false, SignUpStore? store}) {
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
                if (!isAError) {
                 Modular.to.pop();
                }
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
