import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final Widget titleWidget;
  final double elevation;
  final TextStyle titleStyle;
  final Color backgroundColor;
  final Widget leftBarButtonItem;
  final List<Widget> rightBarButtonItems;
  final double titleSpacing;
  final bool automaticallyImplyLeading;
  final bool centerTitle;

  CommonAppBar({
    this.title,
    this.titleStyle,
    this.titleWidget,
    this.titleSpacing = 0.0,
    this.elevation = 0.0,
    this.backgroundColor,
    this.leftBarButtonItem,
    this.rightBarButtonItems,
    this.automaticallyImplyLeading = true, 
    this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: _buildTitle(),
      elevation: elevation,
      backgroundColor: AppColors.primaryColor,
      titleSpacing: titleSpacing,
      leading: _buildLeading(),
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: centerTitle ?? true,
      actions: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: rightBarButtonItems ?? <Widget>[],
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  Widget _buildTitle() {

    final titleBarText = title ?? '';
    final titleBarTextStyle = titleStyle 
      ?? TextStyle(fontWeight: FontWeight.normal, fontSize: 17);

    return titleWidget ?? Text(titleBarText, style: titleBarTextStyle);

  }

  Widget _buildLeading() {

    return (leftBarButtonItem != null) 
      ? Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 0), 
        child: leftBarButtonItem) 
      : null;

  }

}
