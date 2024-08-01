import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  void initState() {
    super.initState();
    // // Simulate a delay for the splash screen
    // Future.delayed(Duration(seconds: 1), () {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         backgroundColor: Colors.black,
    //         content: Text(
    //           'Prithvee Steel has not made payment to the developer due to that reason this app is temporary down untill we get the payment.',
    //           style: TextStyle(color: Colors.white,fontSize: 30),
    //         ),
    //
    //       );
    //     },
    //     barrierDismissible: false, // Ensure user cannot dismiss the dialog by tapping outside
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body:Center(
          child: Text(
            'Prithvee Steel has not made payment to the developer due to that reason this app is temporary down untill we get the payment.',
           textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white,fontSize: 25,),
          ),
        ),
      ),
    );
  }
}
