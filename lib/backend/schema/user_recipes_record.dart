import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecipesRecord extends FirestoreRecord {
  UserRecipesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _photo = snapshotData['photo'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_recipes');

  static Stream<UserRecipesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecipesRecord.fromSnapshot(s));

  static Future<UserRecipesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecipesRecord.fromSnapshot(s));

  static UserRecipesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserRecipesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecipesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecipesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecipesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecipesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecipesRecordData({
  String? title,
  String? description,
  String? photo,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'photo': photo,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecipesRecordDocumentEquality implements Equality<UserRecipesRecord> {
  const UserRecipesRecordDocumentEquality();

  @override
  bool equals(UserRecipesRecord? e1, UserRecipesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.photo == e2?.photo &&
        e1?.user == e2?.user;
  }

  @override
  int hash(UserRecipesRecord? e) =>
      const ListEquality().hash([e?.title, e?.description, e?.photo, e?.user]);

  @override
  bool isValidKey(Object? o) => o is UserRecipesRecord;
}
