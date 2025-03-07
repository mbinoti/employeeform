import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CustomPaint(
            size: Size(150, 150), // Tamanho do desenho
            painter: LogoPainter(),
          ),
        ),
      ),
    ),
  );
}

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color =
              Colors
                  .blue
                  .shade700 // Ajustando a cor para mais precisão
          ..style = PaintingStyle.fill;

    double circleRadius = size.width * 0.3;

    // Círculo pequeno no topo esquerdo
    canvas.drawCircle(Offset(circleRadius, circleRadius), circleRadius, paint);

    // Quarto de círculo no canto inferior esquerdo
    Path quarterCircle =
        Path()
          ..moveTo(0, size.height)
          ..arcToPoint(
            Offset(circleRadius, size.height - circleRadius),
            radius: Radius.circular(circleRadius),
            clockwise: false,
          )
          ..lineTo(0, size.height)
          ..close();
    canvas.drawPath(quarterCircle, paint);

    // Retângulo ao lado do quarto de círculo
    Rect rect = Rect.fromLTWH(
      circleRadius,
      size.height - circleRadius,
      circleRadius,
      circleRadius,
    );
    canvas.drawRect(rect, paint);

    // Meio círculo cortado na direita
    Path halfCircle =
        Path()
          ..moveTo(size.width, 0)
          ..arcToPoint(
            Offset(size.width - circleRadius, size.height),
            radius: Radius.circular(size.width * 0.5),
            clockwise: false,
          )
          ..lineTo(size.width, size.height)
          ..close();
    canvas.drawPath(halfCircle, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
