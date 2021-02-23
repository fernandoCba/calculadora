import 'package:flutter/material.dart';

class BusinessCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact')),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait)
            return Center(
              child: Text('Rotate the screen'),
            );
          else {
            return MyBusinessCard();
          }
        },
      ),
    );
  }
}

class MyBusinessCard extends StatelessWidget {
  String _profileUrl =
      'https://avatars.githubusercontent.com/u/5612200?s=128&v=4';
  double _h1Size = 40;
  double _h2Size = 25;

  @override
  Widget build(BuildContext context) {
    TextStyle _secondRowStyle = TextStyle(
      fontSize: _h2Size,
      fontWeight: FontWeight.bold,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //PHOTO AND NAME ROW
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(_profileUrl),
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            Expanded(
              child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                    Text(
                      'Fernando Rodriguez',
                      style: TextStyle(
                        fontSize: _h1Size,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Experienced App Developer',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: _h2Size,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ])),
            ),
          ],
        ),
        //address and phone
        Row(
          children: [
            Spacer(flex: 1),
            Text(
              'github.com/fernandoCba',
              style: _secondRowStyle,
            ),
            Spacer(flex: 7),
            Text('@fercba', style: _secondRowStyle),
            Spacer(flex: 1),
          ],
        ),
        //bottom icons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.accessibility),
            Icon(Icons.access_alarm),
            Icon(Icons.phone_android),
            Icon(Icons.phone_iphone),
          ],
        )
      ],
    );
  }
}
