import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'bsimage_model.dart';
export 'bsimage_model.dart';

class BsimageWidget extends StatefulWidget {
  const BsimageWidget({
    super.key,
    this.imagemParam,
  });

  final FFUploadedFile? imagemParam;

  @override
  State<BsimageWidget> createState() => _BsimageWidgetState();
}

class _BsimageWidgetState extends State<BsimageWidget> {
  late BsimageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BsimageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      constraints: const BoxConstraints(
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.memory(
              widget.imagemParam?.bytes ?? Uint8List.fromList([]),
              width: double.infinity,
              height: 304.0,
              fit: BoxFit.cover,
              alignment: const Alignment(0.0, 0.0),
            ),
          ),
        ],
      ),
    );
  }
}
