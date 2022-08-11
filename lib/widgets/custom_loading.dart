import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoadingDialog {
  static void showLoading(BuildContext context, GlobalKey key,
      [String message = 'Loading...']) async {
    final dialog = Dialog(
      key: key,
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitCubeGrid(
            color: Colors.blue,
            size: 50.0,
          ),
          SizedBox(height: 16.0),
          Text(
            message,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );

    await showDialog(
      context: context,
      builder: (BuildContext context) => dialog,
      barrierDismissible: false,
    );
  }

  static void hideLoading(GlobalKey key) {
    if (key.currentContext != null) {
      Navigator.of(key.currentContext!, rootNavigator: true).pop();
    } else {
      Future.delayed(Duration(milliseconds: 300)).then((value) =>
          Navigator.of(key.currentContext!, rootNavigator: true).pop());
    }
  }

  static Widget getLoading({double size = 50.0}) => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SpinKitCubeGrid(color: Colors.blue, size: size),
      );
}
