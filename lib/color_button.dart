import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {

  final ColorModel _item;

  ColorItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.all(15.0),
      child: Stack(
        children: <Widget>[

          _item.isSelected
            ? Container(
              width: 27,
              height: 31,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(_item.image))
              ),
              )
            : Container(
                width: 27,
                height: 31,

              ),

          Positioned(
            top: 10,
            left: 10,
            child: new Container(
                width: 10,
                height: 10,
                decoration: new BoxDecoration(
                    color: _item.color,
                    borderRadius: BorderRadius.circular(9.85)
                )
            ),
          )

        ],
      ),

    );
  }
}

class ColorModel {
  bool isSelected;
  final Color color;
  String image;

  ColorModel(this.isSelected, this.color, this.image);

}
