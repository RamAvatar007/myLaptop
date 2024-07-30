import 'package:flutter/material.dart';


//// ============= Custom Padding Height And Width  =========== /////
extension CustomPadding on num{
  SizedBox get ph => SizedBox(height: toDouble(),);
  SizedBox get pw => SizedBox(width: toDouble(),);


  ///////////  then apply
////////////  like for ex.  10.ph = 10 Padding on height,,,,,20.pw = 10 Padding on height
}