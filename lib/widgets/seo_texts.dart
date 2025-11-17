import 'package:flutter/material.dart';
import 'package:seo_renderer/seo_renderer.dart';

class SeoTexts extends StatelessWidget {
  const SeoTexts({
    super.key,
    required this.text,
    this.textAlign,
    this.style,
    this.maxLines,
    this.overflow,
    this.textRendererStyle,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextRendererStyle? textRendererStyle;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: style,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign);
  }
}
