import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_recipies_widget.dart' show UserRecipiesWidget;
import 'package:flutter/material.dart';

class UserRecipiesModel extends FlutterFlowModel<UserRecipiesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;
  // Stores action output result for [Backend Call - API (spoon)] action in Search widget.
  ApiCallResponse? apiResult5q7;
  // State field(s) for MyRecipesSearch widget.
  FocusNode? myRecipesSearchFocusNode;
  TextEditingController? myRecipesSearchTextController;
  String? Function(BuildContext, String?)?
      myRecipesSearchTextControllerValidator;
  List<String> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();

    myRecipesSearchFocusNode?.dispose();
    myRecipesSearchTextController?.dispose();
  }
}
