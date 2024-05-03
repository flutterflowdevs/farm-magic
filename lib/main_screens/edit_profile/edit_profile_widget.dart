import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.profilePhoto = currentUserPhoto;
      });
    });

    _model.userNameTextController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.userNameFocusNode ??= FocusNode();

    _model.emailIdTextController ??=
        TextEditingController(text: currentUserEmail);
    _model.emailIdFocusNode ??= FocusNode();

    _model.cityTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.city, ''));
    _model.cityFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).appBG2,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            width: 35.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: const Color(0xCCEBE8C1),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 22.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: const CircleBorder(),
                        child: Container(
                          width: 130.0,
                          height: 130.0,
                          decoration: const BoxDecoration(
                            color: Color(0x4DD0B50B),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                                spreadRadius: 4.0,
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 122.0,
                                height: 122.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  _model.profilePhoto,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              120.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                allowPhoto: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                setState(() => _model.isDataUploading = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  showUploadMessage(
                                    context,
                                    'Uploading file...',
                                    showLoading: true,
                                  );
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  _model.isDataUploading = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  setState(() {
                                    _model.uploadedLocalFile =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl = downloadUrls.first;
                                  });
                                  showUploadMessage(context, 'Success!');
                                } else {
                                  setState(() {});
                                  showUploadMessage(
                                      context, 'Failed to upload data');
                                  return;
                                }
                              }

                              if (_model.uploadedFileUrl != '') {
                                setState(() {
                                  _model.profilePhoto = _model.uploadedFileUrl;
                                });
                                return;
                              } else {
                                return;
                              }
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.edit,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 26.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(15.0, 40.0, 15.0, 40.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '9l7gr7vl' /* Name */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => TextFormField(
                                controller: _model.userNameTextController,
                                focusNode: _model.userNameFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'tzsytltq' /* Name */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                validator: _model
                                    .userNameTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'b1rik077' /* Email */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: TextFormField(
                              controller: _model.emailIdTextController,
                              focusNode: _model.emailIdFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'k0m87vg0' /* Email Id */,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              keyboardType: TextInputType.emailAddress,
                              validator: _model.emailIdTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '6hr68myw' /* State */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: _model.stateDropDownValue == null ||
                                      _model.stateDropDownValue == ''
                                  ? FlutterFlowTheme.of(context).error
                                  : const Color(0x00000000),
                            ),
                          ),
                          child: AuthUserStreamWidget(
                            builder: (context) => FlutterFlowDropDown<String>(
                              controller:
                                  _model.stateDropDownValueController ??=
                                      FormFieldController<String>(
                                _model.stateDropDownValue ??= valueOrDefault(
                                    currentUserDocument?.state, ''),
                              ),
                              options: [
                                FFLocalizations.of(context).getText(
                                  'dhgxiqh8' /* Andhra Pradesh */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'obxk71ya' /* Arunachal Pradesh */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '4bq8l7q8' /* Assam */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'a34ui43v' /* Bihar */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'uv1ezvrr' /* Chhattisgarh */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ghmjefor' /* Goa */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'l054t2my' /* Gujarat */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '9pqs1hls' /* Haryana */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'nl0aehhw' /* Himachal Pradesh */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '2sbni61r' /* Jharkhand */,
                                ),
                                FFLocalizations.of(context).getText(
                                  't6gaa248' /* Karnataka */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'evamc7cg' /* Kerala */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'toi3az7u' /* Madhya Pradesh */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'kzax1h6a' /* Maharashtra */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '9k3woquo' /* Manipur */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'doejikk4' /* Meghalaya */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ei379ywm' /* Mizoram */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '8vfvskij' /* Nagaland */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'woja0w7s' /* Odisha */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'xz5252yw' /* Punjab */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'eupmc1ky' /* Rajasthan */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '6jlqgxpf' /* Sikkim */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '9gjg3jp8' /* Tamil Nadu */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'l8l9t2zl' /* Telangana */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'w2m3zusj' /* Tripura */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '42rrjqp4' /* Uttar Pradesh */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'go3llrc5' /* Uttarakhand */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'v9a9e7gw' /* West Bengal */,
                                )
                              ],
                              onChanged: (val) => setState(
                                  () => _model.stateDropDownValue = val),
                              width: 300.0,
                              height: 56.0,
                              maxHeight: 250.0,
                              searchHintTextStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).accent3,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                              searchTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                '4ryh3u94' /* Select state... */,
                              ),
                              searchHintText:
                                  FFLocalizations.of(context).getText(
                                'c6ewu5d2' /* Search your state... */,
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 2.0,
                              borderRadius: 20.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: true,
                              isMultiSelect: false,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '6urgmu88' /* City */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => TextFormField(
                                controller: _model.cityTextController,
                                focusNode: _model.cityFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'wdtar0yd' /* City (eg. Jaipur) */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                validator: _model.cityTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    if (_model.userNameTextController.text == '') {
                      return;
                    } else if (_model.emailIdTextController.text == '') {
                      return;
                    } else if (_model.stateDropDownValue == null ||
                        _model.stateDropDownValue == '') {
                      return;
                    } else if (_model.cityTextController.text == '') {
                      return;
                    }

                    await currentUserReference!.update(createUsersRecordData(
                      email: _model.emailIdTextController.text,
                      displayName: _model.userNameTextController.text,
                      state: _model.stateDropDownValue,
                      city: _model.cityTextController.text,
                      photoUrl: _model.profilePhoto,
                    ));

                    context.goNamed('NavigationWrapper');

                    return;
                  },
                  text: FFLocalizations.of(context).getText(
                    '2136rzfu' /* Save Changes */,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).tertiary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
