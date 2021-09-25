
import 'package:flutter/rendering.dart';

//Add this CustomPaint widget to the Widget Tree


//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(411.526,572.535);
    path_0.cubicTo(411.526,511.15799999999996,-159.75799999999998,520.2679999999999,43.87299999999999,242.60299999999995);
    path_0.cubicTo(247.50399999999996,-35.06200000000001,645.8610000000001,-90.27700000000004,748.973,160.15699999999995);
    path_0.cubicTo(852.0849999999998,410.59099999999995,1176.2269999999999,331.4699999999999,1176.2269999999999,201.44499999999994);
    path_0.lineTo(1176.2269999999999,572.5349999999999);
    path_0.close();

    Paint paint0Fill = Paint()..style=PaintingStyle.fill;
    paint0Fill.color = Color(0xff40976c).withOpacity(1.0);
    canvas.drawPath(path_0,paint0Fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

