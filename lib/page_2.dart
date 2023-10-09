import 'package:flutter/material.dart';
import 'package:sliver/widgets/anchor_sliver.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  double anchorOffset = 0;
  int preCount = 10;
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sliver Anchor Demo"),
        ),
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            ...List.generate(
                preCount,
                (index) => SliverToBoxAdapter(
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.yellow,
                        margin: const EdgeInsets.all(16),
                        height: 300,
                        width: 100,
                        child: Text(index.toString()),
                      ),
                    )),
            AnchorSliverWidget(onOffset),
            ...List.generate(
                10,
                (index) => SliverToBoxAdapter(
                      child: Container(
                        color: Colors.grey,
                        margin: const EdgeInsets.all(16),
                        height: 300,
                        width: 100,
                      ),
                    )),
          ],
        ),
        persistentFooterButtons: [
          TextButton(
              onPressed: () {
                preCount++;
                setState(() {});
              },
              child: Text('增加蓝色列表长度')),
          TextButton(
              onPressed: () {
                scrollController.animateTo(anchorOffset,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.decelerate);
              },
              child: Text('跳转到锚点位置'))
        ]);
  }

  void onOffset(double offset) {
    anchorOffset = offset;
  }
}
