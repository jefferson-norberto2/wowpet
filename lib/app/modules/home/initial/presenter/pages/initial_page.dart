import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../config/custom_colors.dart';
import '../states/initial_state.dart';
import '../stores/initial_store.dart';

class InitialPage extends StatefulWidget {

  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final sizeDiameter = 50.0;
  final images = [];
  bool firstCall = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<InitialStore>().getLostPets();
    });
    
  }

  NetworkImage getImage(String url) {
    try{
      return NetworkImage(url);
    } catch(e){
      return const NetworkImage('https://cdn-icons-png.flaticon.com/512/3460/3460335.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<InitialStore>();
    final state = store.value;
    final lostAnimals = state is SuccessInitialState ? state.pets : [];

    for(var pet in lostAnimals){
      images.add(pet.photo);
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListTile(
                      leading: SizedBox(
                        height: 80,
                        width: 80,
                        child: Image.asset(
                          'assets/images/nfc-blue.png',
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Fazer leitura NFC',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.customPrimaryColor,
                          ),
                        ),
                      ),
                      subtitle: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Para verificar se o animal está cadastro junto a prefeitura.',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Animais Perdidos',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.customPrimaryColor,
                          ),
                        ),
                      ),
                      subtitle: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i < images.length; i++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: sizeDiameter,
                                  // backgroundImage: AssetImage(images[i]),
                                  backgroundImage: NetworkImage(images[i]),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListTile(
                      leading: SizedBox(
                        height: 80,
                        width: 80,
                        child: Image.asset(
                          'assets/images/pata.png',
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Reportar animais',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.customPrimaryColor,
                          ),
                        ),
                      ),
                      subtitle: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Tem algum animal perto onde você está? Reporte aqui no app.',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListTile(
                      leading: SizedBox(
                        height: 80,
                        width: 80,
                        child: Image.asset(
                          'assets/images/denunciante.png',
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Denuncie maus tratos',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.customPrimaryColor,
                          ),
                        ),
                      ),
                      subtitle: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Os animais também sofrem. Denuncie agora mesmo.',
                          style: TextStyle(fontSize: 14, color: Colors.black),
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
