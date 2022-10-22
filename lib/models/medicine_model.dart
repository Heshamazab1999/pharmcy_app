import 'package:cloud_firestore/cloud_firestore.dart';

class MedicineModel {
  String? name;
  String? alternative;
  String? image;
  String? material;
  String? price;
  String? similars;
  String? strength;
  String? type;

  MedicineModel(
      {this.name,
      this.alternative,
      this.image,
      this.type,
      this.material,
      this.price,
      this.similars,
      this.strength});

  factory MedicineModel.fromJson(DocumentSnapshot snapshot) {
    return MedicineModel(
      image: snapshot['image'],
      price: snapshot['price'],
      name: snapshot['name'],
      alternative: snapshot['alternative'],
      material: snapshot['material'],
      similars: snapshot['similars'],
      strength: snapshot['strength'],
      type: snapshot['type'],
    );
  }
}
