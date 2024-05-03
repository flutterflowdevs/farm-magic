// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeatherStruct extends FFFirebaseStruct {
  WeatherStruct({
    double? min,
    double? max,
    String? city,
    DateTime? date,
    double? todayTemp,
    String? image,
    String? name,
    String? errorCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _min = min,
        _max = max,
        _city = city,
        _date = date,
        _todayTemp = todayTemp,
        _image = image,
        _name = name,
        _errorCode = errorCode,
        super(firestoreUtilData);

  // "min" field.
  double? _min;
  double get min => _min ?? 0.0;
  set min(double? val) => _min = val;
  void incrementMin(double amount) => _min = min + amount;
  bool hasMin() => _min != null;

  // "max" field.
  double? _max;
  double get max => _max ?? 0.0;
  set max(double? val) => _max = val;
  void incrementMax(double amount) => _max = max + amount;
  bool hasMax() => _max != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  // "todayTemp" field.
  double? _todayTemp;
  double get todayTemp => _todayTemp ?? 0.0;
  set todayTemp(double? val) => _todayTemp = val;
  void incrementTodayTemp(double amount) => _todayTemp = todayTemp + amount;
  bool hasTodayTemp() => _todayTemp != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "errorCode" field.
  String? _errorCode;
  String get errorCode => _errorCode ?? '';
  set errorCode(String? val) => _errorCode = val;
  bool hasErrorCode() => _errorCode != null;

  static WeatherStruct fromMap(Map<String, dynamic> data) => WeatherStruct(
        min: castToType<double>(data['min']),
        max: castToType<double>(data['max']),
        city: data['city'] as String?,
        date: data['date'] as DateTime?,
        todayTemp: castToType<double>(data['todayTemp']),
        image: data['image'] as String?,
        name: data['name'] as String?,
        errorCode: data['errorCode'] as String?,
      );

  static WeatherStruct? maybeFromMap(dynamic data) =>
      data is Map ? WeatherStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'min': _min,
        'max': _max,
        'city': _city,
        'date': _date,
        'todayTemp': _todayTemp,
        'image': _image,
        'name': _name,
        'errorCode': _errorCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'min': serializeParam(
          _min,
          ParamType.double,
        ),
        'max': serializeParam(
          _max,
          ParamType.double,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'todayTemp': serializeParam(
          _todayTemp,
          ParamType.double,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'errorCode': serializeParam(
          _errorCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static WeatherStruct fromSerializableMap(Map<String, dynamic> data) =>
      WeatherStruct(
        min: deserializeParam(
          data['min'],
          ParamType.double,
          false,
        ),
        max: deserializeParam(
          data['max'],
          ParamType.double,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        todayTemp: deserializeParam(
          data['todayTemp'],
          ParamType.double,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        errorCode: deserializeParam(
          data['errorCode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WeatherStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WeatherStruct &&
        min == other.min &&
        max == other.max &&
        city == other.city &&
        date == other.date &&
        todayTemp == other.todayTemp &&
        image == other.image &&
        name == other.name &&
        errorCode == other.errorCode;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([min, max, city, date, todayTemp, image, name, errorCode]);
}

WeatherStruct createWeatherStruct({
  double? min,
  double? max,
  String? city,
  DateTime? date,
  double? todayTemp,
  String? image,
  String? name,
  String? errorCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WeatherStruct(
      min: min,
      max: max,
      city: city,
      date: date,
      todayTemp: todayTemp,
      image: image,
      name: name,
      errorCode: errorCode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WeatherStruct? updateWeatherStruct(
  WeatherStruct? weather, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    weather
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWeatherStructData(
  Map<String, dynamic> firestoreData,
  WeatherStruct? weather,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (weather == null) {
    return;
  }
  if (weather.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && weather.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final weatherData = getWeatherFirestoreData(weather, forFieldValue);
  final nestedData = weatherData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = weather.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWeatherFirestoreData(
  WeatherStruct? weather, [
  bool forFieldValue = false,
]) {
  if (weather == null) {
    return {};
  }
  final firestoreData = mapToFirestore(weather.toMap());

  // Add any Firestore field values
  weather.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWeatherListFirestoreData(
  List<WeatherStruct>? weathers,
) =>
    weathers?.map((e) => getWeatherFirestoreData(e, true)).toList() ?? [];
