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

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<String> readFile() async {
  final rootDir = await getTemporaryDirectory();
  final path = '${rootDir.path.toString()}/inputs.txt'; // Get the path first
  final file = File(path);
  return await file.readAsString();
}

Future<void> clearTempDirectory() async {
  // Get the temporary directory
  final appDir = await getTemporaryDirectory();

  // List the files in the temporary directory
  var tempfiles = Directory("${appDir.path}/").listSync();

  debugPrint("${tempfiles.length} files deleted");

  // Delete each file in the temporary directory
  for (var file in tempfiles) {
    await file.delete();
  }
}

void _listofFiles() async {
  List file = [];
  String directoryPath = (await getTemporaryDirectory()).path;

  file = Directory("$directoryPath/")
      .listSync(); //use your folder name insted of resume.
  debugPrint('********* Files in directory STARTED ************');
  for (int i = 0; i < file.length; i++) {
    debugPrint(file[i].toString());
  }
  debugPrint('********* Files in directory ENDEDED ************');
}

Future<File> downloadVideosToTempDirectory(List<String> videoUrls) async {
  // Get the temporary directory
  final appDir = await getTemporaryDirectory();
  const inputFileName = "inputs.txt";
  final inputListPath = '${appDir.path}/$inputFileName';

  final fileInput = File(inputListPath);

  // Download the videos
  for (int i = 0; i < videoUrls.length; i++) {
    var response = await http.get(Uri.parse(videoUrls[i]));
    final filename = "${videoUrls[i].split('/').last.hashCode}.mp4";
    final file = File('${appDir.path}/$filename');
    await file.writeAsBytes(response.bodyBytes);
    await fileInput.writeAsString('file \'$filename\' \n',
        mode: FileMode.append);
  }

  readFile().then((value) {
    debugPrint('______________________________________________________');
    debugPrint(value);
    debugPrint('______________________________________________________');
  });

  _listofFiles();

  return fileInput;
}

Future<String> addVideos(
  List<String> motionUrls,
  String? audioUrlParam,
) async {
  // Add your function code here!

  List<String> videoUrls = motionUrls;

  String audioUrl = audioUrlParam ??
      "https://storage.googleapis.com/buildship-3k9suj-europe-west4/undefined/LcfcDJNUP1GQjkzn1xUU_1713180911226.mp3";

  await clearTempDirectory();
  _listofFiles();
  File inputFile = await downloadVideosToTempDirectory(videoUrls);

  try {
    // Firebase Storage instance
    final storage = FirebaseStorage.instance;

    final appDir = await getTemporaryDirectory();

    String outputFile = 'merged_video.mp4';

    final file = File('${appDir.path}/$outputFile');

    // String command =
    //     '-f concat -safe 0 -i ${inputFile.path} -c copy ${file.path}';

    String command =
        '-f concat -safe 0 -i ${inputFile.path} -i $audioUrl -c copy -async 1 -shortest ${file.path}';

    debugPrint(command.toString());

    final FlutterFFmpeg flutterFFmpeg = FlutterFFmpeg();

    await flutterFFmpeg
        .execute(command)
        .then((rc) => debugPrint("FFmpeg process exited with rc $rc"));

    _listofFiles();

    // Upload merged video
    await storage
        .ref(file.path.split('/').last)
        .putFile(file); // Assuming output is in local filesystem

    // Get download URL and delete temp files
    var downloadUrl =
        await storage.ref(file.path.split('/').last).getDownloadURL();

    await clearTempDirectory();

    _listofFiles();

    debugPrint(downloadUrl.toString());

    return downloadUrl;
  } catch (e) {
    debugPrint('Error merging videos: $e');
    rethrow;
  }
}
