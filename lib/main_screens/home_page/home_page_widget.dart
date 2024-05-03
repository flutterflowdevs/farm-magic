import '/app_components/categories_container/categories_container_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/gemini/gemini.dart';
import '/components/weather_container_widget.dart';
import '/components/your_diagnoses_widget.dart';
import '/delete/categories_container1/categories_container1_widget.dart';
import '/delete/search_text_field/search_text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      if (isWeb) {
        setState(() {
          _model.latLongValue = FFAppState().defaultLatLong;
        });
      } else {
        setState(() {
          _model.latLongValue = currentUserLocationValue;
        });
      }

      setState(() {
        _model.isLoader = true;
        _model.weatherIndex = 0;
        _model.errorValue = null;
      });
      await geminiGenerateText(
        context,
        '${_model.latLongValue?.toString()}  what is location name ? example KOTA',
      ).then((generatedText) {
        safeSetState(() => _model.aiLocationOutput = generatedText);
      });

      _model.weatherResult = await queryWeatherRecordOnce(
        queryBuilder: (weatherRecord) => weatherRecord.where(
          'city',
          isEqualTo: _model.aiLocationOutput,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.weatherResult != null) {
        if (dateTimeFormat(
              'd/M/y',
              getCurrentTimestamp,
              locale: FFLocalizations.of(context).languageCode,
            ) ==
            _model.weatherResult?.date) {
          setState(() {
            _model.listWeather = _model.weatherResult!.weatherResult
                .toList()
                .cast<WeatherStruct>();
            _model.isLoader = false;
          });
          return;
        } else {
          unawaited(
            () async {
              await _model.weatherResult!.reference.delete();
            }(),
          );
          _model.weatherAPIResult = await _model.weatherDetails(
            context,
            locationName: _model.aiLocationOutput,
          );
          unawaited(
            () async {
              await WeatherRecord.collection.doc().set({
                ...createWeatherRecordData(
                  city: _model.aiLocationOutput,
                  date: dateTimeFormat(
                    'd/M/y',
                    getCurrentTimestamp,
                    locale: FFLocalizations.of(context).languageCode,
                  ),
                ),
                ...mapToFirestore(
                  {
                    'weatherResult': getWeatherListFirestoreData(
                      _model.weatherAPIResult,
                    ),
                  },
                ),
              });
            }(),
          );
          setState(() {
            _model.listWeather =
                _model.weatherAPIResult!.toList().cast<WeatherStruct>();
            _model.isLoader = false;
          });
          return;
        }
      } else {
        _model.weatherAPIResult2 = await _model.weatherDetails(
          context,
          locationName: _model.aiLocationOutput,
        );
        unawaited(
          () async {
            await WeatherRecord.collection.doc().set({
              ...createWeatherRecordData(
                city: _model.aiLocationOutput,
                date: dateTimeFormat(
                  'd/M/y',
                  getCurrentTimestamp,
                  locale: FFLocalizations.of(context).languageCode,
                ),
              ),
              ...mapToFirestore(
                {
                  'weatherResult': getWeatherListFirestoreData(
                    _model.weatherAPIResult2,
                  ),
                },
              ),
            });
          }(),
        );
        setState(() {
          _model.listWeather =
              _model.weatherAPIResult2!.toList().cast<WeatherStruct>();
          _model.isLoader = false;
        });
        return;
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).appBG2,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).appBG2,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 70.0, 0.0, 0.0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'shprqzpg' /* Hi,  */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 28.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  TextSpan(
                                    text: currentUserDisplayName,
                                    style: GoogleFonts.getFont(
                                      'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 28.0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      '8h0nglqo' /* 
Explore Farm Magic   */
                                      ,
                                    ),
                                    style: GoogleFonts.getFont(
                                      'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 36.0,
                                    ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          if (false)
                            wrapWithModel(
                              model: _model.searchTextFieldModel,
                              updateCallback: () => setState(() {}),
                              child: const SearchTextFieldWidget(),
                            ),
                          if (false &&
                              responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                              ))
                            wrapWithModel(
                              model: _model.categoriesContainerModel,
                              updateCallback: () => setState(() {}),
                              child: const CategoriesContainerWidget(),
                            ),
                          wrapWithModel(
                            model: _model.categoriesContainer1Model,
                            updateCallback: () => setState(() {}),
                            child: const CategoriesContainer1Widget(),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.weatherContainerModel,
                              updateCallback: () => setState(() {}),
                              child: WeatherContainerWidget(
                                listWeather: _model.listWeather,
                                isLoader: _model.isLoader,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 30.0),
                            child: wrapWithModel(
                              model: _model.yourDiagnosesModel,
                              updateCallback: () => setState(() {}),
                              child: const YourDiagnosesWidget(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
