import 'package:wowpet/app/modules/home/initial/domain/entities/pet.dart';

class PetAdapter{
  static List<Pet> getListPets(List list){
    final pets = <Pet>[];
    for (var item in list) {
      pets.add(Pet(id: item[0], photo: item[9]));
    }
    return pets;
  }
}