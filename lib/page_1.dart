import 'package:flutter/material.dart';
import 'package:sliver/widgets/overlap_sliver.dart';
import 'package:sliver/widgets/overlap_sliver_2.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stacked Sliver Demo"),
      ),
      body: CustomScrollView(
        controller: ScrollController(),
        slivers: [
          OverlapSliverWidget(
            height:50,
            paintOffset:75,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 48),
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: InkWell(
                onTap: (){
                  showDialog(context: context, builder: (c){return Text('data');});
                },
              ),
            ),
          ),
          OverlapSliverWidget2(
            100,
            16,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16))),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.grey,
              height: 300,
              width: 100,
            ),
          ),

          ...List.generate(
              10,
              (index) => SliverToBoxAdapter(
                    child: Container(
                      color: Colors.yellow,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      height: 300,
                      width: 100,
                    ),
                  )),
        ],
      ),
    );
  }
}
