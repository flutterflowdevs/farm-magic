import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "chat_data" field.
  ChatMessageStruct? _chatData;
  ChatMessageStruct get chatData => _chatData ?? ChatMessageStruct();
  bool hasChatData() => _chatData != null;

  // "time_stamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "audio_url" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  bool hasAudioUrl() => _audioUrl != null;

  void _initializeFields() {
    _chatData = ChatMessageStruct.maybeFromMap(snapshotData['chat_data']);
    _timeStamp = snapshotData['time_stamp'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _audioUrl = snapshotData['audio_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  ChatMessageStruct? chatData,
  DateTime? timeStamp,
  DocumentReference? userRef,
  String? audioUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chat_data': ChatMessageStruct().toMap(),
      'time_stamp': timeStamp,
      'user_ref': userRef,
      'audio_url': audioUrl,
    }.withoutNulls,
  );

  // Handle nested data for "chat_data" field.
  addChatMessageStructData(firestoreData, chatData, 'chat_data');

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    return e1?.chatData == e2?.chatData &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.userRef == e2?.userRef &&
        e1?.audioUrl == e2?.audioUrl;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality()
      .hash([e?.chatData, e?.timeStamp, e?.userRef, e?.audioUrl]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
