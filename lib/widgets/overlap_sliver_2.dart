import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OverlapSliverWidget2 extends SingleChildRenderObjectWidget {
  const OverlapSliverWidget2(this.height, this.overlay,
      {super.key, required super.child});

  final double height;
  final double overlay;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _OverlapRenderSliver()
      ..height = height
      ..overlay = overlay;
  }
}

class _OverlapRenderSliver extends RenderSliverSingleBoxAdapter {
  double height = 0;
  double overlay = 0;

  @override
  void performLayout() {
    double paintExtent = min(constraints.remainingPaintExtent, height);

    child!.layout(
        constraints.asBoxConstraints(
            crossAxisExtent: constraints.crossAxisExtent,
            minExtent: paintExtent,
            maxExtent: paintExtent),
        parentUsesSize: true);

    Size size = child!.size;

    double layoutExtent = height - overlay;
    print("OverlapSliverWidget2 constraints : overlap = ${constraints.overlap},"
        " remainingPaintExtent = ${constraints.remainingPaintExtent},"
        " precedingScrollExtent = ${constraints.precedingScrollExtent}");


    geometry = SliverGeometry(
      paintOrigin: 0,
      paintExtent: size.height,
      scrollExtent: 0,
      layoutExtent: layoutExtent,
      maxPaintExtent: size.height,
    );
  }
}
