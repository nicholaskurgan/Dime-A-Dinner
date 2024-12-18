import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemRecord extends FirestoreRecord {
  ItemRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "itemImage" field.
  String? _itemImage;
  String get itemImage => _itemImage ?? '';
  bool hasItemImage() => _itemImage != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _details = snapshotData['details'] as String?;
    _itemImage = snapshotData['itemImage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('item');

  static Stream<ItemRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemRecord.fromSnapshot(s));

  static Future<ItemRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemRecord.fromSnapshot(s));

  static ItemRecord fromSnapshot(DocumentSnapshot snapshot) => ItemRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemRecordData({
  DocumentReference? user,
  String? title,
  double? price,
  String? details,
  String? itemImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'title': title,
      'price': price,
      'details': details,
      'itemImage': itemImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemRecordDocumentEquality implements Equality<ItemRecord> {
  const ItemRecordDocumentEquality();

  @override
  bool equals(ItemRecord? e1, ItemRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.title == e2?.title &&
        e1?.price == e2?.price &&
        e1?.details == e2?.details &&
        e1?.itemImage == e2?.itemImage;
  }

  @override
  int hash(ItemRecord? e) => const ListEquality()
      .hash([e?.user, e?.title, e?.price, e?.details, e?.itemImage]);

  @override
  bool isValidKey(Object? o) => o is ItemRecord;
}
