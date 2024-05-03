// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessageStruct extends FFFirebaseStruct {
  ChatMessageStruct({
    String? messageBody,
    bool? isUserMessage,
    DateTime? timeStamp,
    int? responseStatus,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _messageBody = messageBody,
        _isUserMessage = isUserMessage,
        _timeStamp = timeStamp,
        _responseStatus = responseStatus,
        super(firestoreUtilData);

  // "messageBody" field.
  String? _messageBody;
  String get messageBody => _messageBody ?? '';
  set messageBody(String? val) => _messageBody = val;
  bool hasMessageBody() => _messageBody != null;

  // "isUserMessage" field.
  bool? _isUserMessage;
  bool get isUserMessage => _isUserMessage ?? false;
  set isUserMessage(bool? val) => _isUserMessage = val;
  bool hasIsUserMessage() => _isUserMessage != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  set timeStamp(DateTime? val) => _timeStamp = val;
  bool hasTimeStamp() => _timeStamp != null;

  // "responseStatus" field.
  int? _responseStatus;
  int get responseStatus => _responseStatus ?? 0;
  set responseStatus(int? val) => _responseStatus = val;
  void incrementResponseStatus(int amount) =>
      _responseStatus = responseStatus + amount;
  bool hasResponseStatus() => _responseStatus != null;

  static ChatMessageStruct fromMap(Map<String, dynamic> data) =>
      ChatMessageStruct(
        messageBody: data['messageBody'] as String?,
        isUserMessage: data['isUserMessage'] as bool?,
        timeStamp: data['timeStamp'] as DateTime?,
        responseStatus: castToType<int>(data['responseStatus']),
      );

  static ChatMessageStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatMessageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'messageBody': _messageBody,
        'isUserMessage': _isUserMessage,
        'timeStamp': _timeStamp,
        'responseStatus': _responseStatus,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'messageBody': serializeParam(
          _messageBody,
          ParamType.String,
        ),
        'isUserMessage': serializeParam(
          _isUserMessage,
          ParamType.bool,
        ),
        'timeStamp': serializeParam(
          _timeStamp,
          ParamType.DateTime,
        ),
        'responseStatus': serializeParam(
          _responseStatus,
          ParamType.int,
        ),
      }.withoutNulls;

  static ChatMessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatMessageStruct(
        messageBody: deserializeParam(
          data['messageBody'],
          ParamType.String,
          false,
        ),
        isUserMessage: deserializeParam(
          data['isUserMessage'],
          ParamType.bool,
          false,
        ),
        timeStamp: deserializeParam(
          data['timeStamp'],
          ParamType.DateTime,
          false,
        ),
        responseStatus: deserializeParam(
          data['responseStatus'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ChatMessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatMessageStruct &&
        messageBody == other.messageBody &&
        isUserMessage == other.isUserMessage &&
        timeStamp == other.timeStamp &&
        responseStatus == other.responseStatus;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([messageBody, isUserMessage, timeStamp, responseStatus]);
}

ChatMessageStruct createChatMessageStruct({
  String? messageBody,
  bool? isUserMessage,
  DateTime? timeStamp,
  int? responseStatus,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatMessageStruct(
      messageBody: messageBody,
      isUserMessage: isUserMessage,
      timeStamp: timeStamp,
      responseStatus: responseStatus,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatMessageStruct? updateChatMessageStruct(
  ChatMessageStruct? chatMessage, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatMessage
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatMessageStructData(
  Map<String, dynamic> firestoreData,
  ChatMessageStruct? chatMessage,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatMessage == null) {
    return;
  }
  if (chatMessage.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatMessage.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatMessageData =
      getChatMessageFirestoreData(chatMessage, forFieldValue);
  final nestedData =
      chatMessageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatMessage.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatMessageFirestoreData(
  ChatMessageStruct? chatMessage, [
  bool forFieldValue = false,
]) {
  if (chatMessage == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatMessage.toMap());

  // Add any Firestore field values
  chatMessage.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatMessageListFirestoreData(
  List<ChatMessageStruct>? chatMessages,
) =>
    chatMessages?.map((e) => getChatMessageFirestoreData(e, true)).toList() ??
    [];
