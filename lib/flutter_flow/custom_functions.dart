import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

bool isTextFieldEmpty(String fieldData) {
  return fieldData.length == 0;
}

bool validatingEmail(String checkingMail) {
  final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(checkingMail);

  return emailValid;
}

String getAudioUrl(String audioPath) {
  return audioPath.toString();
}

String removeSpecialCharacters(String toBeTreated) {
  RegExp regExp = RegExp(r'\n+');
  // RegExp regExp = RegExp(r'[^\w\s\*]+');
  return toBeTreated.replaceAll(regExp, '');
}

List<dynamic> convertJsonToJsonList(dynamic data) {
  // Parse the JSON data
  dynamic parsedData = data;

  // Check if parsedData is a List
  if (parsedData is List) {
    // Cast parsedData to List<Map<String, dynamic>>
    return List<Map<String, dynamic>>.from(parsedData);
  } else {
    // If parsedData is not a List, return an empty list
    return [];
  }
}

int getLengthFromString(String data) {
  int length = data.length;
  return length;
}

dynamic getWeatherCodeValue(
  dynamic errorJson,
  String? weatherErrorCode,
) {
  dynamic result = {
    "name": "Ice Pellets",
    "image_url":
        "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/bsl0wzto21zx/Sunny.gif"
  };

  if (errorJson is! List<dynamic> || weatherErrorCode!.isEmpty) {
    return result; // Handle invalid input
  }

  List<dynamic> listData = errorJson;

  listData.forEach((e) {
    if (e.containsKey(weatherErrorCode)) {
      result = e[weatherErrorCode][0];
    }
  });

  return result;
}

DateTime increaseDate(
  DateTime date,
  int days,
) {
  return date.add(Duration(days: days));
}

List<String> getImageGenPromptList(String combinedPrompt) {
  return combinedPrompt.split("|");
}

dynamic getJson(
  int index,
  String genId,
) {
  return {"index": index, "gen_id": genId};
}

String? getJsonValue(
  dynamic value,
  String index,
) {
  return value[index];
}

String getPrompt(
  String value,
  int index,
) {
  print('$value & $index');
  var arr = value.split("|");
  print(arr);
  var prompt = arr[index];
  print(prompt);
  return prompt;
}

dynamic newJsonValue(
  dynamic data,
  String index,
  String value,
) {
  data[index] = value;
  return data;
}

List<bool> resetMutex(int size) {
  return List<bool>.filled(size, false);
}
