import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.ref();

Future getAllLeaves() async {
  DataSnapshot dataSnapshot = (await databaseReference.child('leaves/').once()) as DataSnapshot;
  if (dataSnapshot.value != null) {
    print(dataSnapshot);
  }
}