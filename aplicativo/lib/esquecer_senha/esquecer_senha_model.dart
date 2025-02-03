import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'esquecer_senha_widget.dart' show EsquecerSenhaWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EsquecerSenhaModel extends FlutterFlowModel<EsquecerSenhaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for e-mail widget.
  FocusNode? eMailFocusNode;
  TextEditingController? eMailTextController;
  String? Function(BuildContext, String?)? eMailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    eMailFocusNode?.dispose();
    eMailTextController?.dispose();
  }
}
