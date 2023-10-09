import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnchorSliverWidget extends LeafRenderObjectWidget {
  const AnchorSliverWidget(this.callback, {super.key});

  final Function(double) callback;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return OverlapRenderSliver()..callback = callback;
  }
}

class OverlapRenderSliver extends RenderSliverSingleBoxAdapter {
  Function(double)? callback;

  @override
  void performLayout() {
    callback?.call(constraints.precedingScrollExtent);

    geometry = SliverGeometry();
  }
}
