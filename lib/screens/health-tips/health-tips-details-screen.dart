import 'package:flutter/material.dart';
import 'package:hope_doctor/bloc/default.dart';
import 'package:hope_doctor/screens/components/show-image-picker.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:hope_doctor/utils/global-variables.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
class HealthTipsDetailsScreen extends StatefulWidget {
  final int index;
  const HealthTipsDetailsScreen({Key key, this.index}) : super(key: key);

  @override
  _HealthTipsDetailsScreenState createState() => _HealthTipsDetailsScreenState();
}

class _HealthTipsDetailsScreenState extends State<HealthTipsDetailsScreen> {
  MainBloc mainBloc;
  final picker = ImagePicker();

  List<PickedFile> _images = [];
  ProgressDialog pr;
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
        actions: [
          new ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      '${mainBloc.healthTips[widget.index].segment}',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Lato',
                        color: customRed,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    content: Text(
                      'Are you sure you want to delete this health tip?',
                      style: TextStyle(
                        fontSize: 14.5,
                        fontFamily: 'Lato',
                        color: chatTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    actions: <Widget>[
                      new TextButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop(
                              false); // dismisses only the dialog and returns false
                        },
                        child: Text(
                          'No',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Lato',
                            color: textColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          deleteTip();
                        },
                        child: Text(
                          'Yes',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Lato',
                            color: customRed,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: Image.asset('images/delete.png',
              height: 45,width: 45,),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
            ),
          )
        ],
        title: Text(
          '${mainBloc.healthTips[widget.index].segment}',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 25,
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
      body:  Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: MediaQuery
                      .of(context)
                      .size
                      .width /
                      (MediaQuery
                          .of(context)
                          .size
                          .height / 0.85),
                ),
                itemCount:mainBloc.healthTips[widget.index].files.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {


                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: index == mainBloc.healthTips[widget.index].files.length ?
                      GestureDetector(
                        onTap: () {
                          showImagePicker(context, () {
                            getImageFromCamera();
                          }, () {
                            getImageFromGallery();
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 60),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all
                                (Radius.circular(8)),
                              border: Border.all(color: Color.fromRGBO
                                (7, 121, 101, 0.8), width: 1.5)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new Image.asset("images/add_circle.png",
                                width: 60,
                                height: 60,),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Click To Add",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  color: darkerText,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ) : Container(
                        height: 140,
                        width: 240,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color:
                            primaryColor.withOpacity(0.3),
                                width: 2),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  mainBloc.healthTips[widget.index].files[index],
                                ))),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
  void getImageFromCamera() async {
    var selectedImg = await picker.getImage(
        source: ImageSource.camera, maxHeight: 480, maxWidth: 640);
    if (selectedImg != null) {
      setState(() {
        _images.add(selectedImg);
      });
      Navigator.pop(context);
    }
  }

  void getImageFromGallery() async {
    var selectedImg = await picker.getImage(
        source: ImageSource.gallery, maxHeight: 480, maxWidth: 640);
    setState(() {
      _images.add(selectedImg);
    });
    Navigator.pop(context);
  }

  void deleteTip() {
    Navigator.pop(context);
  }
}
