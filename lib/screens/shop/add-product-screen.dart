import 'package:flutter/material.dart';
import 'package:hope_doctor/bloc/default.dart';
import 'package:hope_doctor/services/shop/index.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:hope_doctor/utils/alert-manager.dart';
import 'package:hope_doctor/utils/constants.dart';
import 'package:hope_doctor/utils/global-variables.dart';
import 'package:hope_doctor/screens/components/default-text-form-field.dart';
import 'package:hope_doctor/screens/components/main-button.dart';
import 'package:hope_doctor/screens/components/show-image-picker.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final picker = ImagePicker();

  List<PickedFile> _images = [];
  ProgressDialog pr;

  final TextEditingController _productNameController = new TextEditingController();
  final TextEditingController _stockAvailableController = new TextEditingController();
  final TextEditingController _productPriceController = new TextEditingController();
  final TextEditingController _productDescriptionController = new TextEditingController();

  MainBloc mainBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pr = new ProgressDialog(context,
        isDismissible: false,
        type: ProgressDialogType.Normal);
  }

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
        body: Container(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
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
                    onPressed: () {
                      uploadToServer();
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

  Future<void> uploadToServer() async {
    if (_productNameController.text != '' && _productPriceController.text != ''
        && _stockAvailableController.text != '' &&
        _productDescriptionController.text != '') {
      Dio dio = new Dio();
      pr.show();
      // String fileName = image.path
      //     .split('/')
      //     .last;
      String fileName = '';
      // print(image.path);
      //  FormData formData = FormData.fromMap({
      //    "image": await MultipartFile.fromFile(
      //        image.path,
      //        filename: fileName),
      //  });
      FormData formData = FormData.fromMap({
        "title": _productNameController.text,
        "price" : _productPriceController.text,
        "desc" : _productDescriptionController.text,
        "quantity": _stockAvailableController.text,
        'files': [
          await _images.asMap().forEach((index, value) async {
            await MultipartFile.fromFile
              (_images[index].path, filename:
            'fileName');
          }),]
      });
      try {
        Response response = await dio.post(
            Constants().API_BASE_URL +
                "store/create",
            data: formData,
            options: Options(
                responseType: ResponseType.json,
                headers: {
                  "Authorization": "Bearer ${mainBloc.bearerToken}",
                  "Accept": "application/json",
                }
            ));
        print("res"+response.data.toString());
        print(response.statusCode.toString());
        pr.hide();
        print("This is the form data response: ${response.data}");
        return response.data;
      } catch (e) {
        print(e.toString());
        AlertManager.showToast(e.toString());
        pr.hide();
      }
    }else{
      AlertManager.showToast('Please fill in all the fields');
    }
  }
}