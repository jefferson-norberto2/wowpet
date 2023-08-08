import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wowpet/app/config/custom_colors.dart';
import 'package:wowpet/app/modules/home/presenter/components/custom_button.dart';
import 'package:location/location.dart';

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
  late GoogleMapController mapController;
  AnimalNumber _animalNumber = AnimalNumber.one;
  LookedAnimal _lookedAnimal = LookedAnimal.yes;
  Identification _identification = Identification.no;
  Zoonoses _zoonoses = Zoonoses.yes;
  final Location _location = Location();
  LatLng? _myPosition;

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> permissionRequest() async {
    PermissionStatus permissionStatus = await _location.requestPermission();
    if (permissionStatus == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> takeLocation() async{
    if (await permissionRequest()) {
      final position = await Geolocator.getCurrentPosition();
      mapController.animateCamera(
          CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 15,
      )));
        _myPosition =
            LatLng(position.latitude, position.longitude);
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    

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
                        child: Image.asset(
                          'assets/images/photo_dog.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                     Text('Adicionar foto do animal', 
                     style: TextStyle(
                      color: CustomColors.customPrimaryColor, 
                      fontSize: 14),),
                    ],
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
              onPressed: () async {
                if (await takeLocation()){
                  debugPrint(_myPosition.toString());
                  Modular.to.pop();
                }
                else{
                  debugPrint('erro');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
