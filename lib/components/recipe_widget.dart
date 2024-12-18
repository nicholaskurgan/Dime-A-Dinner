import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'recipe_model.dart';
export 'recipe_model.dart';

class RecipeWidget extends StatefulWidget {
  const RecipeWidget({
    super.key,
    required this.recipeResult,
  });

  final dynamic recipeResult;

  @override
  State<RecipeWidget> createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends State<RecipeWidget> {
  late RecipeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecipeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 314.0,
      height: 337.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      getJsonField(
                        widget.recipeResult,
                        r'''$.title''',
                      ).toString(),
                      maxLines: 3,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Merriweather Sans',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      unselectedWidgetColor:
                          FlutterFlowTheme.of(context).alternate,
                    ),
                    child: Checkbox(
                      value: _model.checkboxValue ??= false,
                      onChanged: (newValue) async {
                        safeSetState(() => _model.checkboxValue = newValue!);
                        if (newValue!) {
                          logFirebaseEvent(
                              'RECIPE_Checkbox_6hg2k3xg_ON_TOGGLE_ON');
                          logFirebaseEvent('Checkbox_backend_call');

                          await currentUserReference!.update({
                            ...mapToFirestore(
                              {
                                'metric_recipe_counter':
                                    FieldValue.increment(1),
                              },
                            ),
                          });
                        }
                      },
                      side: BorderSide(
                        width: 2,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      activeColor: FlutterFlowTheme.of(context).lightGreen,
                      checkColor: FlutterFlowTheme.of(context).info,
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                getJsonField(
                  widget.recipeResult,
                  r'''$.image''',
                ).toString(),
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Description',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Merriweather Sans',
                    letterSpacing: 0.0,
                  ),
            ),
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('RECIPE_COMP_SAVE_BTN_ON_TAP');
                logFirebaseEvent('Button_backend_call');

                await currentUserReference!.update({
                  ...mapToFirestore(
                    {
                      'saved_recipes': FieldValue.arrayUnion([
                        getJsonField(
                          widget.recipeResult,
                          r'''$.title''',
                        ).toString()
                      ]),
                    },
                  ),
                });
              },
              text: 'Save',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40.0,
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).burgundy,
                textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Lexend Exa',
                      color: FlutterFlowTheme.of(context).beige,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
          ].divide(const SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
