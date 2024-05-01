// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LanguageStruct extends FFFirebaseStruct {
  LanguageStruct({
    String? langName,
    String? langCode,
    String? image,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _langName = langName,
        _langCode = langCode,
        _image = image,
        super(firestoreUtilData);

  // "lang_name" field.
  String? _langName;
  String get langName => _langName ?? '';
  set langName(String? val) => _langName = val;
  bool hasLangName() => _langName != null;

  // "lang_code" field.
  String? _langCode;
  String get langCode => _langCode ?? '';
  set langCode(String? val) => _langCode = val;
  bool hasLangCode() => _langCode != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  static LanguageStruct fromMap(Map<String, dynamic> data) => LanguageStruct(
        langName: data['lang_name'] as String?,
        langCode: data['lang_code'] as String?,
        image: data['image'] as String?,
      );

  static LanguageStruct? maybeFromMap(dynamic data) =>
      data is Map ? LanguageStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'lang_name': _langName,
        'lang_code': _langCode,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lang_name': serializeParam(
          _langName,
          ParamType.String,
        ),
        'lang_code': serializeParam(
          _langCode,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static LanguageStruct fromSerializableMap(Map<String, dynamic> data) =>
      LanguageStruct(
        langName: deserializeParam(
          data['lang_name'],
          ParamType.String,
          false,
        ),
        langCode: deserializeParam(
          data['lang_code'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LanguageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LanguageStruct &&
        langName == other.langName &&
        langCode == other.langCode &&
        image == other.image;
  }

  @override
  int get hashCode => const ListEquality().hash([langName, langCode, image]);
}

LanguageStruct createLanguageStruct({
  String? langName,
  String? langCode,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LanguageStruct(
      langName: langName,
      langCode: langCode,
      image: image,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LanguageStruct? updateLanguageStruct(
  LanguageStruct? language, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    language
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLanguageStructData(
  Map<String, dynamic> firestoreData,
  LanguageStruct? language,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (language == null) {
    return;
  }
  if (language.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && language.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final languageData = getLanguageFirestoreData(language, forFieldValue);
  final nestedData = languageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = language.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLanguageFirestoreData(
  LanguageStruct? language, [
  bool forFieldValue = false,
]) {
  if (language == null) {
    return {};
  }
  final firestoreData = mapToFirestore(language.toMap());

  // Add any Firestore field values
  language.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLanguageListFirestoreData(
  List<LanguageStruct>? languages,
) =>
    languages?.map((e) => getLanguageFirestoreData(e, true)).toList() ?? [];
