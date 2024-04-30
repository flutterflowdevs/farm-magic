// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CropStruct extends FFFirebaseStruct {
  CropStruct({
    String? crop,
    String? img,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _crop = crop,
        _img = img,
        super(firestoreUtilData);

  // "crop" field.
  String? _crop;
  String get crop => _crop ?? '';
  set crop(String? val) => _crop = val;
  bool hasCrop() => _crop != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;
  bool hasImg() => _img != null;

  static CropStruct fromMap(Map<String, dynamic> data) => CropStruct(
        crop: data['crop'] as String?,
        img: data['img'] as String?,
      );

  static CropStruct? maybeFromMap(dynamic data) =>
      data is Map ? CropStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'crop': _crop,
        'img': _img,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'crop': serializeParam(
          _crop,
          ParamType.String,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
      }.withoutNulls;

  static CropStruct fromSerializableMap(Map<String, dynamic> data) =>
      CropStruct(
        crop: deserializeParam(
          data['crop'],
          ParamType.String,
          false,
        ),
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CropStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CropStruct && crop == other.crop && img == other.img;
  }

  @override
  int get hashCode => const ListEquality().hash([crop, img]);
}

CropStruct createCropStruct({
  String? crop,
  String? img,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CropStruct(
      crop: crop,
      img: img,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CropStruct? updateCropStruct(
  CropStruct? cropStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cropStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCropStructData(
  Map<String, dynamic> firestoreData,
  CropStruct? cropStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cropStruct == null) {
    return;
  }
  if (cropStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cropStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cropStructData = getCropFirestoreData(cropStruct, forFieldValue);
  final nestedData = cropStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cropStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCropFirestoreData(
  CropStruct? cropStruct, [
  bool forFieldValue = false,
]) {
  if (cropStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cropStruct.toMap());

  // Add any Firestore field values
  cropStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCropListFirestoreData(
  List<CropStruct>? cropStructs,
) =>
    cropStructs?.map((e) => getCropFirestoreData(e, true)).toList() ?? [];
