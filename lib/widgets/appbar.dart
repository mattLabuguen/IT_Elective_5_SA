import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_summative/shared/constants.dart';

class Header extends StatelessWidget implements PreferredSizeWidget{
  final AppBar appBar;
  final AutoSizeText title;
  const Header({Key key, this.appBar, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: accentColors[1],
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}