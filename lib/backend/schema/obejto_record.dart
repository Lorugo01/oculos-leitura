import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ObejtoRecord extends FirestoreRecord {
  ObejtoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "Item" field.
  String? _item;
  String get item => _item ?? '';
  bool hasItem() => _item != null;

  void _initializeFields() {
    _img = snapshotData['Img'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _item = snapshotData['Item'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Obejto');

  static Stream<ObejtoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ObejtoRecord.fromSnapshot(s));

  static Future<ObejtoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ObejtoRecord.fromSnapshot(s));

  static ObejtoRecord fromSnapshot(DocumentSnapshot snapshot) => ObejtoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ObejtoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ObejtoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ObejtoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ObejtoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createObejtoRecordData({
  String? img,
  String? descricao,
  String? item,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Img': img,
      'descricao': descricao,
      'Item': item,
    }.withoutNulls,
  );

  return firestoreData;
}

class ObejtoRecordDocumentEquality implements Equality<ObejtoRecord> {
  const ObejtoRecordDocumentEquality();

  @override
  bool equals(ObejtoRecord? e1, ObejtoRecord? e2) {
    return e1?.img == e2?.img &&
        e1?.descricao == e2?.descricao &&
        e1?.item == e2?.item;
  }

  @override
  int hash(ObejtoRecord? e) =>
      const ListEquality().hash([e?.img, e?.descricao, e?.item]);

  @override
  bool isValidKey(Object? o) => o is ObejtoRecord;
}
