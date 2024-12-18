import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SpoonCall {
  static Future<ApiCallResponse> call({
    String? searchQuery = 'potato',
    String? dietRestriction = 'carnivore',
    int? dispAmt = 3,
    String? apiKey = 'a4fa3567a7204a88a38381907a20e693',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'spoon',
      apiUrl: 'https://api.spoonacular.com/recipes/complexSearch',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'includeIngredients': searchQuery,
        'diet': dietRestriction,
        'number': dispAmt,
        'addRecipeInformation': true,
        'apiKey': apiKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? image(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].image''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GetRecipeByNameCall {
  static Future<ApiCallResponse> call({
    String? titleMatch = '',
    String? apiKey = '62ab3fd184d1470cbdac5fcf87dd6320',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getRecipeByName',
      apiUrl: 'https://api.spoonacular.com/recipes/complexSearch',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'titleMatch': titleMatch,
        'addRecipeInformation': true,
        'addRecipeInstructions': true,
        'apiKey': apiKey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].title''',
      ));
  static String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].image''',
      ));
  static String? summary(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[0].summary''',
      ));
  static int? healthScore(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results[0].healthScore''',
      ));
  static double? pricePerServing(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.results[0].pricePerServing''',
      ));
  static int? time(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results[0].readyInMinutes''',
      ));
  static int? servings(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results[0].servings''',
      ));
  static List<String>? stepsText(dynamic response) => (getJsonField(
        response,
        r'''$.results[0].analyzedInstructions[:].steps[:].step''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? ingredients(dynamic response) => getJsonField(
        response,
        r'''$.results[0].analyzedInstructions[:].steps[:].ingredients[:]''',
        true,
      ) as List?;
  static List? result(dynamic response) => getJsonField(
        response,
        r'''$.results[0]''',
        true,
      ) as List?;
  static List? steps(dynamic response) => getJsonField(
        response,
        r'''$.results[:].analyzedInstructions[:].steps[:]''',
        true,
      ) as List?;
  static int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results[0].id''',
      ));
}

class GetImagesCall {
  static Future<ApiCallResponse> call({
    String? q = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getImages',
      apiUrl: 'https://pixabay.com/api/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': "47514918-91c6ff7a54988a3bb46319846",
        'q': q,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? pageURL(dynamic response) => (getJsonField(
        response,
        r'''$.hits[:].pageURL''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? imageURL(dynamic response) => (getJsonField(
        response,
        r'''$.hits[:].previewURL''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetIngredientsQuantityCall {
  static Future<ApiCallResponse> call({
    int? id,
    String? aPIkey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getIngredientsQuantity',
      apiUrl:
          'https://api.spoonacular.com/recipes/$id/priceBreakdownWidget.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'apiKey': aPIkey,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? ingredients(dynamic response) => getJsonField(
        response,
        r'''$.ingredients''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
