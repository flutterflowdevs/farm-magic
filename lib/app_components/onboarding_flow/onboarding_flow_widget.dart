import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'onboarding_flow_model.dart';
export 'onboarding_flow_model.dart';

class OnboardingFlowWidget extends StatefulWidget {
  const OnboardingFlowWidget({
    super.key,
    required this.placeholder,
    required this.title,
    required this.description,
  });

  final String? placeholder;
  final String? title;
  final String? description;

  @override
  State<OnboardingFlowWidget> createState() => _OnboardingFlowWidgetState();
}

class _OnboardingFlowWidgetState extends State<OnboardingFlowWidget> {
  late OnboardingFlowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingFlowModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(0.0),
          child: Image.network(
            widget.placeholder!,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          valueOrDefault<String>(
            widget.title,
            'Title',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Acumin Pro',
                fontSize: 22.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
                useGoogleFonts: false,
              ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  valueOrDefault<String>(
                    widget.description,
                    'Desc',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Outfit',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ),
        ),
      ].divide(const SizedBox(height: 30.0)),
    );
  }
}
