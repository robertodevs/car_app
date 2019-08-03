import 'package:flutter/material.dart';

class RadioItem extends StatelessWidget {

  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.all(10.0),
      child: new Container(
          width: 64,
          height: 62,
          child: Column(
            children: <Widget>[
              SizedBox(height: 10,),
              // Image icon
              Image(
                image: _item.isSelected
                  ? AssetImage(_item.image+'_white.png')
                  : AssetImage(_item.image+'_black.png')
                ,
              ),
              SizedBox(height: 10,),
              // Text label
              new Text(_item.text,
                  style: _item.isSelected ?
                    TextStyle(
                      fontFamily: 'RobotoMono',
                      color: Color(0xffffffff),
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0,

                    )
                    :
                  TextStyle(
                    fontFamily: 'RobotoMono',
                    color: Color(0xff020202),
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,

                  )
              )
            ],

          ),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(9.846153846153847),
            gradient: _item.isSelected ? LinearGradient(colors: [
              Color(0xff3c80f7),
              Color(0xff1058d1) ],
                stops: [
                  0,
                  1
                ]
            )
            :
            LinearGradient(colors: [
              Colors.white,
              Colors.white ],
                stops: [
                  0,
                  1
                ]
            ),
            boxShadow: [BoxShadow(
                color: Color(0x3b000000),
                offset: Offset(0,2),
                blurRadius: 4,
                spreadRadius: 0

            ) ],

          )
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String text;
  final String image;

  RadioModel(this.isSelected, this.buttonText, this.text, this.image);

}
