import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';

class DiagnosesRecord extends FirestoreRecord {
  DiagnosesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "veg_name" field.
  String? _vegName;
  String get vegName => _vegName ?? '';
  bool hasVegName() => _vegName != null;

  // "issue_text" field.
  String? _issueText;
  String get issueText => _issueText ?? '';
  bool hasIssueText() => _issueText != null;

  // "query_type" field.
  UserDiseaseChoice? _queryType;
  UserDiseaseChoice? get queryType => _queryType;
  bool hasQueryType() => _queryType != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _subject = snapshotData['subject'] as String?;
    _image = snapshotData['image'] as String?;
    _vegName = snapshotData['veg_name'] as String?;
    _issueText = snapshotData['issue_text'] as String?;
    _queryType = deserializeEnum<UserDiseaseChoice>(snapshotData['query_type']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('diagnoses');

  static Stream<DiagnosesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DiagnosesRecord.fromSnapshot(s));

  static Future<DiagnosesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DiagnosesRecord.fromSnapshot(s));

  static DiagnosesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DiagnosesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DiagnosesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DiagnosesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DiagnosesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DiagnosesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDiagnosesRecordData({
  String? subject,
  String? image,
  String? vegName,
  String? issueText,
  UserDiseaseChoice? queryType,
  DateTime? createdTime,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'subject': subject,
      'image': image,
      'veg_name': vegName,
      'issue_text': issueText,
      'query_type': queryType,
      'created_time': createdTime,
      'user_ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class DiagnosesRecordDocumentEquality implements Equality<DiagnosesRecord> {
  const DiagnosesRecordDocumentEquality();

  @override
  bool equals(DiagnosesRecord? e1, DiagnosesRecord? e2) {
    return e1?.subject == e2?.subject &&
        e1?.image == e2?.image &&
        e1?.vegName == e2?.vegName &&
        e1?.issueText == e2?.issueText &&
        e1?.queryType == e2?.queryType &&
        e1?.createdTime == e2?.createdTime &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(DiagnosesRecord? e) => const ListEquality().hash([
        e?.subject,
        e?.image,
        e?.vegName,
        e?.issueText,
        e?.queryType,
        e?.createdTime,
        e?.userRef
      ]);

  @override
  bool isValidKey(Object? o) => o is DiagnosesRecord;
}
