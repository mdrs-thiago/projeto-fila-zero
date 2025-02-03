import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'acompanhar_pedido_model.dart';
export 'acompanhar_pedido_model.dart';

class AcompanharPedidoWidget extends StatefulWidget {
  const AcompanharPedidoWidget({
    super.key,
    required this.numPedido,
  });

  final int? numPedido;

  @override
  State<AcompanharPedidoWidget> createState() => _AcompanharPedidoWidgetState();
}

class _AcompanharPedidoWidgetState extends State<AcompanharPedidoWidget> {
  late AcompanharPedidoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AcompanharPedidoModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.8,
                  child: Align(
                    alignment: AlignmentDirectional(0.0, -2.55),
                    child: Container(
                      width: 430.0,
                      height: 430.0,
                      decoration: BoxDecoration(
                        color: Color(0x1F0072CE),
                        shape: BoxShape.circle,
                      ),
                      alignment: AlignmentDirectional(0.0, -2.0),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -0.68),
                  child: Text(
                    'Acompanhar Pedido',
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.black,
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -0.75),
                  child: Text(
                    'FilaZero',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Inter',
                          color: Colors.black,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -1.02),
                  child: Container(
                    width: 90.0,
                    height: 90.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/logomarca-uerj.png',
                        ).image,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: 0.8,
                  duration: 300.0.ms,
                  curve: Curves.easeIn,
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'EscolherOpcao',
                          queryParameters: {
                            'numPedido': serializeParam(
                              widget!.numPedido,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: 'Acessar Menu',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF0072CE),
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                if (widget!.numPedido != 0)
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(35.0, 220.0, 0.0, 0.0),
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF0072CE),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                if (widget!.numPedido != 0)
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(43.0, 239.0, 0.0, 0.0),
                      child: StreamBuilder<List<PedidosRecord>>(
                        stream: queryPedidosRecord(
                          queryBuilder: (pedidosRecord) => pedidosRecord.where(
                            'pedido_preparo',
                            isEqualTo: true,
                          ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<PedidosRecord> barra1PedidosRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final barra1PedidosRecord =
                              barra1PedidosRecordList.isNotEmpty
                                  ? barra1PedidosRecordList.first
                                  : null;

                          return Container(
                            width: 4.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF0072CE),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if (widget!.numPedido != 0)
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(35.0, 318.0, 0.0, 0.0),
                      child: StreamBuilder<List<PedidosRecord>>(
                        stream: queryPedidosRecord(
                          queryBuilder: (pedidosRecord) => pedidosRecord.where(
                            'pedido_preparo',
                            isEqualTo: true,
                          ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<PedidosRecord> pedidoPreparoPedidosRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final pedidoPreparoPedidosRecord =
                              pedidoPreparoPedidosRecordList.isNotEmpty
                                  ? pedidoPreparoPedidosRecordList.first
                                  : null;

                          return Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF0072CE),
                              shape: BoxShape.circle,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if (widget!.numPedido != 0)
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(43.0, 337.0, 0.0, 0.0),
                      child: StreamBuilder<List<PedidosRecord>>(
                        stream: queryPedidosRecord(
                          queryBuilder: (pedidosRecord) => pedidosRecord.where(
                            'pedido_pronto',
                            isEqualTo: true,
                          ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<PedidosRecord> barra2PedidosRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final barra2PedidosRecord =
                              barra2PedidosRecordList.isNotEmpty
                                  ? barra2PedidosRecordList.first
                                  : null;

                          return Container(
                            width: 4.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF0072CE),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if (widget!.numPedido != 0)
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(35.0, 416.0, 0.0, 0.0),
                      child: StreamBuilder<List<PedidosRecord>>(
                        stream: queryPedidosRecord(
                          queryBuilder: (pedidosRecord) => pedidosRecord.where(
                            'pedido_pronto',
                            isEqualTo: true,
                          ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<PedidosRecord> pedidoProntoPedidosRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final pedidoProntoPedidosRecord =
                              pedidoProntoPedidosRecordList.isNotEmpty
                                  ? pedidoProntoPedidosRecordList.first
                                  : null;

                          return Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF0072CE),
                              shape: BoxShape.circle,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if (widget!.numPedido != 0)
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(43.0, 435.0, 0.0, 0.0),
                      child: StreamBuilder<List<PedidosRecord>>(
                        stream: queryPedidosRecord(
                          queryBuilder: (pedidosRecord) => pedidosRecord.where(
                            'pedido_retirado',
                            isEqualTo: true,
                          ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<PedidosRecord> barra2PedidosRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final barra2PedidosRecord =
                              barra2PedidosRecordList.isNotEmpty
                                  ? barra2PedidosRecordList.first
                                  : null;

                          return Container(
                            width: 4.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF0072CE),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if (widget!.numPedido != 0)
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(35.0, 514.0, 0.0, 0.0),
                      child: StreamBuilder<List<PedidosRecord>>(
                        stream: queryPedidosRecord(
                          queryBuilder: (pedidosRecord) => pedidosRecord.where(
                            'pedido_retirado',
                            isEqualTo: true,
                          ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<PedidosRecord> pedidoRetiradaPedidosRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final pedidoRetiradaPedidosRecord =
                              pedidoRetiradaPedidosRecordList.isNotEmpty
                                  ? pedidoRetiradaPedidosRecordList.first
                                  : null;

                          return Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF0072CE),
                              shape: BoxShape.circle,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(60.0, 240.0, 0.0, 0.0),
                    child: StreamBuilder<List<PedidosRecord>>(
                      stream: queryPedidosRecord(
                        queryBuilder: (pedidosRecord) => pedidosRecord
                            .where(
                              'time_realizado',
                              isNotEqualTo: null,
                            )
                            .where(
                              'pedido',
                              isEqualTo: widget!.numPedido,
                            ),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<PedidosRecord> timePreparoPedidosRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final timePreparoPedidosRecord =
                            timePreparoPedidosRecordList.isNotEmpty
                                ? timePreparoPedidosRecordList.first
                                : null;

                        return Text(
                          dateTimeFormat("d/M/y hh:mm",
                              timePreparoPedidosRecord!.timeRealizado!),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Inter Tight',
                                color: Colors.black,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                              ),
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(60.0, 319.0, 0.0, 0.0),
                    child: StreamBuilder<List<PedidosRecord>>(
                      stream: queryPedidosRecord(
                        queryBuilder: (pedidosRecord) => pedidosRecord
                            .where(
                              'pedido_preparo',
                              isEqualTo: true,
                            )
                            .where(
                              'pedido',
                              isEqualTo: widget!.numPedido,
                            ),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<PedidosRecord> textPreparoPedidosRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final textPreparoPedidosRecord =
                            textPreparoPedidosRecordList.isNotEmpty
                                ? textPreparoPedidosRecordList.first
                                : null;

                        return Text(
                          'Pedido em preparo',
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Inter Tight',
                                color: Colors.black,
                                fontSize: 15.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(60.0, 417.0, 0.0, 0.0),
                    child: StreamBuilder<List<PedidosRecord>>(
                      stream: queryPedidosRecord(
                        queryBuilder: (pedidosRecord) => pedidosRecord
                            .where(
                              'pedido_pronto',
                              isEqualTo: true,
                            )
                            .where(
                              'pedido',
                              isEqualTo: widget!.numPedido,
                            ),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<PedidosRecord> textProntoPedidosRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final textProntoPedidosRecord =
                            textProntoPedidosRecordList.isNotEmpty
                                ? textProntoPedidosRecordList.first
                                : null;

                        return Text(
                          'Pedido pronto',
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Inter Tight',
                                color: Colors.black,
                                fontSize: 15.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(60.0, 515.0, 0.0, 0.0),
                    child: StreamBuilder<List<PedidosRecord>>(
                      stream: queryPedidosRecord(
                        queryBuilder: (pedidosRecord) => pedidosRecord
                            .where(
                              'pedido_retirado',
                              isEqualTo: true,
                            )
                            .where(
                              'pedido',
                              isEqualTo: widget!.numPedido,
                            ),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<PedidosRecord> textRetiradaPedidosRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final textRetiradaPedidosRecord =
                            textRetiradaPedidosRecordList.isNotEmpty
                                ? textRetiradaPedidosRecordList.first
                                : null;

                        return Text(
                          'Pedido retirado',
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Inter Tight',
                                color: Colors.black,
                                fontSize: 15.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                        );
                      },
                    ),
                  ),
                ),
                if (widget!.numPedido == 0)
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(60.0, 221.0, 0.0, 0.0),
                      child: Text(
                        'Nenhum pedido encontrado',
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                      ),
                    ),
                  ),
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(60.0, 338.0, 0.0, 0.0),
                    child: StreamBuilder<List<PedidosRecord>>(
                      stream: queryPedidosRecord(
                        queryBuilder: (pedidosRecord) => pedidosRecord
                            .where(
                              'pedido_preparo',
                              isEqualTo: true,
                            )
                            .where(
                              'pedido',
                              isEqualTo: widget!.numPedido,
                            ),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<PedidosRecord> timePreparoPedidosRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final timePreparoPedidosRecord =
                            timePreparoPedidosRecordList.isNotEmpty
                                ? timePreparoPedidosRecordList.first
                                : null;

                        return Text(
                          dateTimeFormat("d/M/y hh:mm",
                              timePreparoPedidosRecord!.timePreparo!),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Inter Tight',
                                color: Colors.black,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                              ),
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(60.0, 436.0, 0.0, 0.0),
                    child: StreamBuilder<List<PedidosRecord>>(
                      stream: queryPedidosRecord(
                        queryBuilder: (pedidosRecord) => pedidosRecord
                            .where(
                              'pedido_pronto',
                              isEqualTo: true,
                            )
                            .where(
                              'pedido',
                              isEqualTo: widget!.numPedido,
                            ),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<PedidosRecord> timePreparoPedidosRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final timePreparoPedidosRecord =
                            timePreparoPedidosRecordList.isNotEmpty
                                ? timePreparoPedidosRecordList.first
                                : null;

                        return Text(
                          dateTimeFormat("d/M/y hh:mm",
                              timePreparoPedidosRecord!.timePronto!),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Inter Tight',
                                color: Colors.black,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                              ),
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(60.0, 534.0, 0.0, 0.0),
                    child: StreamBuilder<List<PedidosRecord>>(
                      stream: queryPedidosRecord(
                        queryBuilder: (pedidosRecord) => pedidosRecord
                            .where(
                              'pedido_retirado',
                              isEqualTo: true,
                            )
                            .where(
                              'pedido',
                              isEqualTo: widget!.numPedido,
                            ),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<PedidosRecord> timePreparoPedidosRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final timePreparoPedidosRecord =
                            timePreparoPedidosRecordList.isNotEmpty
                                ? timePreparoPedidosRecordList.first
                                : null;

                        return Text(
                          dateTimeFormat("d/M/y hh:mm",
                              timePreparoPedidosRecord!.timeRetirado!),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Inter Tight',
                                color: Colors.black,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                              ),
                        );
                      },
                    ),
                  ),
                ),
                if (widget!.numPedido != 0)
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(43.0, 240.0, 0.0, 0.0),
                      child: StreamBuilder<List<PedidosRecord>>(
                        stream: queryPedidosRecord(
                          queryBuilder: (pedidosRecord) => pedidosRecord
                              .where(
                                'pedido_preparo',
                                isEqualTo: false,
                              )
                              .where(
                                'pedido',
                                isEqualTo: widget!.numPedido,
                              ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<PedidosRecord> barra1CinzaPedidosRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final barra1CinzaPedidosRecord =
                              barra1CinzaPedidosRecordList.isNotEmpty
                                  ? barra1CinzaPedidosRecordList.first
                                  : null;

                          return Container(
                            width: 4.0,
                            height: 79.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFC7C7C7),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if (widget!.numPedido != 0)
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(35.0, 318.0, 0.0, 0.0),
                      child: StreamBuilder<List<PedidosRecord>>(
                        stream: queryPedidosRecord(
                          queryBuilder: (pedidosRecord) => pedidosRecord
                              .where(
                                'pedido_preparo',
                                isEqualTo: false,
                              )
                              .where(
                                'pedido',
                                isEqualTo: widget!.numPedido,
                              ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<PedidosRecord>
                              pedidoPreparoCinzaPedidosRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final pedidoPreparoCinzaPedidosRecord =
                              pedidoPreparoCinzaPedidosRecordList.isNotEmpty
                                  ? pedidoPreparoCinzaPedidosRecordList.first
                                  : null;

                          return Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF989898),
                              shape: BoxShape.circle,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if (widget!.numPedido != 0)
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(43.0, 338.0, 0.0, 0.0),
                      child: StreamBuilder<List<PedidosRecord>>(
                        stream: queryPedidosRecord(
                          queryBuilder: (pedidosRecord) => pedidosRecord
                              .where(
                                'pedido_pronto',
                                isEqualTo: false,
                              )
                              .where(
                                'pedido',
                                isEqualTo: widget!.numPedido,
                              ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<PedidosRecord> barra2CinzaPedidosRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final barra2CinzaPedidosRecord =
                              barra2CinzaPedidosRecordList.isNotEmpty
                                  ? barra2CinzaPedidosRecordList.first
                                  : null;

                          return Container(
                            width: 4.0,
                            height: 79.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFC7C7C7),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if (widget!.numPedido != 0)
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(35.0, 416.0, 0.0, 0.0),
                      child: StreamBuilder<List<PedidosRecord>>(
                        stream: queryPedidosRecord(
                          queryBuilder: (pedidosRecord) => pedidosRecord
                              .where(
                                'pedido_pronto',
                                isEqualTo: false,
                              )
                              .where(
                                'pedido',
                                isEqualTo: widget!.numPedido,
                              ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<PedidosRecord>
                              pedidoProntoCinzaPedidosRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final pedidoProntoCinzaPedidosRecord =
                              pedidoProntoCinzaPedidosRecordList.isNotEmpty
                                  ? pedidoProntoCinzaPedidosRecordList.first
                                  : null;

                          return Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF989898),
                              shape: BoxShape.circle,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if (widget!.numPedido != 0)
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(43.0, 436.0, 0.0, 0.0),
                      child: StreamBuilder<List<PedidosRecord>>(
                        stream: queryPedidosRecord(
                          queryBuilder: (pedidosRecord) => pedidosRecord
                              .where(
                                'pedido_retirado',
                                isEqualTo: false,
                              )
                              .where(
                                'pedido',
                                isEqualTo: widget!.numPedido,
                              ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<PedidosRecord> barra2CinzaPedidosRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final barra2CinzaPedidosRecord =
                              barra2CinzaPedidosRecordList.isNotEmpty
                                  ? barra2CinzaPedidosRecordList.first
                                  : null;

                          return Container(
                            width: 4.0,
                            height: 79.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFC7C7C7),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if (widget!.numPedido != 0)
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(35.0, 514.0, 0.0, 0.0),
                      child: StreamBuilder<List<PedidosRecord>>(
                        stream: queryPedidosRecord(
                          queryBuilder: (pedidosRecord) => pedidosRecord
                              .where(
                                'pedido_retirado',
                                isEqualTo: false,
                              )
                              .where(
                                'pedido',
                                isEqualTo: widget!.numPedido,
                              ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<PedidosRecord>
                              pedidoRetiradaCinzaPedidosRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final pedidoRetiradaCinzaPedidosRecord =
                              pedidoRetiradaCinzaPedidosRecordList.isNotEmpty
                                  ? pedidoRetiradaCinzaPedidosRecordList.first
                                  : null;

                          return Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF989898),
                              shape: BoxShape.circle,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                AnimatedOpacity(
                  opacity: 0.8,
                  duration: 300.0.ms,
                  curve: Curves.easeIn,
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.65),
                    child: StreamBuilder<List<PedidosRecord>>(
                      stream: queryPedidosRecord(
                        queryBuilder: (pedidosRecord) => pedidosRecord
                            .where(
                              'pedido',
                              isEqualTo: widget!.numPedido,
                            )
                            .where(
                              'pedido_pronto',
                              isEqualTo: true,
                            ),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<PedidosRecord> pedidoRetiradoPedidosRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final pedidoRetiradoPedidosRecord =
                            pedidoRetiradoPedidosRecordList.isNotEmpty
                                ? pedidoRetiradoPedidosRecordList.first
                                : null;

                        return FFButtonWidget(
                          onPressed: () async {
                            await pedidoRetiradoPedidosRecord!.reference
                                .update(createPedidosRecordData(
                              pedidoRetirado: true,
                              timeRetirado: getCurrentTimestamp,
                            ));
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Status atualizado'),
                                  content: Text('Pedido retirado com sucesso'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );

                            context.pushNamed(
                              'EscolherOpcao',
                              queryParameters: {
                                'numPedido': serializeParam(
                                  0,
                                  ParamType.int,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'Confirmar Retirada',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.7,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFFF9423A),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (widget!.numPedido == 0)
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(35.0, 220.0, 0.0, 0.0),
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF989898),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(60.0, 221.0, 0.0, 0.0),
                    child: StreamBuilder<List<PedidosRecord>>(
                      stream: queryPedidosRecord(
                        queryBuilder: (pedidosRecord) => pedidosRecord
                            .where(
                              'pedido',
                              isEqualTo: widget!.numPedido,
                            )
                            .where(
                              'pedido_realizado',
                              isEqualTo: true,
                            ),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<PedidosRecord> textRealizadoPedidosRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final textRealizadoPedidosRecord =
                            textRealizadoPedidosRecordList.isNotEmpty
                                ? textRealizadoPedidosRecordList.first
                                : null;

                        return Text(
                          'Pedido realizado',
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Inter Tight',
                                color: Colors.black,
                                fontSize: 15.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
