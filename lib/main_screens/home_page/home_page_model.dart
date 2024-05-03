import '/app_components/categories_container/categories_container_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/weather_container_widget.dart';
import '/components/your_diagnoses_widget.dart';
import '/delete/categories_container1/categories_container1_widget.dart';
import '/delete/search_text_field/search_text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<WeatherStruct> listWeather = [];
  void addToListWeather(WeatherStruct item) => listWeather.add(item);
  void removeFromListWeather(WeatherStruct item) => listWeather.remove(item);
  void removeAtIndexFromListWeather(int index) => listWeather.removeAt(index);
  void insertAtIndexInListWeather(int index, WeatherStruct item) =>
      listWeather.insert(index, item);
  void updateListWeatherAtIndex(int index, Function(WeatherStruct) updateFn) =>
      listWeather[index] = updateFn(listWeather[index]);

  int weatherIndex = 0;

  bool isLoader = false;

  LatLng? latLongValue;

  dynamic errorValue;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Gemini - Generate Text] action in HomePage widget.
  String? aiLocationOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  WeatherRecord? weatherResult;
  // Stores action output result for [Action Block - WeatherDetails] action in HomePage widget.
  List<WeatherStruct>? weatherAPIResult;
  // Stores action output result for [Action Block - WeatherDetails] action in HomePage widget.
  List<WeatherStruct>? weatherAPIResult2;
  // Model for Search_TextField component.
  late SearchTextFieldModel searchTextFieldModel;
  // Model for Categories_Container component.
  late CategoriesContainerModel categoriesContainerModel;
  // Model for Categories_Container1 component.
  late CategoriesContainer1Model categoriesContainer1Model;
  // Model for Weather_Container component.
  late WeatherContainerModel weatherContainerModel;
  // Model for yourDiagnoses component.
  late YourDiagnosesModel yourDiagnosesModel;

  @override
  void initState(BuildContext context) {
    searchTextFieldModel = createModel(context, () => SearchTextFieldModel());
    categoriesContainerModel =
        createModel(context, () => CategoriesContainerModel());
    categoriesContainer1Model =
        createModel(context, () => CategoriesContainer1Model());
    weatherContainerModel = createModel(context, () => WeatherContainerModel());
    yourDiagnosesModel = createModel(context, () => YourDiagnosesModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchTextFieldModel.dispose();
    categoriesContainerModel.dispose();
    categoriesContainer1Model.dispose();
    weatherContainerModel.dispose();
    yourDiagnosesModel.dispose();
  }

  /// Action blocks.
  Future<List<WeatherStruct>?> weatherDetails(
    BuildContext context, {
    String? locationName,
  }) async {
    ApiCallResponse? resultForcast;
    ApiCallResponse? resultCurrentData;

    resultForcast = await WeatherAPIsGroup.getWeatherForecastCall.call(
      locationName: locationName,
    );
    resultCurrentData =
        await WeatherAPIsGroup.getRealtimeWeatherDetailsCall.call(
      locationName: locationName,
    );
    while (weatherIndex <
        WeatherAPIsGroup.getWeatherForecastCall
            .list(
              (resultForcast.jsonBody ?? ''),
            )!
            .length) {
      if (weatherIndex == 0) {
        errorValue = functions.getWeatherCodeValue(
            FFAppState().weatherErrorCode,
            getJsonField(
              WeatherAPIsGroup.getWeatherForecastCall.list(
                (resultForcast.jsonBody ?? ''),
              )?[weatherIndex],
              r'''$.values.weatherCodeMax''',
            ).toString().toString());
        addToListWeather(WeatherStruct(
          min: WeatherAPIsGroup.getWeatherForecastCall.todayMinTemperature(
            (resultForcast.jsonBody ?? ''),
          ),
          max: WeatherAPIsGroup.getWeatherForecastCall.todayMaxTemperature(
            (resultForcast.jsonBody ?? ''),
          ),
          city: locationName,
          date: getCurrentTimestamp,
          todayTemp:
              WeatherAPIsGroup.getRealtimeWeatherDetailsCall.currentTemperature(
            (resultCurrentData.jsonBody ?? ''),
          ),
          name: getJsonField(
            errorValue,
            r'''$.name''',
          ).toString().toString(),
          image: getJsonField(
            errorValue,
            r'''$.image_url''',
          ).toString(),
          errorCode: getJsonField(
            WeatherAPIsGroup.getWeatherForecastCall.list(
              (resultForcast.jsonBody ?? ''),
            )?[weatherIndex],
            r'''$.values.weatherCodeMax''',
          ).toString().toString(),
        ));
      } else {
        errorValue = functions.getWeatherCodeValue(
            FFAppState().weatherErrorCode,
            getJsonField(
              WeatherAPIsGroup.getWeatherForecastCall.list(
                (resultForcast.jsonBody ?? ''),
              )?[weatherIndex],
              r'''$.values.weatherCodeMax''',
            ).toString().toString());
        addToListWeather(WeatherStruct(
          min: getJsonField(
            WeatherAPIsGroup.getWeatherForecastCall.list(
              (resultForcast.jsonBody ?? ''),
            )?[weatherIndex],
            r'''$.values.temperatureMin''',
          ),
          max: getJsonField(
            WeatherAPIsGroup.getWeatherForecastCall.list(
              (resultForcast.jsonBody ?? ''),
            )?[weatherIndex],
            r'''$.values.temperatureMax''',
          ),
          city: locationName,
          date: functions.increaseDate(getCurrentTimestamp, weatherIndex),
          todayTemp: getJsonField(
            WeatherAPIsGroup.getWeatherForecastCall.list(
              (resultForcast.jsonBody ?? ''),
            )?[weatherIndex],
            r'''$.values.temperatureAvg''',
          ),
          name: getJsonField(
            errorValue,
            r'''$.name''',
          ).toString().toString(),
          image: getJsonField(
            errorValue,
            r'''$.image_url''',
          ).toString(),
          errorCode: getJsonField(
            WeatherAPIsGroup.getWeatherForecastCall.list(
              (resultForcast.jsonBody ?? ''),
            )?[weatherIndex],
            r'''$.values.weatherCodeMax''',
          ).toString().toString(),
        ));
      }

      weatherIndex = weatherIndex + 1;
    }
    return listWeather;
  }
}
