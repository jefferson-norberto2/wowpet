import 'package:fpdart/fpdart.dart';
import 'package:wowpet/app/modules/home/initial/domain/entities/pet.dart';
import 'package:wowpet/app/modules/home/initial/domain/erros/error.dart';

abstract class IPetsRepository{
  Future<Either<IPetException, List<Pet>>> getLostPets();
}