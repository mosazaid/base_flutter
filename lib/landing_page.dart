import 'package:JordanElectricPowerCompany/utils/translations_delegate_base.dart';
import 'package:JordanElectricPowerCompany/widgets/common/app_drawer_widget.dart';
import 'package:JordanElectricPowerCompany/widgets/common/app_scaffold_widget.dart';
import 'package:JordanElectricPowerCompany/widgets/common/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentTab = 0;
  PageController pageController;

  _changeCurrentTab(int tab) {
    setState(() {
      currentTab = tab;
      pageController.jumpToPage(tab);
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController(keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: currentTab != 0
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.grey[100],
              //textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
              title: currentTab != 0
                  ? Text(getText(currentTab).toUpperCase())
                  : SizedBox(),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: Image.asset('assets/images/menu.png',
                        height: 50, width: 50),
                    iconSize: 15,
                    color: Colors.black,
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  );
                },
              ),
              centerTitle: true,
            )
          : MyAppbar(),
      drawer: SafeArea(child: AppDrawer()),
      extendBody: true,
      body: Container() /*PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomeScreen(),
          MyScheduleScreen(),
          QrReaderScreen(),
          DoctorReplyScreen(
            changeCurrentTab: () {
              _changeCurrentTab(0);
            },
          ),
        ],
      )*/,
      bottomNavigationBar: BottomNavBar(
        changeIndex: _changeCurrentTab,
        index: currentTab,
      ),
    );
  }

  getText(currentTab) {
    return "d";
    // switch (currentTab) {
    //   case 0:
    //     return TranslationBase.of(context).home;
    //   case 1:
    //     return TranslationBase.of(context).mySchedule;
    //   case 2:
    //     return TranslationBase.of(context).qr;
    //   case 3:
    //     return TranslationBase.of(context).replay2;
    // }
  }
}

class MyAppbar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  MyAppbar({Key key})
      : preferredSize = Size.fromHeight(0.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
