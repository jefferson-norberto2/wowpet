import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wowpet/app/config/custom_colors.dart';
import 'package:wowpet/app/modules/home/components/custom_button.dart';

class VerifyPrNfc extends StatefulWidget {
  const VerifyPrNfc({super.key});

  @override
  State<VerifyPrNfc> createState() => _VerifyPrNfcState();
}

class _VerifyPrNfcState extends State<VerifyPrNfc> {
  bool readed = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomButton(
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
            readed == false
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const CircleAvatar(
                          radius: 90,
                          backgroundImage: AssetImage('assets/images/dog.png'),
                        ),
                        InkWell(
                          onTap: () {
                            Modular.to
                                .pushNamed('/home_pr/immunization_pr_screen/');
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor:
                                      CustomColors.customPrimaryColor,
                                  child: IconButton(
                                    onPressed: () {
                                      Modular.to.pushNamed(
                                          '/home_pr/immunization_pr_screen/');
                                    },
                                    icon: const Icon(
                                      Icons.file_copy_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const Text('Cronograma\nimunização')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
            readed == false
                ? const SizedBox()
                : Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Dados',
                            style: TextStyle(
                                color: CustomColors.customPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0),
                          ),
                        ),
                        const ListTile(
                          leading:
                              Text('ID:', style: TextStyle(fontSize: 20.0)),
                          title:
                              Text('2633492', style: TextStyle(fontSize: 20.0)),
                          trailing:
                              Text('6 anos', style: TextStyle(fontSize: 20.0)),
                        ),
                        const ListTile(
                          leading: Text('Preto e branco',
                              style: TextStyle(fontSize: 20.0)),
                          trailing: Text('SRD (Vira-lata)',
                              style: TextStyle(fontSize: 20.0)),
                        ),
                        const ListTile(
                          leading: Text('Porte médio',
                              style: TextStyle(fontSize: 20.0)),
                        ),
                      ],
                    ),
                  ),
            readed == false
                ? const SizedBox()
                : CustomButton(
                    text: 'Refazer leitura NFC',
                    onPressed: () {
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
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    })
          ],
        ),
      ),
    );
  }
}
