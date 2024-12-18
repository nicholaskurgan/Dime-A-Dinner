import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_item_pop_up_widget.dart' show AddItemPopUpWidget;
import 'package:flutter/material.dart';

class AddItemPopUpModel extends FlutterFlowModel<AddItemPopUpWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for ItemTitle widget.
  FocusNode? itemTitleFocusNode;
  TextEditingController? itemTitleTextController;
  String? Function(BuildContext, String?)? itemTitleTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in groceryAdd widget.
  ItemRecord? newGroceryItem;
  // Stores action output result for [Backend Call - Create Document] action in pantryAdd widget.
  ItemRecord? newPantryItem;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    itemTitleFocusNode?.dispose();
    itemTitleTextController?.dispose();
  }
}
