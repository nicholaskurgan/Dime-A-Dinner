import '/flutter_flow/flutter_flow_util.dart';
import 'add_item_pop_up_widget.dart' show AddItemPopUpWidget;
import 'package:flutter/material.dart';

class AddItemPopUpModel extends FlutterFlowModel<AddItemPopUpWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
