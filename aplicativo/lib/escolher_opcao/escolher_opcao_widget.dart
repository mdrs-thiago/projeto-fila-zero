import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'escolher_opcao_model.dart';
export 'escolher_opcao_model.dart';

class EscolherOpcaoWidget extends StatefulWidget {
  const EscolherOpcaoWidget({
    super.key,
    this.numPedido,
  });

  final int? numPedido;

  @override
  State<EscolherOpcaoWidget> createState() => _EscolherOpcaoWidgetState();
}

class _EscolherOpcaoWidgetState extends State<EscolherOpcaoWidget> {
  late EscolherOpcaoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EscolherOpcaoModel());
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
                AnimatedOpacity(
                  opacity: 0.8,
                  duration: 300.0.ms,
                  curve: Curves.easeIn,
                  child: Align(
                    alignment: AlignmentDirectional(-0.11, -0.23),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('FazerPedido');
                      },
                      text: 'Iniciar Pedido',
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
                Align(
                  alignment: AlignmentDirectional(0.0, -0.68),
                  child: Text(
                    'O que deseja fazer?',
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
                    alignment: AlignmentDirectional(0.0, 0.2),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'AcompanharPedido',
                          queryParameters: {
                            'numPedido': serializeParam(
                              widget!.numPedido,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: 'Consultar Pedido',
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
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('Login');
                    },
                    child: Text(
                      'Desconectar',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: Color(0xFF0072CE),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                if (currentUserEmail != 'igor@gmail.com')
                  AnimatedOpacity(
                    opacity: 0.8,
                    duration: 300.0.ms,
                    curve: Curves.easeIn,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.6),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Histórico de Pedidos',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.7,
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
                if (currentUserEmail == 'igor@gmail.com')
                  AnimatedOpacity(
                    opacity: 0.8,
                    duration: 300.0.ms,
                    curve: Curves.easeIn,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.6),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(
                            'PainelCozinha',
                            queryParameters: {
                              'numPedido': serializeParam(
                                widget!.numPedido,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );
                        },
                        text: 'Painel administrador',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
