import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class VideosRecord extends FirestoreRecord {
  VideosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "prompt" field.
  String? _prompt;
  String get prompt => _prompt ?? '';
  bool hasPrompt() => _prompt != null;

  // "videoUrl" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  // "videoDescription" field.
  String? _videoDescription;
  String get videoDescription => _videoDescription ?? '';
  bool hasVideoDescription() => _videoDescription != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "isPublic" field.
  bool? _isPublic;
  bool get isPublic => _isPublic ?? false;
  bool hasIsPublic() => _isPublic != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _prompt = snapshotData['prompt'] as String?;
    _videoUrl = snapshotData['videoUrl'] as String?;
    _videoDescription = snapshotData['videoDescription'] as String?;
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
    _isPublic = snapshotData['isPublic'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('videos');

  static Stream<VideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideosRecord.fromSnapshot(s));

  static Future<VideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideosRecord.fromSnapshot(s));

  static VideosRecord fromSnapshot(DocumentSnapshot snapshot) => VideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideosRecordData({
  DocumentReference? userRef,
  String? prompt,
  String? videoUrl,
  String? videoDescription,
  DateTime? timeStamp,
  bool? isPublic,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'prompt': prompt,
      'videoUrl': videoUrl,
      'videoDescription': videoDescription,
      'timeStamp': timeStamp,
      'isPublic': isPublic,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideosRecordDocumentEquality implements Equality<VideosRecord> {
  const VideosRecordDocumentEquality();

  @override
  bool equals(VideosRecord? e1, VideosRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.prompt == e2?.prompt &&
        e1?.videoUrl == e2?.videoUrl &&
        e1?.videoDescription == e2?.videoDescription &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.isPublic == e2?.isPublic;
  }

  @override
  int hash(VideosRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.prompt,
        e?.videoUrl,
        e?.videoDescription,
        e?.timeStamp,
        e?.isPublic
      ]);

  @override
  bool isValidKey(Object? o) => o is VideosRecord;
}
