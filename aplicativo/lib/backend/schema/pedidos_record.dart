import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidosRecord extends FirestoreRecord {
  PedidosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "pedido" field.
  int? _pedido;
  int get pedido => _pedido ?? 0;
  bool hasPedido() => _pedido != null;

  // "salada" field.
  String? _salada;
  String get salada => _salada ?? '';
  bool hasSalada() => _salada != null;

  // "prato_principal" field.
  String? _pratoPrincipal;
  String get pratoPrincipal => _pratoPrincipal ?? '';
  bool hasPratoPrincipal() => _pratoPrincipal != null;

  // "guarnicao" field.
  String? _guarnicao;
  String get guarnicao => _guarnicao ?? '';
  bool hasGuarnicao() => _guarnicao != null;

  // "tipo_arroz" field.
  String? _tipoArroz;
  String get tipoArroz => _tipoArroz ?? '';
  bool hasTipoArroz() => _tipoArroz != null;

  // "feijao" field.
  String? _feijao;
  String get feijao => _feijao ?? '';
  bool hasFeijao() => _feijao != null;

  // "sobremesa" field.
  String? _sobremesa;
  String get sobremesa => _sobremesa ?? '';
  bool hasSobremesa() => _sobremesa != null;

  // "pedido_realizado" field.
  bool? _pedidoRealizado;
  bool get pedidoRealizado => _pedidoRealizado ?? false;
  bool hasPedidoRealizado() => _pedidoRealizado != null;

  // "time_realizado" field.
  DateTime? _timeRealizado;
  DateTime? get timeRealizado => _timeRealizado;
  bool hasTimeRealizado() => _timeRealizado != null;

  // "pedido_preparo" field.
  bool? _pedidoPreparo;
  bool get pedidoPreparo => _pedidoPreparo ?? false;
  bool hasPedidoPreparo() => _pedidoPreparo != null;

  // "time_preparo" field.
  DateTime? _timePreparo;
  DateTime? get timePreparo => _timePreparo;
  bool hasTimePreparo() => _timePreparo != null;

  // "pedido_pronto" field.
  bool? _pedidoPronto;
  bool get pedidoPronto => _pedidoPronto ?? false;
  bool hasPedidoPronto() => _pedidoPronto != null;

  // "time_pronto" field.
  DateTime? _timePronto;
  DateTime? get timePronto => _timePronto;
  bool hasTimePronto() => _timePronto != null;

  // "pedido_retirado" field.
  bool? _pedidoRetirado;
  bool get pedidoRetirado => _pedidoRetirado ?? false;
  bool hasPedidoRetirado() => _pedidoRetirado != null;

  // "time_retirado" field.
  DateTime? _timeRetirado;
  DateTime? get timeRetirado => _timeRetirado;
  bool hasTimeRetirado() => _timeRetirado != null;

  void _initializeFields() {
    _pedido = castToType<int>(snapshotData['pedido']);
    _salada = snapshotData['salada'] as String?;
    _pratoPrincipal = snapshotData['prato_principal'] as String?;
    _guarnicao = snapshotData['guarnicao'] as String?;
    _tipoArroz = snapshotData['tipo_arroz'] as String?;
    _feijao = snapshotData['feijao'] as String?;
    _sobremesa = snapshotData['sobremesa'] as String?;
    _pedidoRealizado = snapshotData['pedido_realizado'] as bool?;
    _timeRealizado = snapshotData['time_realizado'] as DateTime?;
    _pedidoPreparo = snapshotData['pedido_preparo'] as bool?;
    _timePreparo = snapshotData['time_preparo'] as DateTime?;
    _pedidoPronto = snapshotData['pedido_pronto'] as bool?;
    _timePronto = snapshotData['time_pronto'] as DateTime?;
    _pedidoRetirado = snapshotData['pedido_retirado'] as bool?;
    _timeRetirado = snapshotData['time_retirado'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pedidos');

  static Stream<PedidosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PedidosRecord.fromSnapshot(s));

  static Future<PedidosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PedidosRecord.fromSnapshot(s));

  static PedidosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PedidosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PedidosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PedidosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PedidosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PedidosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPedidosRecordData({
  int? pedido,
  String? salada,
  String? pratoPrincipal,
  String? guarnicao,
  String? tipoArroz,
  String? feijao,
  String? sobremesa,
  bool? pedidoRealizado,
  DateTime? timeRealizado,
  bool? pedidoPreparo,
  DateTime? timePreparo,
  bool? pedidoPronto,
  DateTime? timePronto,
  bool? pedidoRetirado,
  DateTime? timeRetirado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pedido': pedido,
      'salada': salada,
      'prato_principal': pratoPrincipal,
      'guarnicao': guarnicao,
      'tipo_arroz': tipoArroz,
      'feijao': feijao,
      'sobremesa': sobremesa,
      'pedido_realizado': pedidoRealizado,
      'time_realizado': timeRealizado,
      'pedido_preparo': pedidoPreparo,
      'time_preparo': timePreparo,
      'pedido_pronto': pedidoPronto,
      'time_pronto': timePronto,
      'pedido_retirado': pedidoRetirado,
      'time_retirado': timeRetirado,
    }.withoutNulls,
  );

  return firestoreData;
}

class PedidosRecordDocumentEquality implements Equality<PedidosRecord> {
  const PedidosRecordDocumentEquality();

  @override
  bool equals(PedidosRecord? e1, PedidosRecord? e2) {
    return e1?.pedido == e2?.pedido &&
        e1?.salada == e2?.salada &&
        e1?.pratoPrincipal == e2?.pratoPrincipal &&
        e1?.guarnicao == e2?.guarnicao &&
        e1?.tipoArroz == e2?.tipoArroz &&
        e1?.feijao == e2?.feijao &&
        e1?.sobremesa == e2?.sobremesa &&
        e1?.pedidoRealizado == e2?.pedidoRealizado &&
        e1?.timeRealizado == e2?.timeRealizado &&
        e1?.pedidoPreparo == e2?.pedidoPreparo &&
        e1?.timePreparo == e2?.timePreparo &&
        e1?.pedidoPronto == e2?.pedidoPronto &&
        e1?.timePronto == e2?.timePronto &&
        e1?.pedidoRetirado == e2?.pedidoRetirado &&
        e1?.timeRetirado == e2?.timeRetirado;
  }

  @override
  int hash(PedidosRecord? e) => const ListEquality().hash([
        e?.pedido,
        e?.salada,
        e?.pratoPrincipal,
        e?.guarnicao,
        e?.tipoArroz,
        e?.feijao,
        e?.sobremesa,
        e?.pedidoRealizado,
        e?.timeRealizado,
        e?.pedidoPreparo,
        e?.timePreparo,
        e?.pedidoPronto,
        e?.timePronto,
        e?.pedidoRetirado,
        e?.timeRetirado
      ]);

  @override
  bool isValidKey(Object? o) => o is PedidosRecord;
}
