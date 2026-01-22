import 'package:flutter/material.dart';


const String title1 = '1. Introduction';
const String par1 = 'Welcome to our Task List app. We respect your privacy. This policy describes how our application handles your data. Our app is designed to help you manage your chores and priorities locally on your device.';

const String title2 = '2. Data Collection and Usage';

const String par2 = 'We do not access or transmit your personal task list. However, we use third-party services to support the application.';
const String bullet1 = '• Task Data: The tasks, priorities, and completion status you enter are stored strictly on your device\'s internal memory.';

const String bulletAd = '• Advertising Data: This app uses Google AdMob to display ads. AdMob may collect device identifiers (like Advertising ID) and usage data to serve ads.';
const String bullet2 = '• No Cloud Sync: Your task list data never leaves your phone.';


const String title3 = '3. Third-Party Services';
const String par3 = 'We use Google AdMob to display banner ads. Google may use unique device identifiers for advertising purposes to serve personalized or non-personalized ads.';


const String title4 = '4. Data Retention and Deletion';
const String bullet3 = '• Retention: Your task list is retained on your device so that your data remains available every time you open the app.';
const String bullet4 = '• Deletion: You have full control over your data. When you select the "Clear" option within the app, that data is permanently removed from your device\'s local storage immediately.';
const String bullet5 = '• Uninstalling: If you uninstall the app or clear the app\'s data in your phone settings, all your task lists will be permanently deleted.';


const String title5 = '5. Contact Us';
const String par5 = 'If you have any questions about this Privacy Policy, please contact us at:\ngtak2002@gmail.com';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(backgroundColor: Colors.greenAccent,title: Text('Privacy Policy'),),
    body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisAlignment:MainAxisAlignment.start,children: [
            _buildSectionTitle(title1),
            _buildParagraph(par1),

            _buildSectionTitle(title2),
            _buildParagraph(par2),
            _buildParagraph(bullet1),
            _buildParagraph(bulletAd),
            _buildParagraph(bullet2),


            _buildSectionTitle(title3),
            _buildParagraph(par3),

            _buildSectionTitle(title4),
            _buildParagraph(bullet3),
            _buildParagraph(bullet4),
            _buildParagraph(bullet5),

            _buildSectionTitle(title5),
            _buildParagraph(par5),
            SizedBox(height: 10,),
            Text('Last updated: January 4, 2026',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
              ],),
        )
    ),
    );
  }


  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
      child: Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87,)),
    );
  }


  Widget _buildParagraph(String text) {
    return Text(text, style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black54),);
  }
}
