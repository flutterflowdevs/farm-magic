import '/app_components/profile_options/profile_options_widget.dart';
import '/app_components/select_language/select_language_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());
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
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                    child: Container(
                      width: 120.0,
                      height: 130.0,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                            spreadRadius: 2.0,
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(55.0),
                          bottomRight: Radius.circular(55.0),
                          topLeft: Radius.circular(55.0),
                          topRight: Radius.circular(55.0),
                        ),
                      ),
                      child: AuthUserStreamWidget(
                        builder: (context) => ClipRRect(
                          borderRadius: BorderRadius.circular(55.0),
                          child: Image.network(
                            currentUserPhoto,
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AuthUserStreamWidget(
                        builder: (context) => Text(
                          currentUserDisplayName,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AuthUserStreamWidget(
                        builder: (context) => Text(
                          '${valueOrDefault(currentUserDocument?.city, '')}, ${valueOrDefault(currentUserDocument?.state, '')}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context).accent3,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: wrapWithModel(
                          model: _model.profileOptionsModel1,
                          updateCallback: () => setState(() {}),
                          child: ProfileOptionsWidget(
                            optionTitle: FFLocalizations.of(context).getText(
                              'l4z5aiuz' /* Profile */,
                            ),
                            icon: Icon(
                              FFIcons.kuser,
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 24.0,
                            ),
                            isLogout: false,
                            action: () async {
                              context.pushNamed('EditProfile');
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: wrapWithModel(
                          model: _model.profileOptionsModel2,
                          updateCallback: () => setState(() {}),
                          child: ProfileOptionsWidget(
                            optionTitle: FFLocalizations.of(context).getText(
                              'hje48fx0' /* Language */,
                            ),
                            icon: Icon(
                              FFIcons.klanguagechange,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 24.0,
                            ),
                            isLogout: false,
                            action: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: const SelectLanguageWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: wrapWithModel(
                          model: _model.profileOptionsModel3,
                          updateCallback: () => setState(() {}),
                          child: ProfileOptionsWidget(
                            optionTitle: FFLocalizations.of(context).getText(
                              '0z0m17yt' /* Privacy Policy */,
                            ),
                            icon: Icon(
                              FFIcons.kprivacypolicy,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                            isLogout: false,
                            action: () async {
                              context.pushNamed('PrivacyAndPolicy');
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: wrapWithModel(
                          model: _model.profileOptionsModel4,
                          updateCallback: () => setState(() {}),
                          child: ProfileOptionsWidget(
                            optionTitle: FFLocalizations.of(context).getText(
                              '80e5pyet' /* Terms & Conditions */,
                            ),
                            icon: const Icon(
                              FFIcons.ktermsandconditions,
                              color: Color(0xFFC58848),
                              size: 24.0,
                            ),
                            isLogout: false,
                            action: () async {
                              context.pushNamed('TermsAndConditions');
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: wrapWithModel(
                          model: _model.profileOptionsModel5,
                          updateCallback: () => setState(() {}),
                          child: ProfileOptionsWidget(
                            optionTitle: FFLocalizations.of(context).getText(
                              'tfgv3cwt' /* Log out */,
                            ),
                            icon: Icon(
                              Icons.logout_rounded,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 25.0,
                            ),
                            isLogout: true,
                            action: () async {
                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();

                              context.goNamedAuth(
                                  'Onboarding', context.mounted);
                            },
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 25.0))
                        .addToEnd(const SizedBox(height: 20.0)),
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
