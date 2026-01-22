import 'package:flutter/material.dart';
import 'package:my_task_list/privacy_policy_page.dart';

class privacy_policy_button extends StatelessWidget {
  const privacy_policy_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 200,height: 50,
      child: ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),);},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),)),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.description,size: 24,),
              SizedBox(width: 5,),
              Text('Privacy Policy',style: TextStyle(fontSize: 14),)
            ],)
      )
      ,);
  }
}