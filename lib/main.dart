import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:my_task_list/all_todo_sections/todo_provider.dart';
import 'package:provider/provider.dart';
import 'buttons/list_button.dart';
import 'buttons/exit_button.dart';
import 'buttons/title_section.dart';
import 'buttons/privacy_policy_button.dart';
import 'ad_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(ChangeNotifierProvider(create: (context) => TodoProvider(),
    child: MaterialApp(debugShowCheckedModeBanner: false, home: HomePage(),
    ),
  )
  );
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;


  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          print("Failed to load banner ad: ${error.message}");
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    ).load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: double.infinity,height: double.infinity,decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/img.png'),fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            titleSection(),
            SizedBox(height: 50,),
            ListButton(),
            SizedBox(height: 50,),
            privacy_policy_button(),
            SizedBox(height: 50,),
            ExitButton(),
          ],
        ),
      ),
    bottomNavigationBar: _isAdLoaded ?
    SizedBox(height: _bannerAd!.size.height.toDouble(), width: _bannerAd!.size.width.toDouble(), child: AdWidget(ad: _bannerAd!),) : null,
    );
  }
}










