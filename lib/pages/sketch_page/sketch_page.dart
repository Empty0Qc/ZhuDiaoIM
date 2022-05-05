import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  final ValueNotifier<Path> _current = ValueNotifier(Path());
  final ValueNotifier<Color> _color = ValueNotifier(Colors.black);
  bool _isColorsToolShow = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        _current.value
            .moveTo(details.localPosition.dx, details.localPosition.dy);
        _current.value
            .lineTo(details.localPosition.dx + 1, details.localPosition.dy + 1);
      },
      onPanUpdate: (details) {
        setState(() {
          _current.value
              .lineTo(details.localPosition.dx, details.localPosition.dy);
        });
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
          Center(
              child: Positioned(
                  left: 0, right: 0, top: 40, child: Text('Draw here'))),
          if (_bytes != null) Image.memory(_bytes!, gaplessPlayback: true),
          Container(color: Colors.yellow[100]!.withOpacity(0.5)),
          RepaintBoundary(
            child: CustomPaint(
                willChange: true,
                painter: SketchPainter(_current, _color),
                size: Size.infinite),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: IconButton(
                onPressed: () {
                  _current.value = Path();
                  setState(() {
                    _bytes = null;
                  });
                },
                icon: const Icon(Icons.cleaning_services_sharp),
              )),
          Positioned(
              left: 0,
              bottom: 0,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isColorsToolShow = !_isColorsToolShow;
                      });
                    },
                    icon: const Icon(Icons.color_lens_outlined),
                  ),
                  if (_isColorsToolShow) _getColorsPallet()
                ],
              ))
        ],
      ),
    );
  }

  _getColorsPallet() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _color.value = Colors.red;
              _isColorsToolShow = false;
            });
          },
          child: Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              height: 20,
              width: 20),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _color.value = Colors.blue;
              _isColorsToolShow = false;
            });
          },
          child: Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              height: 20,
              width: 20),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _color.value = Colors.green;
              _isColorsToolShow = false;
            });
          },
          child: Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
              height: 20,
              width: 20),
        )
      ],
    );
  }
}

class SketchPainter extends CustomPainter {
  final ValueNotifier<Path> path;
  ValueNotifier<Color> color;

  SketchPainter(this.path, this.color) : super(repaint: path);

  var pen = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0;

  @override
  void paint(Canvas canvas, Size size) {
    pen.color = color.value;
    canvas.drawPath(path.value, pen);
  }

  @override
  bool shouldRepaint(_) => true;
}
