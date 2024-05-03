import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'profile_options_model.dart';
export 'profile_options_model.dart';

class ProfileOptionsWidget extends StatefulWidget {
  const ProfileOptionsWidget({
    super.key,
    required this.optionTitle,
    required this.icon,
    required this.action,
    required this.isLogout,
  });

  final String? optionTitle;
  final Widget? icon;
  final Future Function()? action;
  final bool? isLogout;

  @override
  State<ProfileOptionsWidget> createState() => _ProfileOptionsWidgetState();
}

class _ProfileOptionsWidgetState extends State<ProfileOptionsWidget> {
  late ProfileOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileOptionsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.action?.call();
      },
      child: Material(
        color: Colors.transparent,
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: double.infinity,
          height: 50.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).appBG2,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                widget.icon!,
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.optionTitle,
                        'abc',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
                if (!widget.isLogout!)
                  Icon(
                    Icons.arrow_forward,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 32.0,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
