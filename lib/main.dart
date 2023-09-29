import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Feed'),
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return ImageFeed(orientation: orientation);
          },
        ),
      ),
    );
  }
}

class ImageFeed extends StatelessWidget {
  final Orientation orientation;
  ImageFeed({required this.orientation});

  @override
  Widget build(BuildContext context) {
    final isPortrait = orientation == Orientation.portrait;
    final itemCount = 10;
    return isPortrait
        ? ListView.builder(
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                child: Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Image.network(
                      'https://via.placeholder.com/150',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          )
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                child: Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Image.network(
                      'https://via.placeholder.com/150',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          );
  }
}
