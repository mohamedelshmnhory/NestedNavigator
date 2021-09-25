import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shormehh/shared/styles/colors.dart';

Widget defaultButton({
  double height = 50,
  double width = double.infinity,
  Color background = defaultColor2,
  Color textColor = Colors.white,
  bool isUpperCase = true,
  double radius = 30.0,
  double textSize = 18,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: textSize),
        ),
        splashColor: Colors.transparent,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.3),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: Offset(0, 3), // changes position of shadow
        //   ),
        // ],
      ),
    );

ClipPath buildClipAppBar(BuildContext context, String text) {
  return ClipPath(
    clipper: OvalBottomBorderClipper(),
    child: Container(
      height: 170,
      color: defaultColor2,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
      child: Center(
          child: Row(
        children: [
          CircleAvatar(
            backgroundColor: primary,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      )),
    ),
  );
}

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
  IconData? prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
  min = 1,
  double prefixWidth = 45,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      autocorrect: false,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: (_) => onSubmit,
      onChanged: (_) => onChange,
      onTap: () => onTap,
      validator: (_) {
        validate();
      },
      minLines: min,
      maxLines: isPassword ? 1 : null,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(color: Colors.black, fontSize: 16),
        filled: true,
        fillColor: Colors.white70,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        // border: InputBorder.none,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        prefixIcon: Icon(
          prefix,
          color: defaultColor2,
        ),
        prefixIconConstraints: BoxConstraints(minWidth: prefixWidth),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () => suffixPressed,
                icon: Icon(
                  suffix,
                  color: defaultColor2,
                  size: 25,
                ),
              )
            : null,
        // border: OutlineInputBorder(),
      ),
    );
