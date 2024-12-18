// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SpoonResponseDataStruct extends FFFirebaseStruct {
  SpoonResponseDataStruct({
    String? title,
    String? image,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _image = image,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  static SpoonResponseDataStruct fromMap(Map<String, dynamic> data) =>
      SpoonResponseDataStruct(
        title: data['title'] as String?,
        image: data['image'] as String?,
      );

  static SpoonResponseDataStruct? maybeFromMap(dynamic data) => data is Map
      ? SpoonResponseDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static SpoonResponseDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SpoonResponseDataStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SpoonResponseDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SpoonResponseDataStruct &&
        title == other.title &&
        image == other.image;
  }

  @override
  int get hashCode => const ListEquality().hash([title, image]);
}

SpoonResponseDataStruct createSpoonResponseDataStruct({
  String? title,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SpoonResponseDataStruct(
      title: title,
      image: image,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SpoonResponseDataStruct? updateSpoonResponseDataStruct(
  SpoonResponseDataStruct? spoonResponseData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    spoonResponseData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSpoonResponseDataStructData(
  Map<String, dynamic> firestoreData,
  SpoonResponseDataStruct? spoonResponseData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (spoonResponseData == null) {
    return;
  }
  if (spoonResponseData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && spoonResponseData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final spoonResponseDataData =
      getSpoonResponseDataFirestoreData(spoonResponseData, forFieldValue);
  final nestedData =
      spoonResponseDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = spoonResponseData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSpoonResponseDataFirestoreData(
  SpoonResponseDataStruct? spoonResponseData, [
  bool forFieldValue = false,
]) {
  if (spoonResponseData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(spoonResponseData.toMap());

  // Add any Firestore field values
  spoonResponseData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSpoonResponseDataListFirestoreData(
  List<SpoonResponseDataStruct>? spoonResponseDatas,
) =>
    spoonResponseDatas
        ?.map((e) => getSpoonResponseDataFirestoreData(e, true))
        .toList() ??
    [];
