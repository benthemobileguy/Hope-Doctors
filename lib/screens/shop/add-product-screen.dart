import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:hope_doctor/screens/components/default-text-form-field.dart';
import 'package:hope_doctor/screens/components/main-button.dart';
import 'package:hope_doctor/screens/components/show-image-picker.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  ProgressDialog pr;
  PickedFile _image;
  final picker = ImagePicker();

  final TextEditingController _productNameController= new TextEditingController();
  final TextEditingController _stockAvailableController= new TextEditingController();
  final TextEditingController _productPriceController= new TextEditingController();
  final TextEditingController _productDescriptionController= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Add New Product',
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
      body:   Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: (){
                  showImagePicker(context, () {
                    getImageFromCamera();
                  }, () {
                    getImageFromGallery();
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical:60 ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all
                        (Radius.circular(8)),
                      border: Border.all(color: Color.fromRGBO
                        (7, 121, 101, 0.8), width: 1.5)
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
                        "Click To Add Image",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Lato',
                          color: darkerText,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              DefaultTextFormField(
                controller: _productNameController,
                hintText: "Product Name",
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
              DefaultTextFormField(
                controller: _productPriceController,
                hintText: "Product Price",
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.number,
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
              DefaultTextFormField(
                controller: _stockAvailableController,
                hintText: "Stock Available",
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.number,
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
              DefaultTextFormField(
                controller: _productDescriptionController,
                hintText: "Product Description",
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
                  onPressed: (){

                  },
                  borderColor: primaryColor,
                  color: primaryColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      new Image.asset(
                        'images/icons/cart.png',
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Text(
                        "Create Product",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Lato',
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  void getImageFromCamera() async{
    var selectedImg = await picker.getImage(source: ImageSource.camera, maxHeight: 480, maxWidth: 640);
    if (selectedImg != null) {
      pr = new ProgressDialog(context, type: ProgressDialogType.Normal);
      //Dialog Style
      pr.style(
        message: 'Uploading your image...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor:  new AlwaysStoppedAnimation<Color>(
              primaryColor),
        ),
        elevation: 10.0,
        insetAnimCurve: Curves.bounceIn,
        progressTextStyle: TextStyle(color: customTextColor, fontSize: 14.0),
        messageTextStyle: TextStyle(color: customTextColor, fontSize: 14.0),
      );
      setState(() {
        _image = selectedImg;
      });
      uploadtoServer(_image);
      Navigator.pop(context);
      pr.show();
    }
  }

  void getImageFromGallery() async{
    var selectedImg = await picker.getImage(source: ImageSource.gallery,maxHeight: 480, maxWidth: 640);
    if (selectedImg != null) {
      pr = new ProgressDialog(context, type: ProgressDialogType.Normal);
      //Dialog Style
      pr.style(
        message: 'Uploading your image...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor:  new AlwaysStoppedAnimation<Color>(
              primaryColor),
        ),
        elevation: 10.0,
        insetAnimCurve: Curves.bounceIn,
        progressTextStyle: TextStyle(color: customTextColor, fontSize: 14.0),
        messageTextStyle: TextStyle(color: customTextColor, fontSize: 14.0),
      );
      setState(() {
        _image = selectedImg;
      });
      uploadtoServer(_image);
      Navigator.pop(context);
      pr.show();
    }
  }

  void uploadtoServer(PickedFile image) {

  }
}
