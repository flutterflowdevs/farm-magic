import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class WeatherRecord extends FirestoreRecord {
  WeatherRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "weatherResult" field.
  List<WeatherStruct>? _weatherResult;
  List<WeatherStruct> get weatherResult => _weatherResult ?? const [];
  bool hasWeatherResult() => _weatherResult != null;

  void _initializeFields() {
    _city = snapshotData['city'] as String?;
    _date = snapshotData['date'] as String?;
    _weatherResult = getStructList(
      snapshotData['weatherResult'],
      WeatherStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('weather');

  static Stream<WeatherRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WeatherRecord.fromSnapshot(s));

  static Future<WeatherRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WeatherRecord.fromSnapshot(s));

  static WeatherRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WeatherRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WeatherRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WeatherRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WeatherRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WeatherRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWeatherRecordData({
  String? city,
  String? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'city': city,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class WeatherRecordDocumentEquality implements Equality<WeatherRecord> {
  const WeatherRecordDocumentEquality();

  @override
  bool equals(WeatherRecord? e1, WeatherRecord? e2) {
    const listEquality = ListEquality();
    return e1?.city == e2?.city &&
        e1?.date == e2?.date &&
        listEquality.equals(e1?.weatherResult, e2?.weatherResult);
  }

  @override
  int hash(WeatherRecord? e) =>
      const ListEquality().hash([e?.city, e?.date, e?.weatherResult]);

  @override
  bool isValidKey(Object? o) => o is WeatherRecord;
}
