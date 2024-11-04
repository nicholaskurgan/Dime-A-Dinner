import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'item_model.dart';
export 'item_model.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({
    super.key,
    required this.item,
    required this.checkPurchase,
  });

  final ItemRecord? item;
  final Future Function()? checkPurchase;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  late ItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24.0),
          bottomRight: Radius.circular(24.0),
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        border: Border.all(
          color: FlutterFlowTheme.of(context).orange,
          width: 3.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 8.0),
              child: Text(
                valueOrDefault<String>(
                  widget.item?.title,
                  'title',
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Merriweather Sans',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ),
          Flexible(
            child: Align(
              alignment: const AlignmentDirectional(1.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                child: Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    unselectedWidgetColor:
                        FlutterFlowTheme.of(context).darkGreen,
                  ),
                  child: Checkbox(
                    value: _model.checkboxValue ??= widget.item!.isPurchased,
                    onChanged: (newValue) async {
                      safeSetState(() => _model.checkboxValue = newValue!);
                      if (newValue!) {
                        logFirebaseEvent(
                            'ITEM_COMP_Checkbox_m9ike9n0_ON_TOGGLE_ON');
                        logFirebaseEvent('Checkbox_execute_callback');
                        await widget.checkPurchase?.call();
                      } else {
                        logFirebaseEvent(
                            'ITEM_Checkbox_m9ike9n0_ON_TOGGLE_OFF');
                        logFirebaseEvent('Checkbox_execute_callback');
                        await widget.checkPurchase?.call();
                      }
                    },
                    side: BorderSide(
                      width: 2,
                      color: FlutterFlowTheme.of(context).darkGreen,
                    ),
                    activeColor: FlutterFlowTheme.of(context).lightGreen,
                    checkColor: FlutterFlowTheme.of(context).darkGreen,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
