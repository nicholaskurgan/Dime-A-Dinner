import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'add_item_pop_up_model.dart';
export 'add_item_pop_up_model.dart';

class AddItemPopUpWidget extends StatefulWidget {
  const AddItemPopUpWidget({super.key});

  @override
  State<AddItemPopUpWidget> createState() => _AddItemPopUpWidgetState();
}

class _AddItemPopUpWidgetState extends State<AddItemPopUpWidget> {
  late AddItemPopUpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddItemPopUpModel());

    _model.itemTitleTextController ??= TextEditingController();
    _model.itemTitleFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        height: 450.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).white,
          borderRadius: BorderRadius.circular(22.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(1.0, -1.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).black,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'ADD_ITEM_POP_UP_COMP_close_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_bottom_sheet');
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('ADD_ITEM_POP_UP_Stack_oxkoqqus_ON_TAP');
                    logFirebaseEvent('Stack_upload_media_to_firebase');
                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                      maxWidth: 68.00,
                      allowPhoto: true,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      safeSetState(() => _model.isDataUploading = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];

                      var downloadUrls = <String>[];
                      try {
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                            .toList();

                        downloadUrls = (await Future.wait(
                          selectedMedia.map(
                            (m) async =>
                                await uploadData(m.storagePath, m.bytes),
                          ),
                        ))
                            .where((u) => u != null)
                            .map((u) => u!)
                            .toList();
                      } finally {
                        _model.isDataUploading = false;
                      }
                      if (selectedUploadedFiles.length ==
                              selectedMedia.length &&
                          downloadUrls.length == selectedMedia.length) {
                        safeSetState(() {
                          _model.uploadedLocalFile =
                              selectedUploadedFiles.first;
                          _model.uploadedFileUrl = downloadUrls.first;
                        });
                      } else {
                        safeSetState(() {});
                        return;
                      }
                    }
                  },
                  child: Stack(
                    alignment: const AlignmentDirectional(1.0, 1.0),
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 8.0),
                        child: Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                _model.uploadedFileUrl,
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(22.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primaryText,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 37.0,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        icon: Icon(
                          Icons.add,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 21.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: _model.itemTitleTextController,
                  focusNode: _model.itemTitleFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Item Title',
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Lexend',
                              letterSpacing: 0.0,
                            ),
                    hintText: 'Title...',
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Lexend',
                              color: FlutterFlowTheme.of(context).orange,
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).orange,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).burgundy,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).white,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 45.0, 0.0, 0.0),
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).black,
                        letterSpacing: 0.0,
                      ),
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator: _model.itemTitleTextControllerValidator
                      .asValidator(context),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'ADD_ITEM_POP_UP_COMP_groceryAdd_ON_TAP');
                          logFirebaseEvent('groceryAdd_backend_call');

                          var itemRecordReference = ItemRecord.collection.doc();
                          await itemRecordReference.set(createItemRecordData(
                            title: _model.itemTitleTextController.text,
                            user: currentUserReference,
                            itemImage: _model.uploadedFileUrl,
                          ));
                          _model.newGroceryItem =
                              ItemRecord.getDocumentFromData(
                                  createItemRecordData(
                                    title: _model.itemTitleTextController.text,
                                    user: currentUserReference,
                                    itemImage: _model.uploadedFileUrl,
                                  ),
                                  itemRecordReference);
                          logFirebaseEvent('groceryAdd_backend_call');

                          await currentUserReference!.update({
                            ...mapToFirestore(
                              {
                                'groceryList': FieldValue.arrayUnion(
                                    [_model.newGroceryItem?.reference]),
                              },
                            ),
                          });
                          logFirebaseEvent('groceryAdd_bottom_sheet');
                          Navigator.pop(context);

                          safeSetState(() {});
                        },
                        text: 'Add to GroceryList',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconAlignment: IconAlignment.start,
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).lightGreen,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                fontFamily: 'Lexend Exa',
                                color: FlutterFlowTheme.of(context).darkGreen,
                                letterSpacing: 0.0,
                                lineHeight: 1.0,
                              ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'ADD_ITEM_POP_UP_COMP_pantryAdd_ON_TAP');
                        logFirebaseEvent('pantryAdd_backend_call');

                        var itemRecordReference = ItemRecord.collection.doc();
                        await itemRecordReference.set(createItemRecordData(
                          title: _model.itemTitleTextController.text,
                          user: currentUserReference,
                          itemImage: _model.uploadedFileUrl,
                        ));
                        _model.newPantryItem = ItemRecord.getDocumentFromData(
                            createItemRecordData(
                              title: _model.itemTitleTextController.text,
                              user: currentUserReference,
                              itemImage: _model.uploadedFileUrl,
                            ),
                            itemRecordReference);
                        logFirebaseEvent('pantryAdd_backend_call');

                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'pantryList': FieldValue.arrayUnion(
                                  [_model.newPantryItem?.reference]),
                            },
                          ),
                        });
                        logFirebaseEvent('pantryAdd_bottom_sheet');
                        Navigator.pop(context);

                        safeSetState(() {});
                      },
                      text: 'Add to Pantry List',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).orange,
                        textStyle:
                            FlutterFlowTheme.of(context).titleLarge.override(
                                  fontFamily: 'Lexend Exa',
                                  color: FlutterFlowTheme.of(context).beige,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                ],
              ),
            ].divide(const SizedBox(height: 15.0)).around(const SizedBox(height: 15.0)),
          ),
        ),
      ),
    );
  }
}
