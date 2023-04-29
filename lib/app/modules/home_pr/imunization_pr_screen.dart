import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../config/custom_colors.dart';

class ImunizationPrScreen extends StatefulWidget {
  const ImunizationPrScreen({super.key});

  @override
  State<ImunizationPrScreen> createState() => _ImunizationPrScreenState();
}

class _ImunizationPrScreenState extends State<ImunizationPrScreen> {
  List sicks = ['Sinomose', 'Parvovirose', 'Vermifugação', 'Raiva Canina'];
  List dates_aplly = ['10/10/2022', '10/10/2022', '10/10/2022', '10/10/2022'];
  List dates_next = ['10/10/2023', '10/10/2024', '10/2/2023', '10/10/2025'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.customPrimaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Imunização'),
            backgroundColor: CustomColors.customPrimaryColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/dog.png'),
                  ),
                  for (int i = 0; i < 4; i++)
                    Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ListTile(
                              title: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  sicks[i],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColors.customPrimaryColor,
                                  ),
                                ),
                              ),
                              subtitle: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Data da última vacina: ${dates_aplly[i]}\n\nPróxima vacina: ${dates_next[i]}',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
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
          ),
        ),
      ),
    );
  }
}
