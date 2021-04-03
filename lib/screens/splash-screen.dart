import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  List<bool> isCustomised;
  MainBloc mainBloc;
  Animation<double> animation;
  AnimationController _controller;
  Animation<double> _animation;
  PrefManager prefManager = PrefManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: ScaleTransition(
            scale: _animation,
            alignment: Alignment.center,
            child: Hero(
              tag: "logo",
              child: new Image.asset(
                'images/logo.png',
                fit: BoxFit.cover,
                width: 300,
              ),
            ),
          )),
    );
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    mainBloc = Provider.of<MainBloc>(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        value: 0.1,
        vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
    //Splash screen delay before passing moving to next screen
    Future.delayed(Duration(seconds: 8), () {
      checkLoginState();
    });
  }

  void checkLoginState() async {
    prefManager.getAuthToken().then((value){
      mainBloc.bearerToken = value;
      if(value!=null){
        prefManager.getUserData().then((value) {
          mainBloc.user = value;
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)
              => Base()));
        });
      } else{
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)
            => WelcomeScreen()));
      }
    });


  }
}
