import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wowpet/app/modules/home/report_animals/presenter/states/report_animals_state.dart';
import '../../../../../config/custom_colors.dart';
import '../../../presenter/components/custom_button.dart';
import '../stores/report_animals_store.dart';


enum AnimalNumber { one, tow, three, more }
enum LookedAnimal { yes, no }
enum Identification { yes, no }
enum Zoonoses { yes, no }

class ReportAnimalsPage extends StatefulWidget {
  const ReportAnimalsPage({super.key});

  @override
  State<ReportAnimalsPage> createState() => _ReportAnimalsPageState();
}

class _ReportAnimalsPageState extends State<ReportAnimalsPage> {
  AnimalNumber _animalNumber = AnimalNumber.one;
  LookedAnimal _lookedAnimal = LookedAnimal.yes;
  Identification _identification = Identification.no;
  Zoonoses _zoonoses = Zoonoses.yes;
  File? _image;

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final store = context.watch<ReportAnimalStore>();
    final state = store.value;
    bool reportButton = false;

    if (state is ReportAnimalSuccessState) {
      reportButton = true;
    } else if (state is ReportAnimalErrorState) {
      reportButton = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(context: context, builder: (context) => AlertDialog(
          title: const Text('Permissão negada!'),
          content: Text(state.message),
          actions: [
            TextButton(onPressed: () => Modular.to.pop(), child: const Text('Ok'))
          ],
        ));
      });
    }

    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Se você encontrou um ou mais animais na rua, pode informar a prefeitura. Por favor, preencha os campos abaixo',
              style: TextStyle(
                  fontSize: 15, color: CustomColors.customPrimaryColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: InkWell(
                onTap: () async {
                  await store.takePicture();
                  setState(() {
                    _image = store.image;
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width,
                          child: _image != null ? 
                          Image.file(_image!) 
                          : 
                          Image.asset(
                            'assets/images/photo_dog.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        _image != null ?
                        const SizedBox.shrink()
                        :
                       Text('Adicionar foto do animal', 
                       style: TextStyle(
                        color: CustomColors.customPrimaryColor, 
                        fontSize: 14),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Quantos animais estão aí?',
                style: TextStyle(
                    fontSize: 18,
                    color: CustomColors.customPrimaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: AnimalNumber.one,
                  groupValue: _animalNumber,
                  onChanged: (value) {
                    setState(() {
                      _animalNumber = value!;
                    });
                  },
                ),
                const Text('1'),
                SizedBox(
                  width: size.width * 0.05,
                ),
                Radio(
                  value: AnimalNumber.tow,
                  groupValue: _animalNumber,
                  onChanged: (value) {
                    setState(() {
                      _animalNumber = value!;
                    });
                  },
                ),
                const Text('2'),
                SizedBox(
                  width: size.width * 0.05,
                ),
                Radio(
                  value: AnimalNumber.three,
                  groupValue: _animalNumber,
                  onChanged: (value) {
                    setState(() {
                      _animalNumber = value!;
                    });
                  },
                ),
                const Text('3'),
                SizedBox(
                  width: size.width * 0.05,
                ),
                Radio(
                  value: AnimalNumber.more,
                  groupValue: _animalNumber,
                  onChanged: (value) {
                    setState(() {
                      _animalNumber = value!;
                    });
                  },
                ),
                const Text('4 ou +'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Você já viu esse animal mais de uma vez nessa região?',
                style: TextStyle(
                    fontSize: 18,
                    color: CustomColors.customPrimaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: LookedAnimal.yes,
                  groupValue: _lookedAnimal,
                  onChanged: (value) {
                    setState(() {
                      _lookedAnimal = value!;
                    });
                  },
                ),
                const Text('Sim'),
                SizedBox(
                  width: size.width * 0.05,
                ),
                Radio(
                  value: LookedAnimal.no,
                  groupValue: _lookedAnimal,
                  onChanged: (value) {
                    setState(() {
                      _lookedAnimal = value!;
                    });
                  },
                ),
                const Text('Não'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Possui identificação?',
                style: TextStyle(
                    fontSize: 18,
                    color: CustomColors.customPrimaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: Identification.yes,
                  groupValue: _identification,
                  onChanged: (value) {
                    setState(() {
                      _identification = value!;
                    });
                  },
                ),
                const Text('Sim'),
                SizedBox(
                  width: size.width * 0.05,
                ),
                Radio(
                  value: Identification.no,
                  groupValue: _identification,
                  onChanged: (value) {
                    setState(() {
                      _identification = value!;
                    });
                  },
                ),
                const Text('Não'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Aparenta ter zoonose?',
                style: TextStyle(
                    fontSize: 18,
                    color: CustomColors.customPrimaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
                'Zoonoses são doenças infecciosas transmitidas entre animais e pessoas'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: Zoonoses.yes,
                  groupValue: _zoonoses,
                  onChanged: (value) {
                    setState(() {
                      _zoonoses = value!;
                    });
                  },
                ),
                const Text('Sim'),
                SizedBox(
                  width: size.width * 0.05,
                ),
                Radio(
                  value: Zoonoses.no,
                  groupValue: _zoonoses,
                  onChanged: (value) {
                    setState(() {
                      _zoonoses = value!;
                    });
                  },
                ),
                const Text('Não'),
              ],
            ),
            CustomButton(
              text: 'Reportar animal de rua',
              onPressed: reportButton ? () {} : null,
            ),
          ],
        ),
      ),
    );
  }
}
