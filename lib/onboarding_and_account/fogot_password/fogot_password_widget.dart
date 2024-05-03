import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'fogot_password_model.dart';
export 'fogot_password_model.dart';

class FogotPasswordWidget extends StatefulWidget {
  const FogotPasswordWidget({super.key});

  @override
  State<FogotPasswordWidget> createState() => _FogotPasswordWidgetState();
}

class _FogotPasswordWidgetState extends State<FogotPasswordWidget> {
  late FogotPasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FogotPasswordModel());

    _model.emailIdTextController ??= TextEditingController();
    _model.emailIdFocusNode ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 0.0, 20.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.safePop();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 26.0,
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'rlmy5zr0' /* Go back */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.network(
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/y15lgesj4pgl/Forgot_password.png',
                    width: double.infinity,
                    height: 309.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '0utqhskh' /* A link will be shared to your ... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            fontSize: 17.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 25.0, 15.0, 0.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: (_model.email == '') ||
                                !_model.isMailValid
                            ? FlutterFlowTheme.of(context).error
                            : const Color(0x00000000),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
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
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          hintText: FFLocalizations.of(context).getText(
                            '2vow8t0i' /* Email Id */,
                          ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).accent3,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
              ),
              if ((_model.email == '') ||
                  !_model.isMailValid)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(17.0, 8.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        _model.email == ''
                            ? 'Email is required for signup'
                            : 'Enter a valid email Id',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).error,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    setState(() {
                      _model.email = _model.emailIdTextController.text;
                      _model.isMailValid = functions
                          .validatingEmail(_model.emailIdTextController.text);
                    });
                    if ((_model.emailIdTextController.text == '') ||
                        !_model.isMailValid) {
                      return;
                    }

                    if (_model.emailIdTextController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Email required!',
                          ),
                        ),
                      );
                      return;
                    }
                    await authManager.resetPassword(
                      email: _model.emailIdTextController.text,
                      context: context,
                    );
                    context.safePop();
                    return;
                  },
                  text: FFLocalizations.of(context).getText(
                    'rqucux3c' /* Send Link */,
                  ),
                  options: FFButtonOptions(
                    width: 150.0,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
