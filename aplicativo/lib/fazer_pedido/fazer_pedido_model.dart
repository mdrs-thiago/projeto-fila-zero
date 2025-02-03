import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'fazer_pedido_widget.dart' show FazerPedidoWidget;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FazerPedidoModel extends FlutterFlowModel<FazerPedidoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Salada widget.
  FormFieldController<List<String>>? saladaValueController;
  String? get saladaValue => saladaValueController?.value?.firstOrNull;
  set saladaValue(String? val) =>
      saladaValueController?.value = val != null ? [val] : [];
  // State field(s) for PratoPrincipal widget.
  FormFieldController<List<String>>? pratoPrincipalValueController;
  String? get pratoPrincipalValue =>
      pratoPrincipalValueController?.value?.firstOrNull;
  set pratoPrincipalValue(String? val) =>
      pratoPrincipalValueController?.value = val != null ? [val] : [];
  // State field(s) for Guanicao widget.
  FormFieldController<List<String>>? guanicaoValueController;
  String? get guanicaoValue => guanicaoValueController?.value?.firstOrNull;
  set guanicaoValue(String? val) =>
      guanicaoValueController?.value = val != null ? [val] : [];
  // State field(s) for Acompanhamento widget.
  FormFieldController<List<String>>? acompanhamentoValueController;
  String? get acompanhamentoValue =>
      acompanhamentoValueController?.value?.firstOrNull;
  set acompanhamentoValue(String? val) =>
      acompanhamentoValueController?.value = val != null ? [val] : [];
  // State field(s) for Feijao widget.
  FormFieldController<List<String>>? feijaoValueController;
  String? get feijaoValue => feijaoValueController?.value?.firstOrNull;
  set feijaoValue(String? val) =>
      feijaoValueController?.value = val != null ? [val] : [];
  // State field(s) for Sobremesa widget.
  FormFieldController<List<String>>? sobremesaValueController;
  String? get sobremesaValue => sobremesaValueController?.value?.firstOrNull;
  set sobremesaValue(String? val) =>
      sobremesaValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
