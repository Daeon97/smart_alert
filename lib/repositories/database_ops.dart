import 'package:firebase_database/firebase_database.dart';
import '../utils/utils.dart';

class DatabaseOps {
  final FirebaseDatabase _db;

  DatabaseOps() : _db = FirebaseDatabase.instance;

  Stream<DatabaseEvent> get testData => _db.ref(testRef).onValue;

  Stream<DatabaseEvent> get slider =>
      _db.ref(testRef).child(sliderField).onValue;

  Stream<DatabaseEvent> get status =>
      _db.ref(testRef).child(statusField).onValue;

  num readSlider(DataSnapshot dataSnapshot) => dataSnapshot.value as num;

  Future<void> writeSlider(num newStatusValue) async {
    await _db.ref(testRef).update({
      sliderField: newStatusValue,
    });
  }

  bool readStatus(DataSnapshot dataSnapshot) =>
      (dataSnapshot.value as num) != 0;

  Future<void> writeStatus(num newStatusValue) async {
    await _db.ref(testRef).update({
      statusField: newStatusValue != nil ? nil : one,
    });
  }
}
