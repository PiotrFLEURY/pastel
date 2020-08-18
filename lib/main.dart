import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Pastel(),
    );
  }
}

class Pastel extends StatefulWidget {
  @override
  _PastelState createState() => _PastelState();
}

class _PastelState extends State<Pastel> {
  Color _color = Colors.white;
  double _lightness = .5;
  double _saturation = .5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: _color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Lightness: $_lightness",
              style: TextStyle(color: Colors.grey),
            ),
            Slider(
              label: "Lightness",
              value: _lightness,
              onChanged: (value) {
                setState(() {
                  _lightness = value;
                });
              },
            ),
            Text(
              "Saturation: $_saturation",
              style: TextStyle(color: Colors.grey),
            ),
            Slider(
              label: "Saturation",
              value: _saturation,
              onChanged: (value) {
                setState(() {
                  _saturation = value;
                });
              },
            ),
            Text("Color:${_color.toString()}"),
            RaisedButton(
              onPressed: () => _refresh(),
              child: Text("Refresh"),
            ),
          ],
        ),
      ),
    );
  }

  void _refresh() {
    setState(() {
      _color = HSLColor.fromColor(Color(generateColor()))
          .withLightness(_lightness)
          .withSaturation(_saturation)
          .toColor();
    });
  }

  String generateRandomHexColor() {
    int length = 6;
    String chars = '0123456789ABCDEF';
    String hex = '#';
    while (length-- > 0) hex += chars[(Random().nextInt(16)) | 0];
    return hex;
  }

  int generateColor() {
    var hexColor = generateRandomHexColor();
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
