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

Future<String> addVideos(
  List<String> motionUrls,
  String audioUrl,
) async {
  // Add your function code here!
  List<String> videoUrls = motionUrls;

  String audioUrl =
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

    log(command.toString());

    final FlutterFFmpeg flutterFFmpeg = FlutterFFmpeg();

    await flutterFFmpeg
        .execute(command)
        .then((rc) => log("FFmpeg process exited with rc $rc"));

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

    log(downloadUrl.toString());

    return downloadUrl;
  } catch (e) {
    debugPrint('Error merging videos: $e');
    rethrow;
  }
}
