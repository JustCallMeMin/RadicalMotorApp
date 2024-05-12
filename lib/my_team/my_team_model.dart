import '/components/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_team_widget.dart' show MyTeamWidget;
import 'package:flutter/material.dart';

class MyTeamModel extends FlutterFlowModel<MyTeamWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
