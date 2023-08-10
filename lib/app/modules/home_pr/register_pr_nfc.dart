import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:wowpet/app/config/custom_colors.dart';
import 'package:wowpet/app/modules/home/presenter/components/custom_button.dart';

import '../login/presenter/components/custom_text_field.dart';

class RegisterPrNfc extends StatefulWidget {
  const RegisterPrNfc({super.key});

  @override
  State<RegisterPrNfc> createState() => _RegisterPrNfcState();
}

enum Kind { dog, cat }

enum SizePet { small, medium, large }

class _RegisterPrNfcState extends State<RegisterPrNfc> {
  final cepFormartter = MaskTextInputFormatter(
    mask: '##.###-###',
    filter: {"#": RegExp(r'[0-9]')},
  );
  Kind pet = Kind.dog;
  SizePet sizePet = SizePet.small;
  static const breed = <String>{
    'SRD (Vira-lata)',
    'Poodle',
    'Yorkshire',
    'Shih Tzu',
    'Maltês',
    'Bulldog',
  };

  final List<DropdownMenuItem<String>> _dropDownBreed = breed
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  String _breedSelected = 'SRD (Vira-lata)';

  bool readed = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: CustomButton(
                text: readed == false
                    ? "Fazer leitura NFC"
                    : "Leitura NFC realizada!",
                onPressed: () {
                  if (!readed) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Aproxime o celular do chip NFC"),
                          content: const Icon(Icons.nfc_rounded, size: 80),
                          actions: [
                            TextButton(
                              child: const Text("Cancelar"),
                              onPressed: () {
                                setState(() {
                                  readed = !readed;
                                });
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    setState(() {
                      readed = !readed;
                    });
                  }
                },
                imagePath: readed == false
                    ? 'assets/images/nfc.png'
                    : 'assets/images/nfc-ok.png',
                height: 120,
              ),
            ),
            Text(
              'Tipo de animal',
              style: TextStyle(
                  fontSize: 16,
                  color: CustomColors.customPrimaryColor,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: Kind.dog,
                  groupValue: pet,
                  onChanged: (value) {
                    setState(() {
                      pet = value!;
                    });
                  },
                ),
                const Text('Cachorro'),
                SizedBox(
                  width: size.width * 0.1,
                ),
                Radio(
                  value: Kind.cat,
                  groupValue: pet,
                  onChanged: (value) {
                    setState(() {
                      pet = value!;
                    });
                  },
                ),
                const Text('Gato'),
              ],
            ),
            Text(
              'Tamanho do animal',
              style: TextStyle(
                  fontSize: 16,
                  color: CustomColors.customPrimaryColor,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: SizePet.small,
                  groupValue: sizePet,
                  onChanged: (value) {
                    setState(() {
                      sizePet = value!;
                    });
                  },
                ),
                const Text('Pequeno'),
                SizedBox(
                  width: size.width * 0.1,
                ),
                Radio(
                  value: SizePet.medium,
                  groupValue: sizePet,
                  onChanged: (value) {
                    setState(() {
                      sizePet = value!;
                    });
                  },
                ),
                const Text('Medio'),
                Radio(
                  value: SizePet.large,
                  groupValue: sizePet,
                  onChanged: (value) {
                    setState(() {
                      sizePet = value!;
                    });
                  },
                ),
                const Text('Grande'),
              ],
            ),
            const CustomTextField(
              icon: Icons.color_lens_rounded,
              label: 'Cor',
            ),
            Text(
              'Raça',
              style: TextStyle(
                  fontSize: 16,
                  color: CustomColors.customPrimaryColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: size.width,
              child: DropdownButton(
                value: _breedSelected,
                items: _dropDownBreed,
                onChanged: (value) {
                  setState(() {
                    _breedSelected = value.toString();
                  });
                },
              ),
            ),
            const CustomTextField(
              icon: Icons.file_copy,
              label: 'Endereço',
            ),
            const CustomTextField(
              icon: Icons.file_copy,
              label: 'Bairro',
            ),
            CustomTextField(
              icon: Icons.file_copy,
              label: 'CEP',
              keyboardType: TextInputType.number,
              inputFormatters: [cepFormartter],
            ),
            CustomButton(
                text: 'Registrar animal',
                onPressed: readed == false ? null : () {}),
          ],
        ),
      ),
    );
  }
}
