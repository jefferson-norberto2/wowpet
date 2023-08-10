import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wowpet/app/config/custom_colors.dart';
import 'package:wowpet/app/modules/home/report_animals/presenter/pages/report_animals_page.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:wowpet/app/config/custom_colors.dart';
import 'package:wowpet/app/modules/home/presenter/components/custom_button.dart';
// import 'package:location/location.dart';

class ReportAnimalPage1 extends StatefulWidget {
  const ReportAnimalPage1({Key? key}) : super(key: key);

  @override
  ReportAnimalPage1State createState() => ReportAnimalPage1State();
}

class ReportAnimalPage1State extends State<ReportAnimalPage1> {
  AnimalNumber _animalNumber = AnimalNumber.one;
  LookedAnimal _lookedAnimal = LookedAnimal.yes;
  Identification _identification = Identification.no;
  Zoonoses _zoonoses = Zoonoses.yes;
  File? _image;
  bool reportButton = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              }),
          title: const Text('Reportar animal'),
          backgroundColor: CustomColors.customPrimaryColor,
        ),
        body: Padding(
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
                  // await store.takePicture();
                  // setState(() {
                  //   _image = store.image;
                  // });
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
    ),
    );
  }
}
