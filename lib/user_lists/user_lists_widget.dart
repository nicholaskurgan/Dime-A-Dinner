import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_item_pop_up_widget.dart';
import '/components/item_widget.dart';
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.asset(
                'assets/images/Background_beige_orange.png',
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
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
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
                          indicatorColor: FlutterFlowTheme.of(context).burgundy,
                          tabs: const [
                            Tab(
                              text: 'Shopping List',
                            ),
                            Tab(
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
                            StreamBuilder<List<ItemRecord>>(
                              stream: queryItemRecord(
                                queryBuilder: (itemRecord) => itemRecord
                                    .where(
                                      'user',
                                      isEqualTo: currentUserReference,
                                    )
                                    .where(
                                      'isPurchased',
                                      isEqualTo: false,
                                    ),
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
                                List<ItemRecord> listViewItemRecordList =
                                    snapshot.data!;

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewItemRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewItemRecord =
                                        listViewItemRecordList[listViewIndex];
                                    return
                                        // want to add quantity and edit mode
                                        Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: ItemWidget(
                                        key: Key(
                                            'Keyh12_${listViewIndex}_of_${listViewItemRecordList.length}'),
                                        item: listViewItemRecord,
                                        checkPurchase: () async {
                                          logFirebaseEvent(
                                              'USER_LISTS_Container_h12orvko_CALLBACK');
                                          logFirebaseEvent('item_backend_call');

                                          await listViewItemRecord.reference
                                              .update(createItemRecordData(
                                            isPurchased: true,
                                          ));
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            StreamBuilder<List<ItemRecord>>(
                              stream: queryItemRecord(
                                queryBuilder: (itemRecord) => itemRecord
                                    .where(
                                      'user',
                                      isEqualTo: currentUserReference,
                                    )
                                    .where(
                                      'isPurchased',
                                      isEqualTo: true,
                                    ),
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
                                List<ItemRecord> listViewItemRecordList =
                                    snapshot.data!;

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewItemRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewItemRecord =
                                        listViewItemRecordList[listViewIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: ItemWidget(
                                        key: Key(
                                            'Key5zt_${listViewIndex}_of_${listViewItemRecordList.length}'),
                                        item: listViewItemRecord,
                                        checkPurchase: () async {
                                          logFirebaseEvent(
                                              'USER_LISTS_Container_5ztxf6om_CALLBACK');
                                          logFirebaseEvent('item_backend_call');

                                          await listViewItemRecord.reference
                                              .update(createItemRecordData(
                                            isPurchased: false,
                                          ));
                                        },
                                      ),
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
                      borderColor: FlutterFlowTheme.of(context).darkGreen,
                      borderRadius: 24.0,
                      borderWidth: 3.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).white,
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
                              onTap: () => FocusScope.of(context).unfocus(),
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
