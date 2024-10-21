import '/flutter_flow/flutter_flow_util.dart';
import 'signup_widget.dart' show SignupWidget;
import 'package:flutter/material.dart';

class SignupModel extends FlutterFlowModel<SignupWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SignUpEmailTxt widget.
  FocusNode? signUpEmailTxtFocusNode;
  TextEditingController? signUpEmailTxtTextController;
  String? Function(BuildContext, String?)?
      signUpEmailTxtTextControllerValidator;
  // State field(s) for SignUpPassTxt widget.
  FocusNode? signUpPassTxtFocusNode;
  TextEditingController? signUpPassTxtTextController;
  late bool signUpPassTxtVisibility;
  String? Function(BuildContext, String?)? signUpPassTxtTextControllerValidator;
  // State field(s) for SignUpConfirmTxt widget.
  FocusNode? signUpConfirmTxtFocusNode;
  TextEditingController? signUpConfirmTxtTextController;
  late bool signUpConfirmTxtVisibility;
  String? Function(BuildContext, String?)?
      signUpConfirmTxtTextControllerValidator;

  @override
  void initState(BuildContext context) {
    signUpPassTxtVisibility = false;
    signUpConfirmTxtVisibility = false;
  }

  @override
  void dispose() {
    signUpEmailTxtFocusNode?.dispose();
    signUpEmailTxtTextController?.dispose();

    signUpPassTxtFocusNode?.dispose();
    signUpPassTxtTextController?.dispose();

    signUpConfirmTxtFocusNode?.dispose();
    signUpConfirmTxtTextController?.dispose();
  }
}
