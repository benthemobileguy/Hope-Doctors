import 'package:flutter/material.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:hope_doctor/utils/global-variables.dart';
class HealthTipViewComponent extends StatelessWidget {
  const HealthTipViewComponent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: healthTipViews.length,
      itemBuilder: (BuildContext context, int index) {
        return Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: healthTipViews[index].view==0?
            MediaQuery.of(context).size.width * 0.3:
            MediaQuery.of(context).size.width,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: greyColor2,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    healthTipViews[index].segment,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Lato',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "${healthTipViews[index].view} views",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Lato',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}