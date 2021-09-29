import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final ValueChanged<int> changeIndex;
  final int index;
  final int currentIndex;
  final String name;

  BottomNavigationItem(
      {this.icon,
      this.activeIcon,
      this.changeIndex,
      this.index,
      this.currentIndex,
      this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 70.0,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () => changeIndex(currentIndex),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 15,),
                Container(
                  child: Icon(currentIndex == index ? activeIcon : icon,
                      color: currentIndex == index
                          ? Color(0xFF333C45)
                          : Theme.of(context).dividerColor,
                      size: 22.0),
                ),
                SizedBox(height: 5,),
                Expanded(
                  child: Text(
                    name,
                    style: TextStyle(
                      color: currentIndex == index
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).dividerColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
