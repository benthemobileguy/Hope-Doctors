import 'package:flutter/material.dart';
import 'package:hope_doctor/bloc/default.dart';
import 'package:hope_doctor/screens/components/main-button.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:hope_doctor/utils/color.dart';
import 'package:provider/provider.dart';
class ShopDetailsScreen extends StatefulWidget {
  final int index;
  const ShopDetailsScreen({Key key, this.index}) : super(key: key);

  @override
  _ShopDetailsScreenState createState() => _ShopDetailsScreenState();
}

class _ShopDetailsScreenState extends State<ShopDetailsScreen> {
  MainBloc mainBloc;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    mainBloc = Provider.of<MainBloc>(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          mainBloc.marketShop[widget.index].title,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Lato',
            color: normalTextBold,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 30,
          ),
          color: textColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    new Image.asset(
                      'images/delete.png',
                      width: 40,
                      height: 40,),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Delete Product",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Lato',
                        color: customRed,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height *0.5,
                  width: MediaQuery.of(context).size.width *0.5,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color:
                      primaryColor.withOpacity(0.3),
                          width: 2),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            "${mainBloc.marketShop[widget.index].files[0]}",
                          ))),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        "AVAILABLE IN STOCK",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
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
                          fontSize: 16,
                          fontFamily: 'Lato',
                          color: darkerText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "${mainBloc.marketShop[widget.index].quantity}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Lato',
                          color: normalTextBold,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 170,
                      ),
                      Text(
                        "0",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Lato',
                          color: normalTextBold,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: 180,
                  child: MainButton(
                    onPressed: (){

                    },
                    borderColor: primaryColor,
                    color: primaryColor,
                    child: Row(
                      children: [
                        Text(
                          "Add Outside Sale",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Lato',
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        new Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 30,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    'N${mainBloc.marketShop[widget.index].price}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: 'Lato',
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    mainBloc.marketShop[widget.index].desc,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Lato',
                      color: darkerText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
