import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'fazer_pedido_model.dart';
export 'fazer_pedido_model.dart';

class FazerPedidoWidget extends StatefulWidget {
  const FazerPedidoWidget({super.key});

  @override
  State<FazerPedidoWidget> createState() => _FazerPedidoWidgetState();
}

class _FazerPedidoWidgetState extends State<FazerPedidoWidget> {
  late FazerPedidoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FazerPedidoModel());
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
                  alignment: AlignmentDirectional(0.0, -0.45),
                  child: StreamBuilder<List<Cardapio2Record>>(
                    stream: queryCardapio2Record(
                      queryBuilder: (cardapio2Record) => cardapio2Record.where(
                        'Ativo',
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
                      List<Cardapio2Record> saladaCardapio2RecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final saladaCardapio2Record =
                          saladaCardapio2RecordList.isNotEmpty
                              ? saladaCardapio2RecordList.first
                              : null;

                      return FlutterFlowChoiceChips(
                        options: saladaCardapio2Record!.salada
                            .map((label) => ChipData(label))
                            .toList(),
                        onChanged: (val) => safeSetState(
                            () => _model.saladaValue = val?.firstOrNull),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: Color(0xFF0072CE),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                          iconColor: Colors.white,
                          iconSize: 16.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor: Colors.white,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 16.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        chipSpacing: 30.0,
                        rowSpacing: 8.0,
                        multiselect: false,
                        alignment: WrapAlignment.start,
                        controller: _model.saladaValueController ??=
                            FormFieldController<List<String>>(
                          [],
                        ),
                        wrapped: true,
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -0.55),
                  child: Text(
                    'Salada',
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
                  alignment: AlignmentDirectional(0.0, -0.2),
                  child: StreamBuilder<List<Cardapio2Record>>(
                    stream: queryCardapio2Record(
                      queryBuilder: (cardapio2Record) => cardapio2Record.where(
                        'Ativo',
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
                      List<Cardapio2Record> pratoPrincipalCardapio2RecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final pratoPrincipalCardapio2Record =
                          pratoPrincipalCardapio2RecordList.isNotEmpty
                              ? pratoPrincipalCardapio2RecordList.first
                              : null;

                      return FlutterFlowChoiceChips(
                        options: pratoPrincipalCardapio2Record!.pratoPrincipal
                            .map((label) => ChipData(label))
                            .toList(),
                        onChanged: (val) => safeSetState(() =>
                            _model.pratoPrincipalValue = val?.firstOrNull),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: Color(0xFF0072CE),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                          iconColor: Colors.white,
                          iconSize: 16.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor: Colors.white,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 16.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        chipSpacing: 30.0,
                        rowSpacing: 8.0,
                        multiselect: false,
                        alignment: WrapAlignment.start,
                        controller: _model.pratoPrincipalValueController ??=
                            FormFieldController<List<String>>(
                          [],
                        ),
                        wrapped: true,
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.06, -0.3),
                  child: Text(
                    'Prato Principal',
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
                  alignment: AlignmentDirectional(0.0, 0.05),
                  child: StreamBuilder<List<Cardapio2Record>>(
                    stream: queryCardapio2Record(
                      queryBuilder: (cardapio2Record) => cardapio2Record.where(
                        'Ativo',
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
                      List<Cardapio2Record> guanicaoCardapio2RecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final guanicaoCardapio2Record =
                          guanicaoCardapio2RecordList.isNotEmpty
                              ? guanicaoCardapio2RecordList.first
                              : null;

                      return FlutterFlowChoiceChips(
                        options: guanicaoCardapio2Record!.guarnicao
                            .map((label) => ChipData(label))
                            .toList(),
                        onChanged: (val) => safeSetState(
                            () => _model.guanicaoValue = val?.firstOrNull),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: Color(0xFF0072CE),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                          iconColor: Colors.white,
                          iconSize: 16.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor: Colors.white,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 16.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        chipSpacing: 30.0,
                        rowSpacing: 8.0,
                        multiselect: false,
                        alignment: WrapAlignment.start,
                        controller: _model.guanicaoValueController ??=
                            FormFieldController<List<String>>(
                          [],
                        ),
                        wrapped: true,
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -0.05),
                  child: Text(
                    'Guarnição',
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
                  alignment: AlignmentDirectional(0.0, 0.3),
                  child: StreamBuilder<List<Cardapio2Record>>(
                    stream: queryCardapio2Record(
                      queryBuilder: (cardapio2Record) => cardapio2Record.where(
                        'Ativo',
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
                      List<Cardapio2Record> acompanhamentoCardapio2RecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final acompanhamentoCardapio2Record =
                          acompanhamentoCardapio2RecordList.isNotEmpty
                              ? acompanhamentoCardapio2RecordList.first
                              : null;

                      return FlutterFlowChoiceChips(
                        options: acompanhamentoCardapio2Record!.acompanhamento
                            .map((label) => ChipData(label))
                            .toList(),
                        onChanged: (val) => safeSetState(() =>
                            _model.acompanhamentoValue = val?.firstOrNull),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: Color(0xFF0072CE),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                          iconColor: Colors.white,
                          iconSize: 16.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor: Colors.white,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 16.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        chipSpacing: 30.0,
                        rowSpacing: 8.0,
                        multiselect: false,
                        alignment: WrapAlignment.start,
                        controller: _model.acompanhamentoValueController ??=
                            FormFieldController<List<String>>(
                          [],
                        ),
                        wrapped: true,
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.2),
                  child: Text(
                    'Arroz',
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
                  alignment: AlignmentDirectional(0.0, 0.55),
                  child: FlutterFlowChoiceChips(
                    options: [ChipData('Com Feijão'), ChipData('Sem Feijão')],
                    onChanged: (val) => safeSetState(
                        () => _model.feijaoValue = val?.firstOrNull),
                    selectedChipStyle: ChipStyle(
                      backgroundColor: Color(0xFF0072CE),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).info,
                                letterSpacing: 0.0,
                              ),
                      iconColor: Colors.white,
                      iconSize: 16.0,
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    unselectedChipStyle: ChipStyle(
                      backgroundColor: Colors.white,
                      textStyle: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                      iconColor: FlutterFlowTheme.of(context).secondaryText,
                      iconSize: 16.0,
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    chipSpacing: 30.0,
                    rowSpacing: 8.0,
                    multiselect: false,
                    alignment: WrapAlignment.start,
                    controller: _model.feijaoValueController ??=
                        FormFieldController<List<String>>(
                      [],
                    ),
                    wrapped: true,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.45),
                  child: Text(
                    'Feijão',
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
                  alignment: AlignmentDirectional(0.0, 0.8),
                  child: StreamBuilder<List<Cardapio2Record>>(
                    stream: queryCardapio2Record(
                      queryBuilder: (cardapio2Record) => cardapio2Record.where(
                        'Ativo',
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
                      List<Cardapio2Record> sobremesaCardapio2RecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final sobremesaCardapio2Record =
                          sobremesaCardapio2RecordList.isNotEmpty
                              ? sobremesaCardapio2RecordList.first
                              : null;

                      return FlutterFlowChoiceChips(
                        options: sobremesaCardapio2Record!.sobremesa
                            .map((label) => ChipData(label))
                            .toList(),
                        onChanged: (val) => safeSetState(
                            () => _model.sobremesaValue = val?.firstOrNull),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: Color(0xFF0072CE),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                          iconColor: Colors.white,
                          iconSize: 16.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor: Colors.white,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 16.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        chipSpacing: 30.0,
                        rowSpacing: 8.0,
                        multiselect: false,
                        alignment: WrapAlignment.start,
                        controller: _model.sobremesaValueController ??=
                            FormFieldController<List<String>>(
                          [],
                        ),
                        wrapped: true,
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.7),
                  child: Text(
                    'Sobremesa',
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.black,
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                if ((_model.saladaValue != null && _model.saladaValue != '') &&
                    (_model.pratoPrincipalValue != null &&
                        _model.pratoPrincipalValue != '') &&
                    (_model.guanicaoValue != null &&
                        _model.guanicaoValue != '') &&
                    (_model.acompanhamentoValue != null &&
                        _model.acompanhamentoValue != '') &&
                    (_model.feijaoValue != null && _model.feijaoValue != '') &&
                    (_model.sobremesaValue != null &&
                        _model.sobremesaValue != ''))
                  AnimatedOpacity(
                    opacity: 0.8,
                    duration: 900.0.ms,
                    curve: Curves.easeIn,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 1.05),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(
                            'Pagamento',
                            queryParameters: {
                              'salada': serializeParam(
                                _model.saladaValue,
                                ParamType.String,
                              ),
                              'pratoPrincipal': serializeParam(
                                _model.pratoPrincipalValue,
                                ParamType.String,
                              ),
                              'guarnicao': serializeParam(
                                _model.guanicaoValue,
                                ParamType.String,
                              ),
                              'tipoArroz': serializeParam(
                                _model.acompanhamentoValue,
                                ParamType.String,
                              ),
                              'feijao': serializeParam(
                                _model.feijaoValue,
                                ParamType.String,
                              ),
                              'sobremesa': serializeParam(
                                _model.sobremesaValue,
                                ParamType.String,
                              ),
                              'timeRealizado': serializeParam(
                                getCurrentTimestamp,
                                ParamType.DateTime,
                              ),
                            }.withoutNulls,
                          );
                        },
                        text: 'Finalizar Pedido',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
                Align(
                  alignment: AlignmentDirectional(0.0, -0.68),
                  child: Text(
                    'Monte seu pedido!',
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
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('EscolherOpcao');
                    },
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
