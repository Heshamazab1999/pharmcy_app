import 'package:firebase_database/firebase_database.dart';
import 'package:pharmcy_app/models/model.dart';

class GetMedicineServices {
  // final _store = FirebaseFirestore.instance;
  final DatabaseReference _messagesRef =
      FirebaseDatabase.instance.ref().child('results');

  // Future<List<MedicineModel>> getMedicine() async {
  //   final data = await _store.collection("medicine").get();
  //   print(data.docs.length);
  //   return data.docs.map((e) => MedicineModel.fromJson(e)).toList();
  // }

  Query getMessageQuery() {
    return _messagesRef;
  }

  List<MedicinesModel> stations = [];

  Future<List<MedicinesModel>> getMedicines(int num) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("results");
    DatabaseEvent event = await ref.limitToFirst(num).once();
    List jsonResponse = event.snapshot.value as List;
    // print(jsonResponse);
    return jsonResponse.map((job) => MedicinesModel.fromJson(job)).toList();

    // await FirebaseDatabase.instance
    //     .ref()
    //     .child('results')
    //     .limitToFirst(200)
    //     .once()
    //     .then((snapShot) {
    //   List<dynamic>? values = <dynamic>[];
    //   values = snapShot.snapshot.value as List?;
    //   if (values!.isNotEmpty) {
    //     for (int i = 0; i < values.length; i++) {
    //       if (values[i] != null) {
    //         Map<dynamic, dynamic> map = values[i];
    //         stations.add(MedicinesModel.fromJson(map));
    //         print(stations.length);
    //       }
    //     }
    //   }
    // });
    // return stations;
  }

  Future delete() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("results");
    await ref.remove();
    print(ref.key);
  }
}
