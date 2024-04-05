import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palumba_eu/utils/common_ui/app_colors.dart';

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
          color: color ?? AppColors.beige,
          child: CachedNetworkImage(
            alignment: alignment ?? Alignment.center,
            imageUrl: imageUrl,
            fit: fit ?? BoxFit.cover,
            placeholder: (_, __) =>
                showPlaceholder ? _placeholder : const SizedBox.shrink(),
            errorWidget: (_, __, e) {
              onError?.call(e);
              return errorWidget ?? _placeholder;
            },
          ),
        ),
      ),
    );
  }

  Widget get _placeholder => Container(
      height: (height ?? _kDefaultPlaceholderSize) * (percent ?? .65),
      width: (width ?? _kDefaultPlaceholderSize) * (percent ?? .65),
      color: color ?? AppColors.beige,
      child: Center(
        child: isAvatar
            ? SvgPicture.asset(
                'assets/images/image_placeholder.svg',
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(.2),
                  BlendMode.srcIn,
                ),
                height: (height ?? 40) * .425,
              )
            : placeholder != null
                ? SvgPicture.asset(
                    placeholder!,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(.2),
                      BlendMode.srcIn,
                    ),
                    height: (height ?? 40) * .425,
                  )
                : const SizedBox.shrink(),
      ));
}