import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pagamento_model.dart';
export 'pagamento_model.dart';

class PagamentoWidget extends StatefulWidget {
  const PagamentoWidget({
    super.key,
    required this.salada,
    required this.pratoPrincipal,
    required this.guarnicao,
    required this.tipoArroz,
    required this.feijao,
    required this.sobremesa,
    required this.timeRealizado,
  });

  final String? salada;
  final String? pratoPrincipal;
  final String? guarnicao;
  final String? tipoArroz;
  final String? feijao;
  final String? sobremesa;
  final DateTime? timeRealizado;

  @override
  State<PagamentoWidget> createState() => _PagamentoWidgetState();
}

class _PagamentoWidgetState extends State<PagamentoWidget> {
  late PagamentoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PagamentoModel());
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
                    'Realize o pagamento',
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
                        context.pushNamed('FazerPedido');
                      },
                      text: 'Retornar',
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
                AnimatedOpacity(
                  opacity: 0.8,
                  duration: 300.0.ms,
                  curve: Curves.easeIn,
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final paymentResponse = await processStripePayment(
                          context,
                          amount: 300,
                          currency: 'BRL',
                          customerEmail: currentUserEmail,
                          customerName: 'ADMIN',
                          description: 'Insira os dados do cartão de crédito',
                          allowGooglePay: true,
                          allowApplePay: false,
                          themeStyle: ThemeMode.system,
                          buttonTextColor: Color(0xFFC9C9C9),
                        );
                        if (paymentResponse.paymentId == null &&
                            paymentResponse.errorMessage != null) {
                          showSnackbar(
                            context,
                            'Error: ${paymentResponse.errorMessage}',
                          );
                        }
                        _model.paymentId = paymentResponse.paymentId ?? '';

                        if ((_model.paymentId != '0') &&
                            (_model.paymentId != 'Null')) {
                          _model.numPediddo =
                              random_data.randomInteger(0, 9999);
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Pagamento realizado'),
                                content: Text('Pedido confirmado'),
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

                          await PedidosRecord.collection
                              .doc()
                              .set(createPedidosRecordData(
                                pedido: _model.numPediddo,
                                salada: widget!.salada,
                                pratoPrincipal: widget!.pratoPrincipal,
                                guarnicao: widget!.guarnicao,
                                tipoArroz: widget!.tipoArroz,
                                feijao: widget!.feijao,
                                sobremesa: widget!.sobremesa,
                                pedidoRealizado: true,
                                timeRealizado: widget!.timeRealizado,
                                pedidoPreparo: false,
                                timePreparo: null,
                                pedidoPronto: false,
                                timePronto: null,
                                pedidoRetirado: false,
                                timeRetirado: null,
                              ));

                          context.pushNamed(
                            'AcompanharPedido',
                            queryParameters: {
                              'numPedido': serializeParam(
                                _model.numPediddo,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Erro no pedido'),
                                content: Text('Pagamento não efetuado'),
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
                        }

                        safeSetState(() {});
                      },
                      text: 'Realizar pagamento',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFFF9423A),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
