import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wowpet/app/config/custom_colors.dart';
import 'package:wowpet/app/modules/home/reporter_screen.dart';

class MyApp2 extends StatefulWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp2> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

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
        body: ReporterScreen(),
      ),
    );
  }
}
