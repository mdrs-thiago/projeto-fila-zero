import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CardapioRecord extends FirestoreRecord {
  CardapioRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Ativo" field.
  bool? _ativo;
  bool get ativo => _ativo ?? false;
  bool hasAtivo() => _ativo != null;

  // "PratoPrincipal" field.
  String? _pratoPrincipal;
  String get pratoPrincipal => _pratoPrincipal ?? '';
  bool hasPratoPrincipal() => _pratoPrincipal != null;

  // "PratoVegetariano" field.
  String? _pratoVegetariano;
  String get pratoVegetariano => _pratoVegetariano ?? '';
  bool hasPratoVegetariano() => _pratoVegetariano != null;

  // "Guarnicao" field.
  String? _guarnicao;
  String get guarnicao => _guarnicao ?? '';
  bool hasGuarnicao() => _guarnicao != null;

  // "Saladas" field.
  List<String>? _saladas;
  List<String> get saladas => _saladas ?? const [];
  bool hasSaladas() => _saladas != null;

  // "Sobremesa" field.
  List<String>? _sobremesa;
  List<String> get sobremesa => _sobremesa ?? const [];
  bool hasSobremesa() => _sobremesa != null;

  void _initializeFields() {
    _ativo = snapshotData['Ativo'] as bool?;
    _pratoPrincipal = snapshotData['PratoPrincipal'] as String?;
    _pratoVegetariano = snapshotData['PratoVegetariano'] as String?;
    _guarnicao = snapshotData['Guarnicao'] as String?;
    _saladas = getDataList(snapshotData['Saladas']);
    _sobremesa = getDataList(snapshotData['Sobremesa']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Cardapio');

  static Stream<CardapioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CardapioRecord.fromSnapshot(s));

  static Future<CardapioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CardapioRecord.fromSnapshot(s));

  static CardapioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CardapioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CardapioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CardapioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CardapioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CardapioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCardapioRecordData({
  bool? ativo,
  String? pratoPrincipal,
  String? pratoVegetariano,
  String? guarnicao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Ativo': ativo,
      'PratoPrincipal': pratoPrincipal,
      'PratoVegetariano': pratoVegetariano,
      'Guarnicao': guarnicao,
    }.withoutNulls,
  );

  return firestoreData;
}

class CardapioRecordDocumentEquality implements Equality<CardapioRecord> {
  const CardapioRecordDocumentEquality();

  @override
  bool equals(CardapioRecord? e1, CardapioRecord? e2) {
    const listEquality = ListEquality();
    return e1?.ativo == e2?.ativo &&
        e1?.pratoPrincipal == e2?.pratoPrincipal &&
        e1?.pratoVegetariano == e2?.pratoVegetariano &&
        e1?.guarnicao == e2?.guarnicao &&
        listEquality.equals(e1?.saladas, e2?.saladas) &&
        listEquality.equals(e1?.sobremesa, e2?.sobremesa);
  }

  @override
  int hash(CardapioRecord? e) => const ListEquality().hash([
        e?.ativo,
        e?.pratoPrincipal,
        e?.pratoVegetariano,
        e?.guarnicao,
        e?.saladas,
        e?.sobremesa
      ]);

  @override
  bool isValidKey(Object? o) => o is CardapioRecord;
}
