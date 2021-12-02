import 'package:flutter/material.dart';

class CenterWithOriginalSizeDelegate extends SingleChildLayoutDelegate {
  const CenterWithOriginalSizeDelegate(
      this.subjectSize,
      this.basePosition,
      );

  final Size subjectSize;
  final Alignment basePosition;

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    final childWidth = subjectSize.width;
    final childHeight = subjectSize.height;

    final halfWidth = (size.width - childWidth) / 2;
    final halfHeight = (size.height - childHeight) / 2;

    final double offsetX = halfWidth * (basePosition.x + 1);
    final double offsetY = halfHeight * (basePosition.y + 1);
    // print("childWidth=${childWidth}, childHeight=${childHeight}, size.width=${size.width}, size.height=${size.height},"
    //     "offsetX=${offsetX}, offsetY=${offsetY}, basePosition.x=${basePosition.x}, basePosition.y=${basePosition.y}");
    return Offset(offsetX, offsetY);
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.tight(subjectSize);
  }

  @override
  bool shouldRelayout(CenterWithOriginalSizeDelegate oldDelegate) {
    return oldDelegate != this;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CenterWithOriginalSizeDelegate &&
              runtimeType == other.runtimeType &&
              subjectSize == other.subjectSize &&
              basePosition == other.basePosition;

  @override
  int get hashCode =>
      subjectSize.hashCode ^ basePosition.hashCode;
}