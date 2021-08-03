import 'package:flutter/material.dart';
import 'package:hope_doctor/bloc/default.dart';
import 'package:hope_doctor/screens/health-tips/add-tips-screen.dart';
import 'package:hope_doctor/screens/health-tips/health-tips-details-screen.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:provider/provider.dart';
class HealthTipsComponent extends StatelessWidget {
  const HealthTipsComponent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainBloc mainBloc = Provider.of<MainBloc>(context);
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.2),
        ),
        itemCount: mainBloc.healthTips.length + 1,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              index != mainBloc.healthTips.length?
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)
                  => HealthTipsDetailsScreen(
                   index:index
                  ))):
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)
                  => AddTipsScreen()));
            },
            child: Container(
              width: 160,
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 12, vertical:12 ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical:12 ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all
                    (Radius.circular(8)),
                  border: Border.all(color: Color.fromRGBO
                    (7, 121, 101, 0.8), width: 1)
              ),
              child:  index == mainBloc.healthTips.length?
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Image.asset("images/add_circle.png",
                    width: 64,
                    height: 64,),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "ADD NEW",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Lato',
                      color: darkerText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              )
                  :Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TITLE",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Lato',
                      color: darkerText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    mainBloc.healthTips[index].segment,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Lato',
                      color: normalTextBold,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "VIEWS",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Lato',
                          color: darkerText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "MEDIA",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Lato',
                          color: darkerText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${mainBloc.healthTips[index].healthTipViewCount}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14.5,
                          fontFamily: 'Lato',
                          color: greyColor2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 44,
                      ),
                      Text(
                        "${mainBloc.healthTips[index].files.length} FILES",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14.5,
                          fontFamily: 'Lato',
                          color: greyColor2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}