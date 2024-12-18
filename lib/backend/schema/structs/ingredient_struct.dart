// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class IngredientStruct extends FFFirebaseStruct {
  IngredientStruct({
    String? name,
    int? id,
    String? image,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _id = id,
        _image = image,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  static IngredientStruct fromMap(Map<String, dynamic> data) =>
      IngredientStruct(
        name: data['name'] as String?,
        id: castToType<int>(data['id']),
        image: data['image'] as String?,
      );

  static IngredientStruct? maybeFromMap(dynamic data) => data is Map
      ? IngredientStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'id': _id,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static IngredientStruct fromSerializableMap(Map<String, dynamic> data) =>
      IngredientStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'IngredientStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IngredientStruct &&
        name == other.name &&
        id == other.id &&
        image == other.image;
  }

  @override
  int get hashCode => const ListEquality().hash([name, id, image]);
}

IngredientStruct createIngredientStruct({
  String? name,
  int? id,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IngredientStruct(
      name: name,
      id: id,
      image: image,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IngredientStruct? updateIngredientStruct(
  IngredientStruct? ingredient, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ingredient
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIngredientStructData(
  Map<String, dynamic> firestoreData,
  IngredientStruct? ingredient,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ingredient == null) {
    return;
  }
  if (ingredient.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ingredient.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ingredientData = getIngredientFirestoreData(ingredient, forFieldValue);
  final nestedData = ingredientData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ingredient.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIngredientFirestoreData(
  IngredientStruct? ingredient, [
  bool forFieldValue = false,
]) {
  if (ingredient == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ingredient.toMap());

  // Add any Firestore field values
  ingredient.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIngredientListFirestoreData(
  List<IngredientStruct>? ingredients,
) =>
    ingredients?.map((e) => getIngredientFirestoreData(e, true)).toList() ?? [];
