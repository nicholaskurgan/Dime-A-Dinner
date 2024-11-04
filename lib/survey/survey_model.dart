import '/flutter_flow/flutter_flow_util.dart';
import 'survey_widget.dart' show SurveyWidget;
import 'package:flutter/material.dart';

class SurveyModel extends FlutterFlowModel<SurveyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for FeedbackTxt widget.
  FocusNode? feedbackTxtFocusNode;
  TextEditingController? feedbackTxtTextController;
  String? Function(BuildContext, String?)? feedbackTxtTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    feedbackTxtFocusNode?.dispose();
    feedbackTxtTextController?.dispose();
  }
}
