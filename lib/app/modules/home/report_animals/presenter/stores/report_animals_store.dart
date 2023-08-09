import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wowpet/app/modules/home/report_animals/presenter/states/report_animals_state.dart';
import 'package:permission_handler/permission_handler.dart';


class ReportAnimalStore extends ValueNotifier<IReportAnimalState> {
  // final Location location = Location();
  final CameraDevice cameraDevice = CameraDevice.rear;
  final picker = ImagePicker();
  File? image;
  String? myImage;
  LatLng? myPosition;

  ReportAnimalStore() : super(ReportAnimalInitialState()){
    takeLocation();
  }

  void emit(IReportAnimalState state) => value = state;
  
  Future<bool> permissionRequest() async {
    PermissionStatus permissionStatus = await Permission.location.request();
    if (permissionStatus == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> cameraPermissionRequest() async {
    PermissionStatus permissionStatus = await Permission.camera.request();
    if (permissionStatus == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }

  Future<File?> takePicture() async{
    if (await cameraPermissionRequest()) {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        emit(value);
        return image = File(pickedFile.path);
      } else {
        emit(ReportAnimalErrorState(message: 'Para reportar um animal é preciso tirar uma foto!'));
        return null;
      }
    } else {
      emit(ReportAnimalErrorState(message: 'Para reportar um animal é preciso tirar uma foto!'));
      return null;
    }
              
  }

  Future<bool> takeLocation() async{
    if (await permissionRequest()) {
      final position = await Geolocator.getCurrentPosition();
      myPosition = LatLng(position.latitude, position.longitude);
      debugPrint(myPosition.toString());
      emit(ReportAnimalSuccessState(message: 'Localização obtida com sucesso!'));
      return true;
    } else {
      emit(ReportAnimalErrorState(message: 'Para reportar um animal é preciso habilitar sua localização!'));
      return false;
    }
  }
}