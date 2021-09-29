import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class HeaderBodyExpandableNotifier extends StatefulWidget {
  final Widget headerWidget;
  final Widget bodyWidget;
  final Widget collapsed;
  final bool isExpand;
  bool expandFlag = false;
  var controller = new ExpandableController();

  HeaderBodyExpandableNotifier({this.headerWidget, this.bodyWidget, this.collapsed, this.isExpand});

  @override
  _HeaderBodyExpandableNotifierState createState() =>
      _HeaderBodyExpandableNotifierState();
}

class _HeaderBodyExpandableNotifierState
    extends State<HeaderBodyExpandableNotifier> {

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    setState(() {
      if (widget.isExpand == true) {
        widget.expandFlag = widget.isExpand;
        widget.controller.expanded = true;
      }
    });
    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: Column(
          children: <Widget>[
            SizedBox(
              child: widget.headerWidget,
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                //  header: widget.headerWidget,
                collapsed: Container(),
                expanded: widget.bodyWidget,
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 0, right: 0, bottom: 0),
                    child: Expandable(
                      controller: widget.controller,
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
