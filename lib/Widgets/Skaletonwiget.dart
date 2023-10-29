import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

class skaletonWidget extends StatelessWidget {
  const skaletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          color: Color.fromRGBO(46, 51, 90, 100),
        ),
        baseColor: Color.fromRGBO(0, 0, 0, 0.15),
        highlightColor: Color.fromRGBO(255, 255, 255, 0.15));
  }
}
