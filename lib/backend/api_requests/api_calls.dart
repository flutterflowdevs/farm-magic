import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Buildship APIs Group Code

class BuildshipAPIsGroup {
  static String baseUrl = 'https://3k9suj.buildship.run';
  static Map<String, String> headers = {};
  static TranslateAPICall translateAPICall = TranslateAPICall();
  static TextToAudioCall textToAudioCall = TextToAudioCall();
}

class TranslateAPICall {
  Future<ApiCallResponse> call({
    String? text = '',
    String? languageCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "text": "$text",
  "target_language": "$languageCode"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Translate API',
      apiUrl: '${BuildshipAPIsGroup.baseUrl}/translate_api',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class TextToAudioCall {
  Future<ApiCallResponse> call({
    String? text = '',
  }) async {
    final ffApiRequestBody = '''
{
  "text": "$text"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Text to Audio',
      apiUrl: '${BuildshipAPIsGroup.baseUrl}/text_to_speech',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? audioPath(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data''',
      ));
}

/// End Buildship APIs Group Code

/// Start Leonardo APIs Group Code

class LeonardoAPIsGroup {
  static String baseUrl = 'https://cloud.leonardo.ai/api/rest/v1';
  static Map<String, String> headers = {
    'accept': 'application/json',
    'content-type': 'application/json',
    'authorization': 'Bearer c8e74a43-cf8b-4c80-94b5-6fe13d776358',
  };
  static GenerateImageCall generateImageCall = GenerateImageCall();
  static GetImageCall getImageCall = GetImageCall();
  static GenerateMotionCall generateMotionCall = GenerateMotionCall();
}

class GenerateImageCall {
  Future<ApiCallResponse> call({
    double? height,
    double? width,
    String? textPrompt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "alchemy": true,
  "height": $height,
  "modelId": "aa77f04e-3eec-4034-9c07-d0f619684628",
  "prompt": "$textPrompt",
  "width": $width,
  "guidance_scale": 9,
  "highResolution": true,
  "num_images": 1,
  "photoReal": true,
  "photoRealVersion": "v2",
  "public": false,
  "presetStyle": "PHOTOGRAPHY"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Generate Image',
      apiUrl: '${LeonardoAPIsGroup.baseUrl}/generations',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'authorization': 'Bearer c8e74a43-cf8b-4c80-94b5-6fe13d776358',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? genId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.sdGenerationJob.generationId''',
      ));
  int? creditCost(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.sdGenerationJob.apiCreditCost''',
      ));
}

class GetImageCall {
  Future<ApiCallResponse> call({
    String? genId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Image',
      apiUrl: '${LeonardoAPIsGroup.baseUrl}/generations/$genId',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'authorization': 'Bearer c8e74a43-cf8b-4c80-94b5-6fe13d776358',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? imageUrls(dynamic response) => (getJsonField(
        response,
        r'''$.generations_by_pk.generated_images[:].url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? imageIds(dynamic response) => (getJsonField(
        response,
        r'''$.generations_by_pk.generated_images[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? videoUrls(dynamic response) => getJsonField(
        response,
        r'''$.generations_by_pk.generated_images[:].motionMP4URL''',
        true,
      ) as List?;
  dynamic firstJsonRes(dynamic response) => getJsonField(
        response,
        r'''$.generations_by_pk.generated_images[0]''',
      );
}

class GenerateMotionCall {
  Future<ApiCallResponse> call({
    String? imageId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "imageId": "$imageId",
  "motionStrength": 10,
  "isPublic": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Generate Motion',
      apiUrl: '${LeonardoAPIsGroup.baseUrl}/generations-motion-svd',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
        'authorization': 'Bearer c8e74a43-cf8b-4c80-94b5-6fe13d776358',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  int? creditCost(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.motionSvdGenerationJob.apiCreditCost''',
      ));
  String? motionGenId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.motionSvdGenerationJob.generationId''',
      ));
}

/// End Leonardo APIs Group Code

/// Start Weather APIs Group Code

class WeatherAPIsGroup {
  static String baseUrl = 'https://api.tomorrow.io/v4/weather';
  static Map<String, String> headers = {};
  static GetWeatherForecastCall getWeatherForecastCall =
      GetWeatherForecastCall();
  static GetRealtimeWeatherDetailsCall getRealtimeWeatherDetailsCall =
      GetRealtimeWeatherDetailsCall();
}

class GetWeatherForecastCall {
  Future<ApiCallResponse> call({
    String? locationName = '',
    String? apiKey = 'K7NrqD4L7s1RB9UJSboTwZwSGxM75GRj',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Weather Forecast',
      apiUrl:
          '${WeatherAPIsGroup.baseUrl}/forecast?timesteps=1d&location=$locationName',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'location_name': locationName,
        'apikey': apiKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  double? todayMinTemperature(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.timelines.daily[0].values.temperatureMin''',
      ));
  double? todayMaxTemperature(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.timelines.daily[0].values.temperatureMax''',
      ));
  double? todayAvgTemperature(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.timelines.daily[0].values.temperatureAvg''',
      ));
  List? nextFourDayForecastDetails(dynamic response) => getJsonField(
        response,
        r'''$.timelines.daily[:4]''',
        true,
      ) as List?;
  List? list(dynamic response) => getJsonField(
        response,
        r'''$.timelines.daily''',
        true,
      ) as List?;
}

class GetRealtimeWeatherDetailsCall {
  Future<ApiCallResponse> call({
    String? locationName = '',
    String? apiKey = 'K7NrqD4L7s1RB9UJSboTwZwSGxM75GRj',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Realtime Weather Details',
      apiUrl: '${WeatherAPIsGroup.baseUrl}/realtime?location=$locationName',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'location_name': locationName,
        'apikey': apiKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  double? currentTemperature(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.data.values.temperature''',
      ));
}

/// End Weather APIs Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
