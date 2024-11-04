import '/components/recipe_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_recipies_widget.dart' show UserRecipiesWidget;
import 'package:flutter/material.dart';

class UserRecipiesModel extends FlutterFlowModel<UserRecipiesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Models for recipe dynamic component.
  late FlutterFlowDynamicModels<RecipeModel> recipeModels1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Models for recipe dynamic component.
  late FlutterFlowDynamicModels<RecipeModel> recipeModels2;

  @override
  void initState(BuildContext context) {
    recipeModels1 = FlutterFlowDynamicModels(() => RecipeModel());
    recipeModels2 = FlutterFlowDynamicModels(() => RecipeModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    recipeModels1.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    recipeModels2.dispose();
  }
}
