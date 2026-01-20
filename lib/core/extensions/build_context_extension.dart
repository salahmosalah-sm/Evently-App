import 'package:flutter/cupertino.dart';

extension BuildContextHelper on BuildContext {
  double get contextWight => MediaQuery.sizeOf(this).width;

  double get contextHeight => MediaQuery.sizeOf(this).height;
}
