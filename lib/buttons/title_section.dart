import 'package:flutter/material.dart';

class titleSection extends StatelessWidget {
  const titleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(width: 200, height: 50,
      decoration: BoxDecoration(color: Colors.greenAccent, borderRadius: BorderRadius.circular(12.0),boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],),
      alignment: Alignment.center,
      child: Text('Task List', style: TextStyle(fontSize: 30, fontFamily: 'Arial',color: Colors.white,shadows: [
        Shadow(
          blurRadius: 2.0,
          color: Colors.black26,
          offset: Offset(1.0, 1.0),
        ),
      ],
      ),
        textAlign: TextAlign.center,),
    );
  }
}
