import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Dashboard"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  child: const ListTile(
                    leading: CircleAvatar(backgroundColor: Colors.amber),
                    title: Text('boom'),
                    subtitle: Text('description'),
                    trailing: Icon(Icons.delete),
                  ),
                );
              }),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: size.width,
              height: 70,
              // color: Colors.redAccent[100],
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 60),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.8,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/CameraGalleryScreen');
                      },
                      backgroundColor: Colors.blue[300],
                      elevation: 0.1,
                      child: const Icon(Icons.camera_alt_outlined),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.home),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.shopping_bag),
                          onPressed: () {},
                        ),
                        Container(
                          width: size.width * 0.20,
                        ),
                        IconButton(
                          icon: const Icon(Icons.people),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.print),
                          onPressed: () {},
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 0);
    path.lineTo(size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(6.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 1.5);
    path.lineTo(0, size.height * 1.5);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
