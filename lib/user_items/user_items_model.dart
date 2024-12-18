import '/components/shopping_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_items_widget.dart' show UserItemsWidget;
import 'package:flutter/material.dart';

class UserItemsModel extends FlutterFlowModel<UserItemsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for shoppingItem component.
  late ShoppingItemModel shoppingItemModel;

  @override
  void initState(BuildContext context) {
    shoppingItemModel = createModel(context, () => ShoppingItemModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    shoppingItemModel.dispose();
  }
}
