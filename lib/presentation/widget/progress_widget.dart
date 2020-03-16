import 'package:flutter/material.dart';

class ProgressWidget extends StatefulWidget{
  final String progressTitle;
  final String nominal;
  final Function showFunction;
  final Function hideFunction;

  ProgressWidget({this.progressTitle = '', this.nominal='', this.showFunction, this.hideFunction});

  @override
  _ProgressWidgetState createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  bool _isClicked = false;
  static const SHOW = 'Show';
  static const HIDE = 'Hide';
  _onPressedShowButton(){
    setState(() {
      _isClicked = !_isClicked;
    });

    if(!_isClicked){
      widget.hideFunction();
    }else{
      widget.showFunction();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                this.widget.progressTitle,
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              Container(
                width: 68,
                child: RaisedButton(
                  onPressed: ()=>_onPressedShowButton(),
                  child: Text(_isClicked?HIDE:SHOW),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: 1,
                color: Colors.grey,
              ),
              Text(
                'Rp.'
              ),
              Text(
                this.widget.nominal,
                style: TextStyle(
                    fontWeight: FontWeight.w900, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}