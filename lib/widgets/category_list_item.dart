import 'package:flutter/material.dart';

import '../styles.dart';

class CategoryListItem extends StatelessWidget {

  final String _title;
  final String _imageUrl;

  CategoryListItem(this._title, this._imageUrl);

  @override
  Widget build(BuildContext context) {

    MediaQueryData mediaQuery = MediaQuery.of(context);

    print(mediaQuery.size.height);

    return InkWell(
      onTap: (){

      },
      borderRadius: BorderRadius.circular(DefaultCardPadding),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RoundedCardRadius),
        ),
        elevation: DefaultCardElevation,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(RoundedCardRadius),
                    topRight: Radius.circular(RoundedCardRadius),
                    bottomLeft: Radius.circular(RoundedCardRadius),
                    bottomRight: Radius.circular(RoundedCardRadius)
                ),
                child: FittedBox(
                  child: Image.asset(_imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.all(5),
                  child: Text(
                    _title,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          )

      ),
    );
  }
}





