import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for LoginEmailTxt widget.
  FocusNode? loginEmailTxtFocusNode;
  TextEditingController? loginEmailTxtTextController;
  String? Function(BuildContext, String?)? loginEmailTxtTextControllerValidator;
  // State field(s) for LoginPassTxt widget.
  FocusNode? loginPassTxtFocusNode;
  TextEditingController? loginPassTxtTextController;
  late bool loginPassTxtVisibility;
  String? Function(BuildContext, String?)? loginPassTxtTextControllerValidator;

  @override
  void initState(BuildContext context) {
    loginPassTxtVisibility = false;
  }

  @override
  void dispose() {
    loginEmailTxtFocusNode?.dispose();
    loginEmailTxtTextController?.dispose();

    loginPassTxtFocusNode?.dispose();
    loginPassTxtTextController?.dispose();
  }
}
