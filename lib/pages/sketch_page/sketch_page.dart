import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class SketchPage extends StatelessWidget {
  const SketchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SketchPad();
  }
}

class SketchPad extends StatefulWidget {
  const SketchPad({Key? key}) : super(key: key);

  @override
  State<SketchPad> createState() => _SketchPadState();
}

class _SketchPadState extends State<SketchPad> {
  Uint8List? _bytes;
  ValueNotifier<Path> _current = ValueNotifier(Path());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        _current.value
            .moveTo(details.localPosition.dx, details.localPosition.dy);
        _current.value.lineTo(
            details.localPosition.dx + 1, details.localPosition.dy + 1);
      },
      onPanUpdate: (details) {
        _current.value
            .lineTo(details.localPosition.dx, details.localPosition.dy);
        _current.notifyListeners();
      },
      onPanEnd: (_) async {
        final render = (context.findRenderObject() as RenderRepaintBoundary);
        final imageBytes = (await (await render.toImage())
            .toByteData(format: ImageByteFormat.png))!
            .buffer
            .asUint8List();
        setState(() {
          _bytes = imageBytes;
        });
        _current.value = Path();
      },
      child: Stack(
        children: [
          if (_bytes != null) Image.memory(_bytes!, gaplessPlayback: true),
          Container(color: Colors.yellow[100]!.withOpacity(0.5)),
          RepaintBoundary(
            child: CustomPaint(
                willChange: true,
                painter: SketchPainter(_current),
                size: Size.infinite),
          )
        ],
      ),
    )
    ;
  }
}

class SketchPainter extends CustomPainter {
  final ValueNotifier<Path> path;

  SketchPainter(this.path) : super(repaint: path);

  static final pen = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(path.value, pen);
  }

  @override
  bool shouldRepaint(_) => true;
}
