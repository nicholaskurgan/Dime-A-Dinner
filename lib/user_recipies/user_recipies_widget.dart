import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/recipe_detail_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'user_recipies_model.dart';
export 'user_recipies_model.dart';

class UserRecipiesWidget extends StatefulWidget {
  const UserRecipiesWidget({super.key});

  @override
  State<UserRecipiesWidget> createState() => _UserRecipiesWidgetState();
}

class _UserRecipiesWidgetState extends State<UserRecipiesWidget>
    with TickerProviderStateMixin {
  late UserRecipiesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserRecipiesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'userRecipies'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.searchBarTextController ??= TextEditingController();
    _model.searchBarFocusNode ??= FocusNode();

    _model.myRecipesSearchTextController ??= TextEditingController();
    _model.myRecipesSearchFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord.where(
          'uid',
          isEqualTo: currentUserReference?.id,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersRecord> userRecipiesUsersRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final userRecipiesUsersRecord = userRecipiesUsersRecordList.isNotEmpty
            ? userRecipiesUsersRecordList.first
            : null;

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
                padding: const EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Align(
                            alignment: const Alignment(0.0, 0),
                            child: TabBar(
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    letterSpacing: 0.0,
                                  ),
                              unselectedLabelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    letterSpacing: 0.0,
                                  ),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).burgundy,
                              tabs: const [
                                Tab(
                                  text: 'Recipes List',
                                ),
                                Tab(
                                  text: 'My Recipes',
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [() async {}, () async {}][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              width: 200.0,
                                              child: TextFormField(
                                                key: const ValueKey('searchBar_0qom'),
                                                controller: _model
                                                    .searchBarTextController,
                                                focusNode:
                                                    _model.searchBarFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  hintText: 'TextField',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .orange,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .orange,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .burgundy,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .white,
                                                  contentPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 45.0,
                                                              0.0, 0.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .black,
                                                          letterSpacing: 0.0,
                                                        ),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .searchBarTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            key: const ValueKey('Search_6q6c'),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'USER_RECIPIES_PAGE_Search_ON_TAP');
                                              logFirebaseEvent(
                                                  'Search_backend_call');
                                              _model.apiResult5q7 =
                                                  await SpoonCall.call(
                                                searchQuery: _model
                                                    .searchBarTextController
                                                    .text,
                                                dietRestriction: 'vegan',
                                                dispAmt: 3,
                                              );

                                              safeSetState(() {});
                                            },
                                            text: 'search',
                                            options: FFButtonOptions(
                                              width: 80.0,
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .burgundy,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            key: const ValueKey('filters_ixlf'),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'USER_RECIPIES_PAGE_filters_ON_TAP');
                                              logFirebaseEvent(
                                                  'filters_navigate_to');

                                              context.pushNamed('FiltersPage');
                                            },
                                            text: 'filters',
                                            options: FFButtonOptions(
                                              width: 80.0,
                                              height: 40.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .burgundy,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 5.0)),
                                      ),
                                      FutureBuilder<ApiCallResponse>(
                                        future: SpoonCall.call(
                                          searchQuery: _model
                                              .searchBarTextController.text,
                                          dietRestriction:
                                              userRecipiesUsersRecord?.diet,
                                          apiKey: FFAppState().spoonApiKey,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewSpoonResponse =
                                              snapshot.data!;

                                          return Builder(
                                            builder: (context) {
                                              final result = ((getJsonField(
                                                        listViewSpoonResponse
                                                            .jsonBody,
                                                        r'''$.results''',
                                                        true,
                                                      )
                                                                  ?.toList()
                                                                  .map<SpoonResponseDataStruct?>(
                                                                      SpoonResponseDataStruct
                                                                          .maybeFromMap)
                                                                  .toList()
                                                              as Iterable<
                                                                  SpoonResponseDataStruct?>)
                                                          .withoutNulls
                                                          .toList() ??
                                                      [])
                                                  .take(3)
                                                  .toList();

                                              return ListView.separated(
                                                key: const ValueKey('ListView_de6d'),
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 10.0),
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: result.length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(height: 10.0),
                                                itemBuilder:
                                                    (context, resultIndex) {
                                                  final resultItem =
                                                      result[resultIndex];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'USER_RECIPIES_RecipeContainer_ON_TAP');
                                                        logFirebaseEvent(
                                                            'RecipeContainer_bottom_sheet');
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    RecipeDetailWidget(
                                                                  recipeName:
                                                                      resultItem
                                                                          .title,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                        child: Column(
                                                          key: const ValueKey(
                                                              'Column_5zkw'),
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                if (!functions.isRedicpeSaved(
                                                                    resultItem
                                                                        .title,
                                                                    userRecipiesUsersRecord
                                                                        ?.savedRecipes
                                                                        .toList())!)
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'USER_RECIPIES_PAGE_Icon_394vtil4_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Icon_backend_call');

                                                                      await currentUserReference!
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'saved_recipes':
                                                                                FieldValue.arrayUnion([
                                                                              resultItem.title
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .add_circle,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .burgundy,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                  ),
                                                                if (functions.isRedicpeSaved(
                                                                        resultItem
                                                                            .title,
                                                                        userRecipiesUsersRecord
                                                                            ?.savedRecipes
                                                                            .toList()) ??
                                                                    true)
                                                                  Icon(
                                                                    Icons
                                                                        .check_circle,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .lightGreen,
                                                                    size: 30.0,
                                                                  ),
                                                              ],
                                                            ),
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                resultItem
                                                                    .image,
                                                                width: 200.0,
                                                                height: 200.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          15.0,
                                                                          10.0,
                                                                          15.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Flexible(
                                                                    child: Text(
                                                                      resultItem
                                                                          .title,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).black,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(const SizedBox(
                                                                  height: 15.0))
                                                              .addToStart(
                                                                  const SizedBox(
                                                                      height:
                                                                          15.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ]
                                        .divide(const SizedBox(height: 10.0))
                                        .addToStart(const SizedBox(height: 10.0)),
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              width: 200.0,
                                              child: TextFormField(
                                                controller: _model
                                                    .myRecipesSearchTextController,
                                                focusNode: _model
                                                    .myRecipesSearchFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.myRecipesSearchTextController',
                                                  const Duration(milliseconds: 500),
                                                  () async {
                                                    logFirebaseEvent(
                                                        'USER_RECIPIES_MyRecipesSearch_ON_TEXTFIE');
                                                    logFirebaseEvent(
                                                        'MyRecipesSearch_update_app_state');
                                                    FFAppState().seatchMode =
                                                        true;
                                                    safeSetState(() {});
                                                    logFirebaseEvent(
                                                        'MyRecipesSearch_simple_search');
                                                    safeSetState(() {
                                                      _model
                                                          .simpleSearchResults = TextSearch(
                                                              userRecipiesUsersRecord!
                                                                  .savedRecipes
                                                                  .map((str) =>
                                                                      TextSearchItem.fromTerms(
                                                                          str, [
                                                                        str
                                                                      ]))
                                                                  .toList())
                                                          .search(_model
                                                              .myRecipesSearchTextController
                                                              .text)
                                                          .map((r) => r.object)
                                                          .toList();
                                                    });
                                                  },
                                                ),
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  hintText: 'Search...',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .orange,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .orange,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .burgundy,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .white,
                                                  contentPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 45.0,
                                                              0.0, 0.0),
                                                  prefixIcon: Icon(
                                                    Icons.search,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .orange,
                                                  ),
                                                  suffixIcon: _model
                                                          .myRecipesSearchTextController!
                                                          .text
                                                          .isNotEmpty
                                                      ? InkWell(
                                                          onTap: () async {
                                                            _model
                                                                .myRecipesSearchTextController
                                                                ?.clear();
                                                            logFirebaseEvent(
                                                                'USER_RECIPIES_MyRecipesSearch_ON_TEXTFIE');
                                                            logFirebaseEvent(
                                                                'MyRecipesSearch_update_app_state');
                                                            FFAppState()
                                                                    .seatchMode =
                                                                true;
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'MyRecipesSearch_simple_search');
                                                            safeSetState(() {
                                                              _model
                                                                  .simpleSearchResults = TextSearch(userRecipiesUsersRecord!
                                                                      .savedRecipes
                                                                      .map((str) =>
                                                                          TextSearchItem.fromTerms(
                                                                              str,
                                                                              [
                                                                                str
                                                                              ]))
                                                                      .toList())
                                                                  .search(_model
                                                                      .myRecipesSearchTextController
                                                                      .text)
                                                                  .map((r) =>
                                                                      r.object)
                                                                  .toList();
                                                            });
                                                            safeSetState(() {});
                                                          },
                                                          child: const Icon(
                                                            Icons.clear,
                                                            size: 20.0,
                                                          ),
                                                        )
                                                      : null,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .black,
                                                          letterSpacing: 0.0,
                                                        ),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .myRecipesSearchTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 5.0)),
                                      ),
                                      if (!FFAppState().seatchMode)
                                        Builder(
                                          builder: (context) {
                                            final savedRecipes =
                                                (userRecipiesUsersRecord
                                                            ?.savedRecipes
                                                            .toList() ??
                                                        [])
                                                    .take(5)
                                                    .toList();

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: savedRecipes.length,
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(height: 10.0),
                                              itemBuilder:
                                                  (context, savedRecipesIndex) {
                                                final savedRecipesItem =
                                                    savedRecipes[
                                                        savedRecipesIndex];
                                                return Visibility(
                                                  visible: functions
                                                      .myRecipesSearchResult(
                                                          _model
                                                              .searchBarTextController
                                                              .text,
                                                          savedRecipesItem),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'USER_RECIPIES_Container_mv79cf90_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Container_bottom_sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  RecipeDetailWidget(
                                                                recipeName:
                                                                    savedRecipesItem,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 80.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(22.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                savedRecipesItem,
                                                                maxLines: 3,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      1.0, 1.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'USER_RECIPIES_PAGE_Icon_noq5lyr7_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Icon_backend_call');

                                                                  await currentUserReference!
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'saved_recipes':
                                                                            FieldValue.arrayRemove([
                                                                          savedRecipesItem
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  Icons.delete,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .burgundy,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      if (FFAppState().seatchMode)
                                        Builder(
                                          builder: (context) {
                                            final searchResult = _model
                                                .simpleSearchResults
                                                .toList();

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: searchResult.length,
                                              itemBuilder:
                                                  (context, searchResultIndex) {
                                                final searchResultItem =
                                                    searchResult[
                                                        searchResultIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'USER_RECIPIES_Container_1jcn9coa_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Container_bottom_sheet');
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                RecipeDetailWidget(
                                                              recipeName:
                                                                  searchResultItem,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 80.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              searchResultItem,
                                                              maxLines: 3,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1.0, 1.0),
                                                            child: Icon(
                                                              Icons.delete,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .burgundy,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                    ]
                                        .divide(const SizedBox(height: 10.0))
                                        .around(const SizedBox(height: 10.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
