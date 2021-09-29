import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation_item.dart';


class BottomNavBar extends StatefulWidget {
  final ValueChanged<int> changeIndex;
  final int index;
  BottomNavBar({Key key, this.changeIndex, this.index}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _index = 0;

  _changeIndex(int index) {
    widget.changeIndex(index);
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 4,
      shape: CircularNotchedRectangle(),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        /*child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavigationItem(
              icon: DoctorApp.home_1,
              activeIcon: DoctorApp.home_active_1,
              changeIndex: _changeIndex,
              index: widget.index,
              currentIndex: 0,
              name: TranslationBase.of(context).home,
            ),
            BottomNavigationItem(
              icon: DoctorApp.schedule_1,
              activeIcon: DoctorApp.schedule_active_1,
              changeIndex: _changeIndex,
              index: widget.index,
              currentIndex: 1,
              name: TranslationBase.of(context).mySchedule,
            ),
            BottomNavigationItem(
              icon: DoctorApp.qr_reader,
              activeIcon: DoctorApp.qr_reader_active_1,
              changeIndex: _changeIndex,
              index: widget.index,
              currentIndex: 2,
              name: TranslationBase.of(context).qr,
            ),
            BottomNavigationItem(
              icon: DoctorApp.dr_reply_1,
              activeIcon: DoctorApp.dr_reply_active_1,
              changeIndex: _changeIndex,
              index: widget.index,
              currentIndex: 3,
              name: TranslationBase.of(context).replay2,
            ),
          ],
        ),*/
      ),
    );
  }
}
