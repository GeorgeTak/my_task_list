import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 200, height: 50,
      child: ElevatedButton(onPressed: (){
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.greenAccent,
            title: const Text("Exit App"),
            content: const Text("Are you sure you want to exit?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: const Text("Exit", style: TextStyle(color: Colors.red)),
              ),
            ],
          );
        },
        );},
        style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
        ), child:
        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
          Icon(Icons.exit_to_app_rounded,size: 24,),
          SizedBox(width: 5,),
          Text('Exit',style: TextStyle(fontSize: 16),)
        ],)
        ,),
    );
  }
}