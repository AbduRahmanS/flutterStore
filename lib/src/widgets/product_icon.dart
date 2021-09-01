import 'package:flutter/material.dart';
import 'package:sangamarket/src/model/category.dart';
import 'package:sangamarket/src/themes/light_color.dart';
import 'package:sangamarket/src/themes/theme.dart';
import 'package:sangamarket/src/widgets/title_text.dart';
import 'package:sangamarket/src/widgets/extentions.dart';

class ProductIcon extends StatelessWidget {
  // final String imagePath;
  // final String text;
  final ValueChanged<Category> onSelected;
  final Category model;
  ProductIcon({Key? key, required this.model, required this.onSelected}) : super(key: key);

  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    if (model.id == null) {
      return Container(width: 5);
    } else {
      return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Container(
              padding: AppTheme.hPadding,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: model.isSelected ? LightColor.background : Colors.transparent,
                border: Border.all(
                  color: model.isSelected ? LightColor.green : LightColor.grey,
                  width: model.isSelected ? 2 : 1,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: model.isSelected ? Color(0xfffbf2ef) : Colors.white,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  if (model.icon != null) model.icon else SizedBox(),
                  // ignore: unnecessary_null_comparison
                  if (model.name == null) Container() else Container(
                          child: TitleText(
                            text: model.name,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        )
                ],
              ),
            ).ripple(
              () {
                onSelected(model);
              },
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          );
    }
  }
}
