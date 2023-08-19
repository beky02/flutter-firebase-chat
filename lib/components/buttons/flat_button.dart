part of components;

class FlatButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? disableColor;
  final Widget? child;
  final double? width;
  final double? height;
  final bool disabled;
  final double? borderRadius;

  const FlatButton(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.width,
      this.height,
      this.borderColor,
      this.backgroundColor,
      this.disabled = false,
      this.disableColor,
      this.borderRadius})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
      color: disabled
          ? disableColor ?? Colors.grey
          : backgroundColor ?? Theme.of(context).colorScheme.secondary,
      child: Container(
        width: width ?? size.width * 0.96,
        height: height ?? size.height * 0.07,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        child: InkWell(
            onTap: disabled ? null : onPressed, child: Center(child: child)),
      ),
    );
  }
}
