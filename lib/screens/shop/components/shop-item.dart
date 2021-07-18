import 'package:flutter/material.dart';
import 'package:hope_doctor/bloc/default.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:provider/provider.dart';
class ShopItem extends StatelessWidget {
  const ShopItem({
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
              (MediaQuery.of(context).size.height / 1.1),
        ),
        itemCount: mainBloc.marketShop.length + 1,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child:  index == mainBloc.marketShop.length?
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical:6 ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all
                    (Radius.circular(8)),
                  border: Border.all(color: Color.fromRGBO
                    (7, 121, 101, 0.8), width: 1)
              ),
              child:  Column(
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
              ),
            ):Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 130,
                  width: 240,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color:
                      primaryColor.withOpacity(0.3),
                          width: 2),
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(
                            "images/img_1.png",
                          ))),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "${mainBloc.marketShop[index].title}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Lato',
                      color: normalTextBold,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        "AVAILABLE IN STOCK",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Lato',
                          color: darkerText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Text(
                        "RESERVED PRODUCTS",
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
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "${mainBloc.marketShop[index].quantity}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Lato',
                          color: normalTextBold,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 107,
                      ),
                      Text(
                        "0",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Lato',
                          color: normalTextBold,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );

        },
      ),
    );
  }
}