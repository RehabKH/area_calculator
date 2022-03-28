import 'package:flutter/material.dart';

class ShapeContainer extends StatelessWidget {
  String shape;
  ShapeContainer(this.shape);

  @override
  Widget build(BuildContext context) {
    return (shape == "Triangle")
        ? CustomPaint(
            size: Size(100, 100),
            painter: TrianglePainter(),
          )
        : CustomPaint(
            size: Size(100, 100),
            painter: RectanglePainter(),
          );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.deepOrange;
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.deepPurple;
    Rect rect =
        Rect.fromLTRB(0, size.height / 4, size.width, size.height / 4 * 3);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
