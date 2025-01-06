import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _kDefaultSize = 45.0;
const _kDefaultPlaceholderSize = 40.0;

class CustomNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final String imageUrl;
  final double? percent;
  final Color? color;
  final bool isAvatar;
  final String? placeholder;
  final Alignment? alignment;
  final BoxFit? fit;
  final bool constrainedSize;
  final void Function(dynamic error)? onError;
  final bool showPlaceholder;
  final Widget? errorWidget;
  final BoxBorder? border;
  final bool isSvg;

  const CustomNetworkImage({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    this.radius,
    this.percent,
    this.color,
    this.alignment,
    this.isAvatar = false,
    this.fit,
    this.constrainedSize = true,
    this.onError,
    this.showPlaceholder = true,
    this.errorWidget,
    this.placeholder,
    this.border,
    this.isSvg = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatarBorderRadius = ((height ?? width ?? _kDefaultSize) * 1.15);
    return Container(
      decoration: border == null
          ? null
          : BoxDecoration(
              borderRadius: BorderRadius.circular(
                  (radius ?? (isAvatar ? avatarBorderRadius : 0)) +
                      ((radius ?? 0) == 0 ? 0 : 10)),
              border: border,
            ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
            radius ?? (isAvatar ? avatarBorderRadius : 0)),
        child: Container(
            height: height ?? _kDefaultSize,
            width: constrainedSize ? (width ?? _kDefaultSize) : null,
            color: color ?? Color(0XFFDBDBDB),
            child: isSvg
                ? SvgPicture.network(
                    alignment: alignment ?? Alignment.center,
                    imageUrl,
                    fit: fit ?? BoxFit.cover,
                  )
                : CachedNetworkImage(
                    alignment: alignment ?? Alignment.center,
                    imageUrl: imageUrl,
                    fit: fit ?? BoxFit.cover,
                    placeholder: (_, __) => showPlaceholder
                        ? _placeholder
                        : const SizedBox.shrink(),
                    errorWidget: (_, __, e) {
                      onError?.call(e);
                      return errorWidget ?? _placeholder;
                    },
                  )),
      ),
    );
  }

  Widget get _placeholder => Container(
      height: (height ?? _kDefaultPlaceholderSize) * (percent ?? .65),
      width: (width ?? _kDefaultPlaceholderSize) * (percent ?? .65),
      color: color ?? Color(0XFFDBDBDB),
      child: Center(
        child: isAvatar
            ? SvgPicture.asset(
                'assets/images/image_placeholder.svg',
                colorFilter: ColorFilter.mode(
                  Colors.black.withAlpha((0.2 * 255).toInt()),
                  BlendMode.srcIn,
                ),
                height: (height ?? 40) * .425,
              )
            : placeholder != null
                ? SvgPicture.asset(
                    placeholder!,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withAlpha((0.2 * 255).toInt()),
                      BlendMode.srcIn,
                    ),
                    height: (height ?? 40) * .425,
                  )
                : const SizedBox.shrink(),
      ));
}
