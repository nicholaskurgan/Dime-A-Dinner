import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "metric_recipe_counter" field.
  int? _metricRecipeCounter;
  int get metricRecipeCounter => _metricRecipeCounter ?? 0;
  bool hasMetricRecipeCounter() => _metricRecipeCounter != null;

  // "login_count" field.
  int? _loginCount;
  int get loginCount => _loginCount ?? 0;
  bool hasLoginCount() => _loginCount != null;

  // "survey_taken" field.
  bool? _surveyTaken;
  bool get surveyTaken => _surveyTaken ?? false;
  bool hasSurveyTaken() => _surveyTaken != null;

  // "saved_recipes" field.
  List<String>? _savedRecipes;
  List<String> get savedRecipes => _savedRecipes ?? const [];
  bool hasSavedRecipes() => _savedRecipes != null;

  // "diet" field.
  String? _diet;
  String get diet => _diet ?? '';
  bool hasDiet() => _diet != null;

  // "groceryList" field.
  List<DocumentReference>? _groceryList;
  List<DocumentReference> get groceryList => _groceryList ?? const [];
  bool hasGroceryList() => _groceryList != null;

  // "pantryList" field.
  List<DocumentReference>? _pantryList;
  List<DocumentReference> get pantryList => _pantryList ?? const [];
  bool hasPantryList() => _pantryList != null;

  // "intolerances" field.
  List<String>? _intolerances;
  List<String> get intolerances => _intolerances ?? const [];
  bool hasIntolerances() => _intolerances != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _metricRecipeCounter =
        castToType<int>(snapshotData['metric_recipe_counter']);
    _loginCount = castToType<int>(snapshotData['login_count']);
    _surveyTaken = snapshotData['survey_taken'] as bool?;
    _savedRecipes = getDataList(snapshotData['saved_recipes']);
    _diet = snapshotData['diet'] as String?;
    _groceryList = getDataList(snapshotData['groceryList']);
    _pantryList = getDataList(snapshotData['pantryList']);
    _intolerances = getDataList(snapshotData['intolerances']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  int? metricRecipeCounter,
  int? loginCount,
  bool? surveyTaken,
  String? diet,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'metric_recipe_counter': metricRecipeCounter,
      'login_count': loginCount,
      'survey_taken': surveyTaken,
      'diet': diet,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.metricRecipeCounter == e2?.metricRecipeCounter &&
        e1?.loginCount == e2?.loginCount &&
        e1?.surveyTaken == e2?.surveyTaken &&
        listEquality.equals(e1?.savedRecipes, e2?.savedRecipes) &&
        e1?.diet == e2?.diet &&
        listEquality.equals(e1?.groceryList, e2?.groceryList) &&
        listEquality.equals(e1?.pantryList, e2?.pantryList) &&
        listEquality.equals(e1?.intolerances, e2?.intolerances);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.metricRecipeCounter,
        e?.loginCount,
        e?.surveyTaken,
        e?.savedRecipes,
        e?.diet,
        e?.groceryList,
        e?.pantryList,
        e?.intolerances
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
