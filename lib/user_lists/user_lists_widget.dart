import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_item_pop_up_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'user_lists_model.dart';
export 'user_lists_model.dart';

class UserListsWidget extends StatefulWidget {
  const UserListsWidget({super.key});

  @override
  State<UserListsWidget> createState() => _UserListsWidgetState();
}

class _UserListsWidgetState extends State<UserListsWidget>
    with TickerProviderStateMixin {
  late UserListsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserListsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'userLists'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          key: const ValueKey('Container_svdu'),
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
                        child: FlutterFlowButtonTabBar(
                          useToggleButtonStyle: true,
                          labelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Lexend',
                                    letterSpacing: 0.0,
                                  ),
                          unselectedLabelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Lexend',
                                    letterSpacing: 0.0,
                                  ),
                          labelColor: FlutterFlowTheme.of(context).darkGreen,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).burgundy,
                          backgroundColor:
                              FlutterFlowTheme.of(context).lightGreen,
                          unselectedBackgroundColor:
                              FlutterFlowTheme.of(context).orange,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          elevation: 0.0,
                          buttonMargin: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          tabs: const [
                            Tab(
                              key: ValueKey('ShoppingListTab_dta3'),
                              text: 'Shopping List',
                            ),
                            Tab(
                              key: ValueKey('PantryListTab_686m'),
                              text: 'PantryList',
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
                            StreamBuilder<UsersRecord>(
                              stream: UsersRecord.getDocument(
                                  currentUserReference!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                final listViewUsersRecord = snapshot.data!;

                                return Builder(
                                  builder: (context) {
                                    final groceryItem = listViewUsersRecord
                                        .groceryList
                                        .toList();

                                    return ListView.separated(
                                      padding: const EdgeInsets.fromLTRB(
                                        0,
                                        12.0,
                                        0,
                                        0,
                                      ),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: groceryItem.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 12.0),
                                      itemBuilder: (context, groceryItemIndex) {
                                        final groceryItemItem =
                                            groceryItem[groceryItemIndex];
                                        return StreamBuilder<ItemRecord>(
                                          stream: ItemRecord.getDocument(
                                              groceryItemItem),
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }

                                            final containerItemRecord =
                                                snapshot.data!;

                                            return Container(
                                              width: double.infinity,
                                              height: 125.0,
                                              constraints: const BoxConstraints(
                                                maxWidth: 400.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(24.0),
                                                  bottomRight:
                                                      Radius.circular(24.0),
                                                  topLeft:
                                                      Radius.circular(24.0),
                                                  topRight:
                                                      Radius.circular(24.0),
                                                ),
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 3.0,
                                                ),
                                              ),
                                              child: Row(
                                                key: const ValueKey('Row_pdoy'),
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        containerItemRecord
                                                            .itemImage,
                                                        width: 100.0,
                                                        height: 100.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  8.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Text(
                                                        containerItemRecord
                                                            .title
                                                            .maybeHandleOverflow(
                                                          maxChars: 10,
                                                          replacement: '…',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Exa',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            key: const ValueKey(
                                                                'move_h116'),
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 8.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons.swap_horiz,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .darkGreen,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'USER_LISTS_PAGE_move_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'move_backend_call');

                                                              await currentUserReference!
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'pantryList':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      groceryItemItem
                                                                    ]),
                                                                    'groceryList':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      groceryItemItem
                                                                    ]),
                                                                  },
                                                                ),
                                                              });
                                                            },
                                                          ),
                                                          FlutterFlowIconButton(
                                                            key: const ValueKey(
                                                                'Delete_pn2m'),
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 8.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .delete_outline,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .burgundy,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'USER_LISTS_PAGE_Delete_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Delete_backend_call');

                                                              await listViewUsersRecord
                                                                  .reference
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'groceryList':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      groceryItemItem
                                                                    ]),
                                                                  },
                                                                ),
                                                              });
                                                              logFirebaseEvent(
                                                                  'Delete_backend_call');
                                                              await listViewUsersRecord
                                                                  .reference
                                                                  .delete();
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                            StreamBuilder<List<UsersRecord>>(
                              stream: queryUsersRecord(
                                queryBuilder: (usersRecord) =>
                                    usersRecord.where(
                                  'uid',
                                  isEqualTo: currentUserReference?.id,
                                ),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<UsersRecord> listViewUsersRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final listViewUsersRecord =
                                    listViewUsersRecordList.isNotEmpty
                                        ? listViewUsersRecordList.first
                                        : null;

                                return Builder(
                                  builder: (context) {
                                    final pantryItem = listViewUsersRecord
                                            ?.pantryList
                                            .toList() ??
                                        [];

                                    return ListView.separated(
                                      padding: const EdgeInsets.fromLTRB(
                                        0,
                                        12.0,
                                        0,
                                        0,
                                      ),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: pantryItem.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 12.0),
                                      itemBuilder: (context, pantryItemIndex) {
                                        final pantryItemItem =
                                            pantryItem[pantryItemIndex];
                                        return StreamBuilder<ItemRecord>(
                                          stream: ItemRecord.getDocument(
                                              pantryItemItem),
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }

                                            final containerItemRecord =
                                                snapshot.data!;

                                            return Container(
                                              width: double.infinity,
                                              height: 125.0,
                                              constraints: const BoxConstraints(
                                                maxWidth: 400.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(24.0),
                                                  bottomRight:
                                                      Radius.circular(24.0),
                                                  topLeft:
                                                      Radius.circular(24.0),
                                                  topRight:
                                                      Radius.circular(24.0),
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .orange,
                                                  width: 3.0,
                                                ),
                                              ),
                                              child: Row(
                                                key: const ValueKey('Row_pywu'),
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        containerItemRecord
                                                            .itemImage,
                                                        width: 100.0,
                                                        height: 100.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  8.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Text(
                                                        containerItemRecord
                                                            .title
                                                            .maybeHandleOverflow(
                                                          maxChars: 10,
                                                          replacement: '…',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Exa',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            key: const ValueKey(
                                                                'move_gu3l'),
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 8.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .swap_horiz_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .darkGreen,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'USER_LISTS_PAGE_move_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'move_backend_call');

                                                              await currentUserReference!
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'groceryList':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      pantryItemItem
                                                                    ]),
                                                                    'pantryList':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      pantryItemItem
                                                                    ]),
                                                                  },
                                                                ),
                                                              });
                                                            },
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 8.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .delete_outline,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .burgundy,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'USER_LISTS_PAGE_Delete_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Delete_backend_call');

                                                              await listViewUsersRecord!
                                                                  .reference
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'pantryList':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      pantryItemItem
                                                                    ]),
                                                                  },
                                                                ),
                                                              });
                                                              logFirebaseEvent(
                                                                  'Delete_backend_call');
                                                              await pantryItemItem
                                                                  .delete();
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(1.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: FlutterFlowIconButton(
                      key: const ValueKey('IconButton_1j17'),
                      borderColor: FlutterFlowTheme.of(context).darkGreen,
                      borderRadius: 24.0,
                      borderWidth: 3.0,
                      buttonSize: 50.0,
                      fillColor: FlutterFlowTheme.of(context).lightGreen,
                      icon: Icon(
                        Icons.add,
                        color: FlutterFlowTheme.of(context).darkGreen,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('USER_LISTS_PAGE_add_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: const AddItemPopUpWidget(),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));

                        logFirebaseEvent('IconButton_google_analytics_event');
                        logFirebaseEvent('add_list_item');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
