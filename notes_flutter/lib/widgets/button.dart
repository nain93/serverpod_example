import 'package:flutter/material.dart';

enum ButtonType {
  solid,
  outline,
}

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.buttonType = ButtonType.solid,
    this.text = '',
    this.width,

    /// Adhoc used for button with default width but with specific height
    this.height = 52,
    this.onPressed,
    this.color = Colors.white,
    this.fontWeight = FontWeight.w700,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.showContainerBackground = false,
    this.margin = const EdgeInsets.only(left: 0, right: 0),
    this.padding,
    this.borderRadius = 8.0,
    this.borderWidth = 0.0,
    this.borderColor,
    this.loading = false,
    this.disabled = false,
    this.autofocus = false,
    this.leftWidget,
    this.rightWidget,
    this.textStyle,
    this.borderShape,
    this.loadingColor,
  });

  final ButtonType buttonType;
  final String? text;
  final double? width;
  final double height;
  final VoidCallback? onPressed;
  final Color color;
  final FontWeight fontWeight;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final bool showContainerBackground;
  final EdgeInsets margin;
  final EdgeInsets? padding;
  final double borderRadius;
  final double borderWidth;
  final Color? borderColor;
  final bool loading;
  final bool disabled;
  final bool autofocus;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final TextStyle? textStyle;
  final WidgetStateProperty<OutlinedBorder?>? borderShape;
  final Color? loadingColor;

  Widget _renderLoading(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 15,
      height: MediaQuery.of(context).size.width / 15,
      child: CircularProgressIndicator(
        semanticsLabel: '로딩',
        backgroundColor: loadingColor,
        strokeWidth: 3,
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }

  Widget _renderContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: loading
          ? [_renderLoading(context)]
          : [
              leftWidget ?? const SizedBox(),
              SizedBox(
                child: Center(
                  child: Text(
                    text!,
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                          TextStyle(color: color, fontWeight: fontWeight)
                              .merge(textStyle),
                        ),
                  ),
                ),
              ),
              rightWidget ?? const SizedBox(),
            ],
    );
  }

  Widget _renderSolidButton(BuildContext context) {
    return ElevatedButton(
      onPressed: loading
          ? () {}
          : !disabled
              ? onPressed
              : null,
      autofocus: autofocus,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primary,
        padding: padding,
        fixedSize: Size(width ?? double.infinity, height),
        textStyle: TextStyle(color: color, fontWeight: FontWeight.w600)
            .merge(textStyle),
        elevation: 0,
        disabledBackgroundColor:
            disabledBackgroundColor ?? Theme.of(context).colorScheme.onSurface,
      ).merge(
        ButtonStyle(
          surfaceTintColor: WidgetStateProperty.all<Color?>(Colors.transparent),
          overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.pressed)) {
              if (backgroundColor == null || backgroundColor == Colors.black) {
                return Colors.white.withOpacity(0.1);
              }
              return Colors.black.withOpacity(0.1);
            }
            return null; // <-- Splash color
          }),
          shape: borderShape ??
              (borderWidth != 0.0
                  ? WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                        side: BorderSide(
                          color: borderColor ??
                              Theme.of(context).colorScheme.onSurface,
                          width: borderWidth,
                        ),
                      ),
                    )
                  : WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                    )),
        ),
      ),
      child: _renderContent(context),
    );
  }

  Widget _renderOutlineButton(BuildContext context) {
    return OutlinedButton(
      autofocus: autofocus,
      clipBehavior: Clip.none,
      onPressed: (loading || disabled) ? null : onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: color, width: 1),
        padding: padding,
        fixedSize: Size(width ?? double.infinity, height),
        textStyle: TextStyle(color: color, fontWeight: FontWeight.w500)
            .merge(textStyle),
        disabledForegroundColor: Colors.black,
        elevation: 0,
      ).merge(ButtonStyle(
        shape: borderShape ??
            (borderWidth != 0.0
                ? WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      side: BorderSide(
                        color: borderColor ??
                            Theme.of(context).colorScheme.onSurface,
                        width: borderWidth,
                      ),
                    ),
                  )
                : WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  )),
      )),
      child: _renderContent(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        width: width,
        height: height,
        child: buttonType == ButtonType.solid
            ? _renderSolidButton(context)
            : _renderOutlineButton(context));
  }
}

class CircleIconButton extends StatefulWidget {
  const CircleIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.width,
    this.height,
    this.backgroundColor,
    this.isShadow = false,
    this.padding,
  });
  final Function() onPressed;
  final Widget icon;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final bool isShadow;
  final EdgeInsets? padding;

  @override
  State<CircleIconButton> createState() => _CircleIconButtonState();
}

class _CircleIconButtonState extends State<CircleIconButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.backgroundColor ?? Colors.white,
        boxShadow: widget.isShadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ]
            : null,
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
          elevation: WidgetStateProperty.all(0),
          shape: WidgetStateProperty.all(const CircleBorder()),
          surfaceTintColor: WidgetStateProperty.all<Color?>(Colors.transparent),
          backgroundColor: WidgetStateProperty.all(
            widget.backgroundColor ?? Colors.white,
          ), // <-- Button color

          overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.pressed)) {
              if (widget.backgroundColor == Colors.black) {
                return Colors.white.withOpacity(0.1);
              }
              return Colors.black.withOpacity(0.1);
            }
            return null; // <-- Splash color
          }),
        ),
        child: widget.icon,
      ),
    );
  }
}
