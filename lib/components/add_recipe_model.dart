import '/flutter_flow/flutter_flow_util.dart';
import 'add_recipe_widget.dart' show AddRecipeWidget;
import 'package:flutter/material.dart';

class AddRecipeModel extends FlutterFlowModel<AddRecipeWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for RecipeTitle widget.
  FocusNode? recipeTitleFocusNode;
  TextEditingController? recipeTitleTextController;
  String? Function(BuildContext, String?)? recipeTitleTextControllerValidator;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    recipeTitleFocusNode?.dispose();
    recipeTitleTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
