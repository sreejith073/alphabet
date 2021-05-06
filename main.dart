import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays ([]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight,DeviceOrientation.landscapeLeft]).then((_){
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Offset> points1 = [];
  List<Offset> points2 = [];
  List<Offset> points3 = [];

  @override
  Widget build(BuildContext context) {
    final double width  = MediaQuery.of(context).size.width;
    final double height  = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          points1.clear();
          points2.clear();
          points3.clear();
        },
      ),
      backgroundColor: Colors.teal,
      body: SafeArea(
        child:Stack(
          children: [
            Positioned(
              left: 280,
              // bottom: 0,
              top:227,
              //right: 0,
              child: ClipPath(
                clipper: CPath3(),
                child: Container(
                  height: height*0.07,
                  width: width*0.18,
                  child: GestureDetector(
                    onPanStart: (details){
                      this.setState(() {
                        points3.add(details.localPosition);
                      });
                    },
                    onPanUpdate: (details){
                      this.setState(() {
                        points3.add(details.localPosition);
                      });
                    },
                    onPanEnd: (details){
                      this.setState(() {
                        points3.add(null);
                      });
                    },
                    child: CustomPaint(
                      painter: MyPainter3(points3: points3),
                    ),
                  ),
                ),
              ),
            ),//THIRD PATH
            Positioned(
              left: 207,
              // bottom: 0,
              top:80,
              //right: 0,
              child: ClipPath(
                clipper: CPath1(),
                child: Container(
                  height: height*0.60,
                  width: width*0.20,
                  child: GestureDetector(
                    onPanStart: (details){
                      this.setState(() {
                        points1.add(details.localPosition);
                      });
                    },
                    onPanUpdate: (details){
                      this.setState(() {
                        points1.add(details.localPosition);
                      });
                    },
                    onPanEnd: (details){
                      this.setState(() {
                        points1.add(null);
                      });
                    },
                    child: CustomPaint(
                      painter: MyPainter1(points1: points1),
                    ),
                  ),
                ),
              ),
            ),//FIRST PATH
            Positioned(
              left: 340,
              // bottom: 0,
              top:80,
              //right: 0,
              child: ClipPath(
                clipper: CPath2(),
                child: Container(
                  height: height*0.60,
                  width: width*0.20,
                  child: GestureDetector(
                    onPanStart: (details){
                      this.setState(() {
                        points2.add(details.localPosition);
                      });
                    },
                    onPanUpdate: (details){
                      this.setState(() {
                        points2.add(details.localPosition);
                      });
                    },
                    onPanEnd: (details){
                      this.setState(() {
                        points2.add(null);
                      });
                    },
                    child: CustomPaint(
                      painter: MyPainter2(points2: points2),
                    ),
                  ),
                ),
              ),
            ),//SECOND PATH
          ],
        ),
      ),
    );
  }
}

class CPath1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path_0 = Path();
    path_0.moveTo(0,size.height);
    path_0.lineTo(size.width*0.2983628,size.height);
    path_0.lineTo(size.width,0);
    path_0.lineTo(size.width*0.7591676,0);
    path_0.lineTo(0,size.height);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}
class MyPainter1 extends CustomPainter {
  List<Offset> points1;
  MyPainter1({this.points1});
  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color =  Colors.white;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);

    Paint paint = Paint();
    paint.color = Colors.deepPurpleAccent;
    paint.strokeWidth = 70;
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;

    for(int x=0;x<points1.length-1;x++)
    {
      if(points1[x] != null && points1[x+1] != null)
      {
        canvas.drawLine(points1[x], points1[x+1], paint);
      }
      else if(points1[x] != null && points1[x+1] == null)
      {

        canvas.drawPoints(ui.PointMode.points,[points1[x]], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

class CPath2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path_0 = Path();
    path_0.moveTo(size.width*0.6738603,size.height);
    path_0.lineTo(size.width,size.height);
    path_0.lineTo(size.width*0.1934179,0);
    path_0.lineTo(size.width*0.08001079,0);
    path_0.lineTo(0,size.height*0.1078064);
    path_0.lineTo(size.width*0.6738603,size.height);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}
class MyPainter2 extends CustomPainter {
  List<Offset> points2;
  MyPainter2({this.points2});
  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color =  Colors.white;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);

    Paint paint = Paint();
    paint.color = Colors.deepPurpleAccent;
    paint.strokeWidth = 70;
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;

    for(int x=0;x<points2.length-1;x++)
    {
      if(points2[x] != null && points2[x+1] != null)
      {
        canvas.drawLine(points2[x], points2[x+1], paint);
      }
      else if(points2[x] != null && points2[x+1] == null)
      {

        canvas.drawPoints(ui.PointMode.points,[points2[x]], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}

class CPath3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path_0 = Path();
    path_0.moveTo(size.width*0.9108546,0);
    path_0.lineTo(size.width*0.08746101,0);
    path_0.lineTo(0,size.height);
    path_0.lineTo(size.width,size.height*0.9771505);
    path_0.lineTo(size.width*0.9108546,0);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}
class MyPainter3 extends CustomPainter {
  List<Offset> points3;
  MyPainter3({this.points3});
  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color =  Colors.white;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);

    Paint paint = Paint();
    paint.color = Colors.deepPurpleAccent;
    paint.strokeWidth = 70;
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;

    for(int x=0;x<points3.length-1;x++)
    {
      if(points3[x] != null && points3[x+1] != null)
      {
        canvas.drawLine(points3[x], points3[x+1], paint);
      }
      else if(points3[x] != null && points3[x+1] == null)
      {

        canvas.drawPoints(ui.PointMode.points,[points3[x]], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}



