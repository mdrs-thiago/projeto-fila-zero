import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Cardapio2Record extends FirestoreRecord {
  Cardapio2Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Ativo" field.
  bool? _ativo;
  bool get ativo => _ativo ?? false;
  bool hasAtivo() => _ativo != null;

  // "Acompanhamento" field.
  List<String>? _acompanhamento;
  List<String> get acompanhamento => _acompanhamento ?? const [];
  bool hasAcompanhamento() => _acompanhamento != null;

  // "Guarnicao" field.
  List<String>? _guarnicao;
  List<String> get guarnicao => _guarnicao ?? const [];
  bool hasGuarnicao() => _guarnicao != null;

  // "PratoPrincipal" field.
  List<String>? _pratoPrincipal;
  List<String> get pratoPrincipal => _pratoPrincipal ?? const [];
  bool hasPratoPrincipal() => _pratoPrincipal != null;

  // "Salada" field.
  List<String>? _salada;
  List<String> get salada => _salada ?? const [];
  bool hasSalada() => _salada != null;

  // "Sobremesa" field.
  List<String>? _sobremesa;
  List<String> get sobremesa => _sobremesa ?? const [];
  bool hasSobremesa() => _sobremesa != null;

  // "Feijao" field.
  bool? _feijao;
  bool get feijao => _feijao ?? false;
  bool hasFeijao() => _feijao != null;

  // "Data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  void _initializeFields() {
    _ativo = snapshotData['Ativo'] as bool?;
    _acompanhamento = getDataList(snapshotData['Acompanhamento']);
    _guarnicao = getDataList(snapshotData['Guarnicao']);
    _pratoPrincipal = getDataList(snapshotData['PratoPrincipal']);
    _salada = getDataList(snapshotData['Salada']);
    _sobremesa = getDataList(snapshotData['Sobremesa']);
    _feijao = snapshotData['Feijao'] as bool?;
    _data = snapshotData['Data'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Cardapio2');

  static Stream<Cardapio2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Cardapio2Record.fromSnapshot(s));

  static Future<Cardapio2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Cardapio2Record.fromSnapshot(s));

  static Cardapio2Record fromSnapshot(DocumentSnapshot snapshot) =>
      Cardapio2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Cardapio2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Cardapio2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Cardapio2Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Cardapio2Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCardapio2RecordData({
  bool? ativo,
  bool? feijao,
  DateTime? data,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Ativo': ativo,
      'Feijao': feijao,
      'Data': data,
    }.withoutNulls,
  );

  return firestoreData;
}

class Cardapio2RecordDocumentEquality implements Equality<Cardapio2Record> {
  const Cardapio2RecordDocumentEquality();

  @override
  bool equals(Cardapio2Record? e1, Cardapio2Record? e2) {
    const listEquality = ListEquality();
    return e1?.ativo == e2?.ativo &&
        listEquality.equals(e1?.acompanhamento, e2?.acompanhamento) &&
        listEquality.equals(e1?.guarnicao, e2?.guarnicao) &&
        listEquality.equals(e1?.pratoPrincipal, e2?.pratoPrincipal) &&
        listEquality.equals(e1?.salada, e2?.salada) &&
        listEquality.equals(e1?.sobremesa, e2?.sobremesa) &&
        e1?.feijao == e2?.feijao &&
        e1?.data == e2?.data;
  }

  @override
  int hash(Cardapio2Record? e) => const ListEquality().hash([
        e?.ativo,
        e?.acompanhamento,
        e?.guarnicao,
        e?.pratoPrincipal,
        e?.salada,
        e?.sobremesa,
        e?.feijao,
        e?.data
      ]);

  @override
  bool isValidKey(Object? o) => o is Cardapio2Record;
}
