import 'package:flutter/material.dart';
import '../all_todo_sections/todo_page.dart';

class ListButton extends StatelessWidget {
  const ListButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 200, height: 50,
      child: ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => TodoPage()),);
      },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
        ), child:
        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
          Icon(Icons.list_alt_rounded,size: 24,),
          SizedBox(width: 5,),
          Text('View Chores',style: TextStyle(fontSize: 16),)
        ],)
        ,),
    );
  }
}