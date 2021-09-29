import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();
    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
      if (newValue.selection.end >= 3) selectionIndex += 2;
    }
    if (newTextLength >= 7) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
      if (newValue.selection.end >= 6) selectionIndex++;
    }
    if (newTextLength >= 11) {
      newText.write(newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
      if (newValue.selection.end >= 10) selectionIndex++;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

final _mobileFormatter = NumberTextInputFormatter();

class NewTextFields extends StatefulWidget {
  NewTextFields(
      {Key key,
        this.type,
        this.hintText,
        this.suffixIcon,
        this.autoFocus,
        this.onChanged,
        this.initialValue,
        this.minLines,
        this.maxLines,
        this.inputFormatters,
        this.padding,
        this.focus = false,
        this.maxLengthEnforced = true,
        this.suffixIconColor,
        this.inputAction,
        this.onSubmit,
        this.keepPadding = true,
        this.textCapitalization = TextCapitalization.none,
        this.controller,
        this.keyboardType,
        this.validator,
        this.borderOnlyError = false,
        this.onSaved,
        this.onSuffixTap,
        this.readOnly: false,
        this.maxLength,
        this.prefixIcon,
        this.bare = false,
        this.onTap,
        this.fontSize = 15.0,
        this.fontWeight = FontWeight.w500,
        this.autoValidate = false,
        this.hintColor,
        this.isEnabled = true})
      : super(key: key);

  final String hintText;

  // final String initialValue;
  final String type;
  final bool autoFocus;
  final IconData suffixIcon;
  final Color suffixIconColor;
  final Icon prefixIcon;
  final VoidCallback onTap;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final FormFieldValidator validator;
  final Function onSaved;
  final Function onSuffixTap;
  final Function onChanged;
  final Function onSubmit;
  final bool readOnly;
  final int maxLength;
  final int minLines;
  final int maxLines;
  final bool maxLengthEnforced;
  final bool bare;
  final bool isEnabled;
  final TextInputAction inputAction;
  final double fontSize;
  final FontWeight fontWeight;
  final bool keepPadding;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter> inputFormatters;
  final bool autoValidate;
  final EdgeInsets padding;
  final bool focus;
  final bool borderOnlyError;
  final Color hintColor;
  final String initialValue;
  @override
  _NewTextFieldsState createState() => _NewTextFieldsState();
}

class _NewTextFieldsState extends State<NewTextFields> {
  final FocusNode _focusNode = FocusNode();
  bool focus = false;
  bool view = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        focus = _focusNode.hasFocus;
      });
    });
  }

  @override
  void didUpdateWidget(NewTextFields oldWidget) {
    if (widget.focus) _focusNode.requestFocus();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  bool _determineReadOnly() {
    if (widget.readOnly != null && widget.readOnly) {
      _focusNode.unfocus();
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: Color(0xFF707070),
              width: 0.30),
          color: Colors.white),
      child: Container(
        margin: EdgeInsets.only(top: 8),
        padding: EdgeInsets.only(top: 8),


        child: TextFormField(
          enabled: widget.isEnabled,
          initialValue: widget.initialValue,
          keyboardAppearance: Theme.of(context).brightness,
          scrollPhysics: BouncingScrollPhysics(),
          autovalidate: widget.autoValidate,
          textCapitalization: widget.textCapitalization,
          onFieldSubmitted: widget.inputAction == TextInputAction.next
              ? (widget.onSubmit != null
              ? widget.onSubmit
              : (val) {
            _focusNode.nextFocus();
          })
              : widget.onSubmit,
          textInputAction: widget.inputAction,
          minLines: widget.minLines ?? 1,
          maxLines: widget.maxLines ?? 1,
          maxLengthEnforced: widget.maxLengthEnforced,
          onChanged: widget.onChanged,
          focusNode: _focusNode,
          maxLength: widget.maxLength ?? null,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          readOnly: _determineReadOnly(),
          obscureText: widget.type == "password" && !view ? true : false,
          autofocus: widget.autoFocus ?? false,
          validator: widget.validator,
          onSaved: widget.onSaved,
          style: Theme.of(context).textTheme.body2.copyWith(
              fontSize: widget.fontSize, fontWeight: widget.fontWeight, color: Color(0xFF575757), fontFamily: 'Poppins'),
          inputFormatters: widget.keyboardType == TextInputType.phone
              ? <TextInputFormatter>[
            WhitelistingTextInputFormatter.digitsOnly,
            _mobileFormatter,
          ]
              : widget.inputFormatters,
          decoration: InputDecoration(
            labelText: widget.hintText,
            labelStyle:
            TextStyle(color: Color(0xFF2E303A), fontSize:15,fontWeight: FontWeight.w700),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).errorColor.withOpacity(0.5),
                    width: 1.0),
                borderRadius: BorderRadius.circular(12.0)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).errorColor.withOpacity(0.5),
                    width: 1.0),
                borderRadius: BorderRadius.circular(8.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.circular(12)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.circular(12)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
