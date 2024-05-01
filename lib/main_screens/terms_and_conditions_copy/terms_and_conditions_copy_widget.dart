import '/components/text_for_terms_and_privacy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'terms_and_conditions_copy_model.dart';
export 'terms_and_conditions_copy_model.dart';

class TermsAndConditionsCopyWidget extends StatefulWidget {
  const TermsAndConditionsCopyWidget({super.key});

  @override
  State<TermsAndConditionsCopyWidget> createState() =>
      _TermsAndConditionsCopyWidgetState();
}

class _TermsAndConditionsCopyWidgetState
    extends State<TermsAndConditionsCopyWidget> {
  late TermsAndConditionsCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsAndConditionsCopyModel());
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 10.0),
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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Terms And Conditions',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 21.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              Divider(
                thickness: 1.0,
                indent: 10.0,
                endIndent: 10.0,
                color: FlutterFlowTheme.of(context).accent2,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 30.0, 12.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Welcome to Farmers-Help! These Terms and Conditions (\"Terms\") govern your use of our mobile app and services provided therein (\"App\"). By accessing or using the App, you agree to be bound by these Terms.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 20.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textForTermsAndPrivacyModel1,
                          updateCallback: () => setState(() {}),
                          child: const TextForTermsAndPrivacyWidget(
                            title: '1. Acceptance of Terms',
                            text:
                                'By accessing or using the App, you agree to comply with these Terms. If you do not agree with any part of these Terms, you may not use the App.',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 20.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textForTermsAndPrivacyModel2,
                          updateCallback: () => setState(() {}),
                          child: const TextForTermsAndPrivacyWidget(
                            title: '2. Services',
                            text:
                                'Our App provides various services aimed at assisting farmers in growing their plants and crops more effectively. These services include but are not limited to:\n\na) Providing agricultural advice and recommendations based on data analysis and AI technology.\n\nb) Offering tools and resources for plant care, pest management, and crop optimization.\n\nc) Facilitating communication and collaboration among farmers and agricultural experts.\n\nd) Providing access to educational content, tutorials, and training materials related to farming practices.',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 20.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textForTermsAndPrivacyModel3,
                          updateCallback: () => setState(() {}),
                          child: const TextForTermsAndPrivacyWidget(
                            title: '3. User Conduct',
                            text:
                                'You agree to use the App in compliance with all applicable laws, regulations, and these Terms. You shall not:\n\na) Use the App for any unlawful or unauthorized purpose.\n\n b) Interfere with or disrupt the operation of the App or any servers or networks connected to the App.\n\nc)  Transmit any viruses, malware, or harmful code through the App.\n\nd)  Impersonate any person or entity, or falsely state or misrepresent your affiliation with any person or entity.',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 20.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textForTermsAndPrivacyModel4,
                          updateCallback: () => setState(() {}),
                          child: const TextForTermsAndPrivacyWidget(
                            title: '4. Privacy Policy',
                            text:
                                'Your privacy is important to us. Please review our Privacy Policy to understand how we collect, use, and disclose your personal information when you use our App.',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 20.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textForTermsAndPrivacyModel5,
                          updateCallback: () => setState(() {}),
                          child: const TextForTermsAndPrivacyWidget(
                            title: '5. Intellectual Property',
                            text:
                                'All content, trademarks, logos, and intellectual property rights displayed on the App are owned by us or our licensors. You may not use, reproduce, or distribute any content from the App without our prior written consent.',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 20.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textForTermsAndPrivacyModel6,
                          updateCallback: () => setState(() {}),
                          child: const TextForTermsAndPrivacyWidget(
                            title: '6. Disclaimer of Warranties',
                            text:
                                'The App and its services are provided on an \"as-is\" and \"as-available\" basis, without warranties of any kind, either express or implied. We do not guarantee the accuracy, reliability, or completeness of any information provided through the App.',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 20.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textForTermsAndPrivacyModel7,
                          updateCallback: () => setState(() {}),
                          child: const TextForTermsAndPrivacyWidget(
                            title: '7. Limitation of Liability',
                            text:
                                'In no event shall we be liable for any indirect, incidental, special, or consequential damages arising out of or in connection with your use of the App or its services, even if we have been advised of the possibility of such damages.',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 20.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textForTermsAndPrivacyModel8,
                          updateCallback: () => setState(() {}),
                          child: const TextForTermsAndPrivacyWidget(
                            title: '8. Governing Law',
                            text:
                                'These Terms shall be governed by and construed in accordance with the laws, without regard to its conflict of law provisions.',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 20.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textForTermsAndPrivacyModel9,
                          updateCallback: () => setState(() {}),
                          child: const TextForTermsAndPrivacyWidget(
                            title: '9. Changes to Terms',
                            text:
                                'We reserve the right to modify or update these Terms at any time. Your continued use of the App after any changes indicates your acceptance of the modified Terms.',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 20.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textForTermsAndPrivacyModel10,
                          updateCallback: () => setState(() {}),
                          child: const TextForTermsAndPrivacyWidget(
                            title: '10. Contact Us',
                            text:
                                'If you have any questions or concerns about these Terms, please contact us at info@flutterflowdevs.com.',
                          ),
                        ),
                      ),
                    ].addToEnd(const SizedBox(height: 20.0)),
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
