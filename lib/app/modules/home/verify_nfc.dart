import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:wowpet/app/config/custom_colors.dart';
import 'package:wowpet/app/modules/home/components/custom_button.dart';
import 'package:wowpet/app/modules/home/verify_nfc_store.dart';
import 'components/my_alert_dialog.dart';

class VerifyNfc extends StatefulWidget {
  const VerifyNfc({super.key});

  @override
  State<VerifyNfc> createState() => _VerifyNfcState();
}

class _VerifyNfcState extends State<VerifyNfc> {
  bool readed = false;
  final store = VerifyNfcStore();
  late Disposer disposer;

  @override
  void initState() {
    super.initState();
    disposer = store.observer(onState: print);
  }

  @override
  void dispose() {
    super.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<VerifyNfcStore, bool>(
      store: store,
      onLoading: (_) => pageOnLoading(context),
      onError: (_, error) => Center(
        child: Text(
          error.toString(),
          style: const TextStyle(color: Colors.red),
        ),
      ),
      onState: (_, state) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomButton(
              text: state == false
                  ? "Fazer leitura NFC"
                  : "Leitura NFC realizada!",
              onPressed: () async {
                store.initNFC();
              },
              imagePath: state == false
                  ? 'assets/images/nfc.png'
                  : 'assets/images/nfc-ok.png',
              height: 120,
            ),
            state == false
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
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundColor:
                                    CustomColors.customPrimaryColor,
                                child: IconButton(
                                  onPressed: () {},
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
                      ],
                    ),
                  ),
            state == false
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
                      ListTile(
                        leading:
                            const Text('ID:', style: TextStyle(fontSize: 20.0)),
                        title: Text(store.key[0],
                            style: const TextStyle(fontSize: 20.0)),
                        trailing: const Text('6 anos',
                            style: TextStyle(fontSize: 20.0)),
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
                  )),
          ],
        ),
      ),
    );
  }

  Widget pageOnLoading(BuildContext context) {
    return Center(
      child: MyAlertDialog(onPressed: store.cancelNfc),
    );
  }
}
