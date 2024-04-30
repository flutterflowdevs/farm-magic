// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>> searchAnimalAndCropsFromJson(
  String query,
  List<dynamic> dataList,
) async {
  // Add your function code here!
  List<dynamic> newList = [];
  if (query.isEmpty) {
    return dataList;
  }

  // Filter the list based on the query

  dataList.forEach((e) {
    if (e["name"].toString().toLowerCase().contains(query.toLowerCase())) {
      newList.add(e);
    }
  });

  return newList;
}
