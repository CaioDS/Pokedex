import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Widget child;

  LoadingWidget({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Colors.amber),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Carregando...',
              style: TextStyle(color: Colors.amber),
            ),
          )
        ],
      ),
    );
  }
}
