import 'package:flutter/material.dart';

import '../../../../constant/app_color.dart';
import '../../../../constant/common_text.dart';
import '../../../../constant/font_style.dart';
import '../../../../constant/mq_constant.dart';

class HeaderOne extends StatelessWidget {
  const HeaderOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: mqWidth75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: mqHeight20,
                width: mqWidth20,
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Icon(
                    Icons.check_circle_rounded,
                    color: primaryColor,
                    size: 19,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  color: brown9fColor,
                  height: 1,
                ),
              ),
              Container(
                height: mqHeight20,
                width: mqWidth20,
                padding: const EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                  border: Border.all(color: brown9fColor, width: 1),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    border: Border.all(color: primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  color: brown9fColor,
                  height: 1,
                ),
              ),
              Container(
                height: mqHeight20,
                width: mqWidth20,
                padding: const EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                  border: Border.all(color: brown9fColor, width: 1),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: mqWidth60, right: mqWidth60, top: mqHeight5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonText(text: "Address", fontSize: fo12, fontWeight: fBoldFont, fontColor: blackColor),
              Transform.translate(offset: const Offset(17, 0), child: CommonText(text: "Payment", fontSize: fo12, fontWeight: fBoldFont, fontColor: blackColor)),
              Transform.translate(offset: const Offset(15, 0), child: CommonText(text: "Confirm Order", fontSize: fo12, fontWeight: fBoldFont, fontColor: brown9fColor)),
            ],
          ),
        ),
      ],
    );
  }
}