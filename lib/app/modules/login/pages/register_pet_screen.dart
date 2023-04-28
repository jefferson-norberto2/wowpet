import 'package:flutter/material.dart';
import '../components/custom_text_field.dart';
import '../../../config/custom_colors.dart';

class RegisterPetScreen extends StatefulWidget {
  RegisterPetScreen({super.key});

  @override
  State<RegisterPetScreen> createState() => _RegisterPetScreenState();
}

enum Kind { dog, cat }

enum Size { small, medium, large }

class _RegisterPetScreenState extends State<RegisterPetScreen> {
  Kind pet = Kind.dog;
  Size sizePet = Size.small;
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
                  'Dados do seu animal',
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
                  const CustomTextField(
                    icon: Icons.pets,
                    label: 'Nome',
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
                        value: Size.small,
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
                        value: Size.medium,
                        groupValue: sizePet,
                        onChanged: (value) {
                          setState(() {
                            sizePet = value!;
                          });
                        },
                      ),
                      const Text('Medio'),
                      Radio(
                        value: Size.large,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 180.0),
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.customPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
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
