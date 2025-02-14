import 'package:flutter/material.dart';
import 'package:appflowy_editor/appflowy_editor.dart';

class ColorButton extends StatelessWidget {
  const ColorButton({
    Key? key,
    required this.colorOption,
    required this.isSelected,
    required this.onPressed,
    this.isBackgroundColor = false,
  }) : super(key: key);

  final ColorOption colorOption;
  final bool isBackgroundColor;
  final bool isSelected;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final style = MobileToolbarStyle.of(context);
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: style.buttonHeight,
        decoration: BoxDecoration(
          color: isBackgroundColor
              ? colorOption.colorHex.toColor()
              : Colors.transparent,
          borderRadius: BorderRadius.circular(style.borderRadius),
          border: isSelected
              ? Border.all(
                  color: style.itemHighlightColor,
                  width: style.buttonSelectedBorderWidth,
                )
              : Border.all(
                  color: style.itemOutlineColor,
                  width: style.buttonBorderWidth,
                ),
        ),
        child: isBackgroundColor
            ? null
            : Center(
                child: Text(
                  colorOption.name,
                  style: TextStyle(color: colorOption.colorHex.toColor()),
                ),
              ),
      ),
    );
  }
}
