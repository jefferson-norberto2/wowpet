import 'package:flutter/material.dart';
import '../../../config/custom_colors.dart';

class ResgisterImunizationScreen extends StatefulWidget {
  const ResgisterImunizationScreen({super.key});

  @override
  State<ResgisterImunizationScreen> createState() =>
      _ResgisterImunizationScreenState();
}

class _ResgisterImunizationScreenState
    extends State<ResgisterImunizationScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/images/dog_perfil.jpg'),
          ),
          Row(
            children: [
              Text(
                'Editar dados',
                style: TextStyle(
                    fontSize: 20,
                    color: CustomColors.customPrimaryColor,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit_square,
                  color: CustomColors.customPrimaryColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Theobaldo',
                  style: TextStyle(
                    fontSize: 18,
                    color: CustomColors.customPrimaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text('5 anos',
                      style: TextStyle(
                        fontSize: 18,
                        color: CustomColors.customPrimaryColor,
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Preto e Branco',
                  style: TextStyle(
                    fontSize: 18,
                    color: CustomColors.customPrimaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text('SRD (Vira-Lata)',
                      style: TextStyle(
                        fontSize: 18,
                        color: CustomColors.customPrimaryColor,
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cachorro',
                  style: TextStyle(
                    fontSize: 18,
                    color: CustomColors.customPrimaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text('Porte Médio',
                      style: TextStyle(
                        fontSize: 18,
                        color: CustomColors.customPrimaryColor,
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: CustomColors.customPrimaryColor, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.pending_actions_sharp,
                                color: CustomColors.customPrimaryColor)),
                        Text(
                          'Registrar Imunização',
                          style: TextStyle(
                              fontSize: 15,
                              color: CustomColors.customPrimaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.customPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Reportar Animal Perdido',
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
    );
  }
}
