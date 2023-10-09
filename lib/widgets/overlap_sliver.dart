import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OverlapSliverWidget extends SingleChildRenderObjectWidget {
  const OverlapSliverWidget({required this.height, required this.paintOffset,
      super.key, required super.child});

  final double height;
  final double paintOffset;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return OverlapRenderSliver()
      ..height = height
      ..paintOffset = paintOffset;
  }
}

class OverlapRenderSliver extends RenderSliverSingleBoxAdapter {
  double height = 0;
  double paintOffset = 0;
  bool absorb = false;

  @override
  void performLayout() {
    double paintExtent =  height;

    child!.layout(
        constraints.asBoxConstraints(
            crossAxisExtent: constraints.crossAxisExtent,
            minExtent: paintExtent,
            maxExtent: paintExtent),
        parentUsesSize: true);

    Size size = child!.size;

    double layoutExtent = height;
    print("OverlapSliverWidget  :\n paintOffset = ${paintOffset} \n size.height = ${size.height},"
        " layoutExtent = $layoutExtent");


    geometry = SliverGeometry(
      paintOrigin: paintOffset,
      paintExtent: size.height,
      scrollExtent: 0,
      layoutExtent: 0,
      maxPaintExtent: size.height,
    );
  }
}
