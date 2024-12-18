// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class InstructionsStruct extends FFFirebaseStruct {
  InstructionsStruct({
    String? step,
    int? number,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _step = step,
        _number = number,
        super(firestoreUtilData);

  // "step" field.
  String? _step;
  String get step => _step ?? '';
  set step(String? val) => _step = val;

  bool hasStep() => _step != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;

  void incrementNumber(int amount) => number = number + amount;

  bool hasNumber() => _number != null;

  static InstructionsStruct fromMap(Map<String, dynamic> data) =>
      InstructionsStruct(
        step: data['step'] as String?,
        number: castToType<int>(data['number']),
      );

  static InstructionsStruct? maybeFromMap(dynamic data) => data is Map
      ? InstructionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'step': _step,
        'number': _number,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'step': serializeParam(
          _step,
          ParamType.String,
        ),
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
      }.withoutNulls;

  static InstructionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      InstructionsStruct(
        step: deserializeParam(
          data['step'],
          ParamType.String,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'InstructionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InstructionsStruct &&
        step == other.step &&
        number == other.number;
  }

  @override
  int get hashCode => const ListEquality().hash([step, number]);
}

InstructionsStruct createInstructionsStruct({
  String? step,
  int? number,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InstructionsStruct(
      step: step,
      number: number,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InstructionsStruct? updateInstructionsStruct(
  InstructionsStruct? instructions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    instructions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInstructionsStructData(
  Map<String, dynamic> firestoreData,
  InstructionsStruct? instructions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (instructions == null) {
    return;
  }
  if (instructions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && instructions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final instructionsData =
      getInstructionsFirestoreData(instructions, forFieldValue);
  final nestedData =
      instructionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = instructions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInstructionsFirestoreData(
  InstructionsStruct? instructions, [
  bool forFieldValue = false,
]) {
  if (instructions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(instructions.toMap());

  // Add any Firestore field values
  instructions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInstructionsListFirestoreData(
  List<InstructionsStruct>? instructionss,
) =>
    instructionss?.map((e) => getInstructionsFirestoreData(e, true)).toList() ??
    [];
