import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAssets {
  static const String icLogo = '';
}

class AppImage {
  static Widget network(
      {required String url,
      BoxFit fit = BoxFit.fill,
      double? width,
      double? height,
      Color color = Colors.transparent}) {
    return Container(
      color: color,
      width: width,
      height: height,
      child: (url != '')
          ? Image.network(
              url,
              fit: fit,
            )
          : const SizedBox(),
    );
  }

  static Widget asset(
      {@required String? assetPath,
      Color color = Colors.transparent,
      BoxFit fit = BoxFit.fill,
      double? width,
      double? height}) {
    final imagePath = assetPath ?? '';
    final isSVG = imagePath.endsWith('.svg');

    if (assetPath == null) return Container();

    return Container(
      color: color,
      child: isSVG
          ? SvgPicture.asset(
              assetPath,
              fit: fit,
              width: width,
              height: height,
            )
          : Image.asset(
              assetPath,
              width: width,
              height: height,
              fit: fit,
            ),
    );
  }
}
