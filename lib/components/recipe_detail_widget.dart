import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'recipe_detail_model.dart';
export 'recipe_detail_model.dart';

class RecipeDetailWidget extends StatefulWidget {
  const RecipeDetailWidget({
    super.key,
    required this.recipeName,
  });

  final String? recipeName;

  @override
  State<RecipeDetailWidget> createState() => _RecipeDetailWidgetState();
}

class _RecipeDetailWidgetState extends State<RecipeDetailWidget> {
  late RecipeDetailModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecipeDetailModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: GetRecipeByNameCall.call(
        titleMatch: widget.recipeName,
        apiKey: FFAppState().spoonApiKey,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        final containerGetRecipeByNameResponse = snapshot.data!;

        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).white,
            borderRadius: BorderRadius.circular(21.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                      child: Image.network(
                        GetRecipeByNameCall.image(
                          containerGetRecipeByNameResponse.jsonBody,
                        )!,
                        width: double.infinity,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 26.0, 24.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'RECIPE_DETAIL_COMP_Icon_clavczhq_ON_TAP');
                            logFirebaseEvent('Icon_bottom_sheet');
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            color: FlutterFlowTheme.of(context).black,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(23.0, 0.0, 23.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  valueOrDefault<String>(
                                    GetRecipeByNameCall.title(
                                      containerGetRecipeByNameResponse.jsonBody,
                                    ),
                                    'default title',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        fontFamily: 'Merriweather Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete_outline,
                                    color:
                                        FlutterFlowTheme.of(context).burgundy,
                                    size: 24.0,
                                  ),
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValue ??= true,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.checkboxValue = newValue!);
                                      },
                                      side: BorderSide(
                                        width: 2,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: FlutterFlowTheme.of(context)
                                          .lightGreen,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 10.0)),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer_sharp,
                              color: FlutterFlowTheme.of(context).burgundy,
                              size: 24.0,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    GetRecipeByNameCall.time(
                                      containerGetRecipeByNameResponse.jsonBody,
                                    )?.toString(),
                                    '30',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Merriweather Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  'min',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Merriweather Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 3.0)),
                            ),
                            Icon(
                              Icons.people,
                              color: FlutterFlowTheme.of(context).burgundy,
                              size: 24.0,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    GetRecipeByNameCall.servings(
                                      containerGetRecipeByNameResponse.jsonBody,
                                    )?.toString(),
                                    '2',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Merriweather Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  'servings',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Merriweather Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 3.0)),
                            ),
                          ].divide(const SizedBox(width: 10.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.monetization_on_outlined,
                              color: FlutterFlowTheme.of(context).burgundy,
                              size: 24.0,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    functions.convertIntoDollar(
                                        GetRecipeByNameCall.pricePerServing(
                                      containerGetRecipeByNameResponse.jsonBody,
                                    )?.toString()),
                                    '300',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Merriweather Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  '\$/serving',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Merriweather Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 3.0)),
                            ),
                            Icon(
                              Icons.score_outlined,
                              color: FlutterFlowTheme.of(context).burgundy,
                              size: 24.0,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    GetRecipeByNameCall.healthScore(
                                      containerGetRecipeByNameResponse.jsonBody,
                                    )?.toString(),
                                    '30',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Merriweather Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  'healthscore points',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Merriweather Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 3.0)),
                            ),
                          ].divide(const SizedBox(width: 10.0)),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            'Ingredients',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Lexend Exa',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        FutureBuilder<ApiCallResponse>(
                          future: GetIngredientsQuantityCall.call(
                            id: GetRecipeByNameCall.id(
                              containerGetRecipeByNameResponse.jsonBody,
                            ),
                            aPIkey: FFAppState().spoonApiKey,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final gridViewGetIngredientsQuantityResponse =
                                snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final ingredients = functions
                                    .removeDuplicateIngredients(
                                        GetRecipeByNameCall.ingredients(
                                      containerGetRecipeByNameResponse.jsonBody,
                                    )!
                                            .toList())
                                    .toList();

                                return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 1.0,
                                    childAspectRatio: 1.0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: ingredients.length,
                                  itemBuilder: (context, ingredientsIndex) {
                                    final ingredientsItem =
                                        ingredients[ingredientsIndex];
                                    return Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            FutureBuilder<ApiCallResponse>(
                                              future: GetImagesCall.call(
                                                q: functions.trunIntoURLEncoded(
                                                    IngredientStruct
                                                            .maybeFromMap(
                                                                ingredientsItem)
                                                        ?.image),
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final imageGetImagesResponse =
                                                    snapshot.data!;

                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    functions.buildAPIImage(
                                                        IngredientStruct
                                                                .maybeFromMap(
                                                                    ingredientsItem)
                                                            ?.image)!,
                                                    width: 80.0,
                                                    height: 80.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              },
                                            ),
                                            Flexible(
                                              child: Text(
                                                valueOrDefault<String>(
                                                  IngredientStruct.maybeFromMap(
                                                          ingredientsItem)
                                                      ?.name,
                                                  'ingredient name ghjyjukhijljghk',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Merriweather Sans',
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.0,
                                                        ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        functions
                                                            .getIngredientQuantity(
                                                                IngredientStruct
                                                                        .maybeFromMap(
                                                                            ingredientsItem)
                                                                    ?.name,
                                                                GetIngredientsQuantityCall
                                                                    .ingredients(
                                                                  gridViewGetIngredientsQuantityResponse
                                                                      .jsonBody,
                                                                )?.toList()),
                                                        '1',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Merriweather Sans',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        functions
                                                            .getIngredientUnit(
                                                                IngredientStruct
                                                                        .maybeFromMap(
                                                                            ingredientsItem)
                                                                    ?.name,
                                                                GetIngredientsQuantityCall
                                                                    .ingredients(
                                                                  gridViewGetIngredientsQuantityResponse
                                                                      .jsonBody,
                                                                )?.toList()),
                                                        'cups',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Merriweather Sans',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 5.0)),
                                              ),
                                            ),
                                          ]
                                              .divide(const SizedBox(height: 8.0))
                                              .around(const SizedBox(height: 8.0)),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            'Instructions',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Lexend Exa',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            final instructions = GetRecipeByNameCall.steps(
                                  containerGetRecipeByNameResponse.jsonBody,
                                )?.toList() ??
                                [];

                            return ListView.separated(
                              padding: const EdgeInsets.fromLTRB(
                                0,
                                0,
                                0,
                                10.0,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: instructions.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 10.0),
                              itemBuilder: (context, instructionsIndex) {
                                final instructionsItem =
                                    instructions[instructionsIndex];
                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          InstructionsStruct.maybeFromMap(
                                                  instructionsItem)
                                              ?.number
                                              .toString(),
                                          '1',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Lexend',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          valueOrDefault<String>(
                                            InstructionsStruct.maybeFromMap(
                                                    instructionsItem)
                                                ?.step,
                                            'step',
                                          ),
                                          textAlign: TextAlign.justify,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Merriweather Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 10.0)),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ].divide(const SizedBox(height: 20.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
