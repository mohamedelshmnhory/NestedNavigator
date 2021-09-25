import 'package:flutter/material.dart';

const style1 = TextStyle(color: Colors.white, fontSize: 16);

var boxDecoration1 = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: const <Color>[
      Colors.transparent,
      Colors.black54,
    ],
  ),
);
