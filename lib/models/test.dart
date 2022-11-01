import 'package:firebase_database/firebase_database.dart';
import '../utils/utils.dart' as utils;

class Test {
  final num floatValue;
  final num intValue;
  final num sliderValue;
  final num statusValue;

  const Test({
    required this.floatValue,
    required this.intValue,
    required this.sliderValue,
    required this.statusValue,
  });

  factory Test.fromDataSnapshot(
    DataSnapshot dataSnapshot,
  ) {
    final snap = dataSnapshot.value! as Map<Object?, Object?>;
    return Test(
      floatValue: snap[utils.floatField] as num,
      intValue: snap[utils.intField] as num,
      sliderValue: snap[utils.sliderField] as num,
      statusValue: snap[utils.statusField] as num,
    );
  }
}
