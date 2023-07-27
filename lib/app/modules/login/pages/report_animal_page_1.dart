import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wowpet/app/config/custom_colors.dart';
import 'package:wowpet/app/modules/home/pages/reporter_screen.dart';

class ReportAnimalPage1 extends StatefulWidget {
  const ReportAnimalPage1({Key? key}) : super(key: key);

  @override
  ReportAnimalPage1State createState() => ReportAnimalPage1State();
}

class ReportAnimalPage1State extends State<ReportAnimalPage1> {
  late GoogleMapController mapController;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              }),
          title: const Text('Reportar animal'),
          backgroundColor: CustomColors.customPrimaryColor,
        ),
        body: const ReporterScreen(),
      ),
    );
  }
}
