import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'survey_model.dart';
export 'survey_model.dart';

class SurveyWidget extends StatefulWidget {
  const SurveyWidget({super.key});

  @override
  State<SurveyWidget> createState() => _SurveyWidgetState();
}

class _SurveyWidgetState extends State<SurveyWidget> {
  late SurveyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SurveyModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'survey'});
    _model.feedbackTxtTextController ??= TextEditingController();
    _model.feedbackTxtFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Background_3.png',
              ).image,
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(25.0, 110.0, 25.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'How would you rate this app?',
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Merriweather Sans',
                                color: FlutterFlowTheme.of(context).burgundy,
                                letterSpacing: 0.0,
                              ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RatingBar.builder(
                          onRatingUpdate: (newValue) => safeSetState(
                              () => _model.ratingBarValue = newValue),
                          itemBuilder: (context, index) => Icon(
                            Icons.star_rounded,
                            color: FlutterFlowTheme.of(context).darkGreen,
                          ),
                          direction: Axis.horizontal,
                          initialRating: _model.ratingBarValue ??= 5.0,
                          unratedColor: const Color(0x7EBC5B2C),
                          itemCount: 10,
                          itemSize: 30.0,
                          glowColor: FlutterFlowTheme.of(context).darkGreen,
                        ),
                      ],
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Text(
                          'Have any suggestions for us?',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Merriweather Sans',
                                color: FlutterFlowTheme.of(context).burgundy,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        key: const ValueKey('FeedbackTxt_odqd'),
                        controller: _model.feedbackTxtTextController,
                        focusNode: _model.feedbackTxtFocusNode,
                        autofocus: false,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Lexend',
                                    color: FlutterFlowTheme.of(context).orange,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Any improvements we could make?',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Lexend',
                                    color: FlutterFlowTheme.of(context).orange,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).orange,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              26.0, 24.0, 0.0, 24.0),
                        ),
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Lexend',
                                  color: FlutterFlowTheme.of(context).black,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                        maxLines: 9,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        validator: _model.feedbackTxtTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ].divide(const SizedBox(height: 22.0)),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FFButtonWidget(
                        key: const ValueKey('SubmitBtn_ipv1'),
                        onPressed: () async {
                          logFirebaseEvent('SURVEY_PAGE_SubmitBtn_ON_TAP');
                          logFirebaseEvent('SubmitBtn_google_analytics_event');
                          logFirebaseEvent(valueOrDefault<String>(
                            _model.ratingBarValue?.toString(),
                            '0',
                          ));
                          logFirebaseEvent('SubmitBtn_backend_call');

                          await FeedbackRecord.collection.doc().set({
                            ...createFeedbackRecordData(
                              userResponce:
                                  _model.feedbackTxtTextController.text,
                              user: currentUserReference,
                              rating: _model.ratingBarValue?.round(),
                            ),
                            ...mapToFirestore(
                              {
                                'time': FieldValue.serverTimestamp(),
                              },
                            ),
                          });
                          logFirebaseEvent('SubmitBtn_navigate_to');

                          context.pushNamed('userLists');
                        },
                        text: 'Submit Feedback',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 70.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).lightGreen,
                          textStyle:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Lexend Exa',
                                    color: FlutterFlowTheme.of(context).beige,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ].addToEnd(const SizedBox(height: 33.0)),
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
