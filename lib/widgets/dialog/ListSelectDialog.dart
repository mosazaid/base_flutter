import 'package:JordanElectricPowerCompany/utils/helpers.dart';
import 'package:JordanElectricPowerCompany/utils/translations_delegate_base.dart';
import 'package:flutter/material.dart';

class ListSelectDialog extends StatefulWidget {
  final List<dynamic> list;
  final String attributeName;
  final String attributeValueId;
  final okText;
  final Function(dynamic) okFunction;
  dynamic selectedValue;
  final Widget searchWidget;
  final bool usingSearch;
  final String hintSearchText;

  ListSelectDialog({
    @required this.list,
    @required this.attributeName,
    @required this.attributeValueId,
    @required this.okText,
    @required this.okFunction,
    this.searchWidget,
    this.usingSearch = false,
    this.hintSearchText,
  });

  @override
  _ListSelectDialogState createState() => _ListSelectDialogState();
}

class _ListSelectDialogState extends State<ListSelectDialog> {
  List<dynamic> items = List();

  @override
  void initState() {
    widget.selectedValue = widget.selectedValue ?? widget.list[0];
    items.addAll(widget.list);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return showAlertDialog(context);
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
        child: Text(TranslationBase.of(context).cancel),
        onPressed: () {
          Navigator.of(context).pop();
        });
    Widget continueButton = TextButton(
        child: Text(this.widget.okText),
        onPressed: () {
          Navigator.of(context).pop();
          this.widget.okFunction(widget.selectedValue);
        });
// set up the AlertDialog
    AlertDialog alert = AlertDialog(
      // title: Text(widget.title),
      content: createDialogList(),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    return alert;
  }

  Widget createDialogList() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (widget.searchWidget != null) widget.searchWidget,
            if(widget.usingSearch)
              Container(
                  height: MediaQuery.of(context).size.height * 0.070,
                  child: TextField(
                    decoration: Helpers.textFieldSelectorDecoration(
                        widget.hintSearchText ?? TranslationBase
                            .of(context)
                            .search, null, false, suffixIcon: Icon(Icons.search,)),
                    enabled: true,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      filterSearchResults(value);
                    },
                  )),
            ...items
                .map((item) => RadioListTile(
              title: Text("${item[widget.attributeName].toString()}"),
              groupValue: widget.selectedValue[widget.attributeValueId]
                  .toString(),
              value: item[widget.attributeValueId].toString(),
              activeColor: Colors.blue.shade700,
              selected: item[widget.attributeValueId].toString() ==
                  widget.selectedValue[widget.attributeValueId]
                      .toString(),
              onChanged: (val) {
                setState(() {
                  widget.selectedValue = item;
                });
              },
            ))
                .toList()
          ],
        ),
      ),
    );
  }

  static closeAlertDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  void filterSearchResults(String query) {
    List<dynamic> dummySearchList = List();
    dummySearchList.addAll(widget.list);
    if (query.isNotEmpty) {
      List<dynamic> dummyListData = List();
      dummySearchList.forEach((item) {
        if ("${item[widget.attributeName].toString()}".toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(widget.list);
      });
    }
  }
}
