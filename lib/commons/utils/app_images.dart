import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAssets {

  static const String icLogo = '';

}

class AppImage {

  static Widget network({
    @required String url, 
    BoxFit fit = BoxFit.fill, 
    double width, 
    double height, 
    Color color,
    String placeholder,
  }) {

    return Container(
      color: color ?? Colors.transparent,
      width: width,
      height: height,
      child: (url != null && url != '') ? Image.network(
        url,
        fit: fit,
      ) : const SizedBox(),
    );
  
  }

  static Widget asset({
    @required String assetPath, 
    Color color, 
    BoxFit fit = BoxFit.fill, 
    double width, 
    double height}
  ) {

    final imagePath = assetPath ?? '';
    final isSVG = imagePath.endsWith('.svg');

    return Container(
      color: color ?? Colors.transparent,
      child: isSVG ? SvgPicture.asset(
          assetPath,
          fit: fit,
          width: width,
          height: height,
        ) : Image.asset(
        assetPath,
        width: width,
        height: height,
        fit: fit,
      ),
    );

  }

}