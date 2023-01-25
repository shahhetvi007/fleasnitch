import 'package:fleasnitch/ui/res/color_resources.dart';
import 'package:fleasnitch/ui/res/dimen_resources.dart';
import 'package:fleasnitch/ui/res/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Text getSmallText(String text,
    {bool bold = false,
    Color color = colorWhite,
    double fontSize = SUBTITLE_FONT_SIZE,
    // TextAlign align,
    FontWeight weight = FontWeight.w400,
    bool isCenter = false,
    bool underLine = false}) {
  return Text(
    text,
    // textAlign: align,
    maxLines: 5,
    style: TextStyle(
        decoration: underLine ? TextDecoration.underline : null,
        color: color,
        fontWeight: weight,
        fontSize: fontSize,
        fontFamily: "Nunito"),
    overflow: TextOverflow.ellipsis,
  );
}

Text getTitle(
  String text, {
  bool bold = false,
  bool isCenter = false,
  FontWeight weight = FontWeight.w500,
  double fontSize = TITLE_TEXT_FONT_SIZE,
  Color color = colorWhite,
  bool softWrap = false,
  // int lines
}) {
  return Text(
    text,
    // maxLines: lines,
    textAlign: isCenter ? TextAlign.center : TextAlign.start,
    style: TextStyle(
        color: color, fontSize: fontSize, fontWeight: weight, fontFamily: 'Nunito'),
    softWrap: softWrap,
    overflow: softWrap ? TextOverflow.visible : TextOverflow.ellipsis,
  );
}

loader() {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Loading..."),
          Container(
            margin: const EdgeInsets.all(VERTICAL_PADDING),
            child: const CircularProgressIndicator(
              backgroundColor: Colors.black26,
              valueColor: AlwaysStoppedAnimation<Color>(
                colorWhite, //<-- SEE HERE
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget commonTextFormField({
  required BuildContext context,
  Icon? prefixIcon,
  String hintText = '',
  String labelText = "",
  bool obscureText = false,
  bool readOnly = false,
  TextInputType keyboardType = TextInputType.text,
  TextInputAction textInputAction = TextInputAction.next,
  TextCapitalization textCapitalization = TextCapitalization.sentences,
  int maxLines = 1,
  TextEditingController? controller,
  String? Function(String?)? validator,
  void Function(String)? onTextChanged,
}) {
  return TextFormField(
    keyboardType: keyboardType,
    textInputAction: textInputAction,
    textCapitalization: textCapitalization,
    controller: controller,
    validator: validator,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onChanged: onTextChanged,
    obscureText: obscureText,
    decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: colorBlack, fontFamily: 'Nunito'),
        labelText: labelText,
        labelStyle: const TextStyle(color: colorBlack, fontFamily: 'Nunito'),
        prefixIcon: prefixIcon,
        prefixIconColor: colorBlack,
        contentPadding: EdgeInsets.zero,
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: colorBlack),
          borderRadius: BorderRadius.circular(BORDER_RADIUS),
        )),
  );
}
