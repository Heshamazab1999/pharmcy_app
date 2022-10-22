import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmcy_app/models/medicine_model.dart';

class GetMedicineServices {
  final _store = FirebaseFirestore.instance;

  Future<List<MedicineModel>> getMedicine() async {
    final data = await _store.collection("medicine").get();
    print(data.docs.length);
    return data.docs.map((e) => MedicineModel.fromJson(e)).toList();
  }
}
