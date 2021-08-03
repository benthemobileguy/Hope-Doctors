import 'package:flutter/material.dart';
import 'package:hope_doctor/screens/components/default-text-form-field.dart';
import 'package:hope_doctor/screens/components/main-button.dart';
import 'package:hope_doctor/screens/components/show-image-picker.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:hope_doctor/utils/alert-manager.dart';
import 'package:hope_doctor/utils/global-variables.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:image_picker/image_picker.dart';

class AddTipsScreen extends StatefulWidget {
  const AddTipsScreen({Key key}) : super(key: key);

  @override
  _AddTipsScreenState createState() => _AddTipsScreenState();
}

class _AddTipsScreenState extends State<AddTipsScreen> {
  final picker = ImagePicker();

  bool _isLoading = false;
  List<PickedFile> _images = [];
  ProgressDialog pr;

  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _tipsDescriptionController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pr = new ProgressDialog(context,
        isDismissible: false,
        type: ProgressDialogType.Normal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Add New Health Tip',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 250,
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
                          .height / 1.1),
                ),
                itemCount: _images.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {


                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: index == _images.length ?
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
                                  profileURL,
                                ))),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DefaultTextFormField(
              controller: _nameController,
              hintText: "Name of Health Tip",
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              validator: (val) {
                if (val.isEmpty) {
                  return 'Empty field';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            DefaultTextFormField(
              controller: _tipsDescriptionController,
              hintText: "Type Description Here",
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
              validator: (val) {
                if (val.isEmpty) {
                  return 'Empty field';
                }
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              width: 280,
              child: MainButton(
                onPressed: () {
                 createHealthTip();
                },
                borderColor: primaryColor,
                color: primaryColor,
                child: Center(
                  child: _isLoading?SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor:
                      new AlwaysStoppedAnimation<Color>(
                          Colors.white),
                    ),
                  ):Text(
                    "Create Health Tips",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Lato',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
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

  void createHealthTip() {
    if(_nameController.text!=''&&_tipsDescriptionController!=''){
      setState(() {
        _isLoading = true;
      });
    }else{
      AlertManager.showToast('Please fill in all details');
    }
  }
}
