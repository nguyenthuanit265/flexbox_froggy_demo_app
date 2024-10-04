import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Flexbox Froggy',
      theme: ThemeData(primarySwatch: Colors.green),
      home: LevelList(),
    );
  }
}

class LevelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Flexbox Froggy')),
      body: ListView.builder(
        itemCount: levels.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Level ${index + 1}: ${levels[index].title}'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LevelDetail(level: levels[index], index: index),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LevelDetail extends StatelessWidget {
  final Level level;
  final int index;

  LevelDetail({required this.level, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Level ${index + 1}: ${level.title}')),
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          color: Colors.lightBlue[100],
          child: level.builder(context),
        ),
      ),
    );
  }
}

class FlexFrog extends StatelessWidget {
  final Color color;

  const FlexFrog({Key? key, this.color = Colors.green}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class Level {
  final String title;
  final Widget Function(BuildContext) builder;

  Level(this.title, this.builder);
}

final levels = [
  // Level 1
  Level('justify-content: flex-end', (context) => const Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [FlexFrog(), FlexFrog(), FlexFrog()],
  )),
  // Level 2
  Level('justify-content: center', (context) => const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [FlexFrog(), FlexFrog(), FlexFrog()],
  )),
  // Level 3
  Level('justify-content: space-around', (context) => const Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [FlexFrog(), FlexFrog(), FlexFrog()],
  )),
  // Level 4
  Level('justify-content: space-between', (context) => const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [FlexFrog(), FlexFrog(), FlexFrog()],
  )),
  // Level 5
  Level('align-items: flex-end', (context) => SizedBox(
    height: 200,
    child: const Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [FlexFrog(), FlexFrog(), FlexFrog()],
    ),
  )),
  // Level 6
  Level('justify-content: center, align-items: center', (context) => SizedBox(
    height: 200,
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [FlexFrog(), FlexFrog(), FlexFrog()],
    ),
  )),
  // Level 7
  Level('justify-content: space-around, align-items: flex-end', (context) => SizedBox(
    height: 200,
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [FlexFrog(), FlexFrog(), FlexFrog()],
    ),
  )),
  // Level 8
  Level('flex-direction: row-reverse', (context) => const Row(
    textDirection: TextDirection.rtl,
    children: [FlexFrog(), FlexFrog(), FlexFrog()],
  )),
  // Level 9
  Level('flex-direction: column', (context) => const Column(
    children: [FlexFrog(), FlexFrog(), FlexFrog()],
  )),
  // Level 10
  Level('flex-direction: row-reverse, justify-content: flex-end', (context) => const Row(
    textDirection: TextDirection.rtl,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [FlexFrog(), FlexFrog(), FlexFrog()],
  )),
  // Level 11
  Level('flex-direction: column, justify-content: flex-end', (context) => const SizedBox(
    height: 200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [FlexFrog(), FlexFrog(), FlexFrog()],
    ),
  )),
  // Level 12
  Level('flex-direction: column-reverse, justify-content: space-between', (context) => const SizedBox(
    height: 200,
    child: Column(
      verticalDirection: VerticalDirection.up,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [FlexFrog(), FlexFrog(), FlexFrog()],
    ),
  )),
  // Level 13
  Level('flex-direction: row-reverse, justify-content: center, align-items: flex-end', (context) => const SizedBox(
    height: 200,
    child: Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [FlexFrog(), FlexFrog(), FlexFrog()],
    ),
  )),
  // Level 14
  Level('order', (context) => Row(
    children: [
      FlexFrog(),
      Expanded(child: FlexFrog(color: Colors.yellow)),
      FlexFrog(),
    ],
  )),
  // Level 15
  Level('order: -1', (context) => Row(
    children: [
      FlexFrog(),
      FlexFrog(),
      Expanded(child: FlexFrog(color: Colors.red)),
    ],
  )),
  // Level 16
  Level('align-self: flex-end', (context) => SizedBox(
    height: 200,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlexFrog(),
        Container(
          alignment: Alignment.bottomCenter,
          child: const FlexFrog(color: Colors.yellow),
        ),
        FlexFrog(),
      ],
    ),
  )),
  // Level 17
  Level('order, align-self: flex-end', (context) => SizedBox(
    height: 200,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlexFrog(),
        FlexFrog(),
        Expanded(
          child: Container(
            alignment: Alignment.bottomCenter,
            child: const FlexFrog(color: Colors.yellow),
          ),
        ),
      ],
    ),
  )),
  // Level 18
  Level('flex-wrap: wrap', (context) => Wrap(
    children: List.generate(6, (index) => const FlexFrog()),
  )),
  // Level 19
  Level('flex-direction: column, flex-wrap: wrap', (context) => SizedBox(
    height: 300,
    child: Wrap(
      direction: Axis.vertical,
      children: List.generate(6, (index) => const FlexFrog()),
    ),
  )),
  // Level 20
  Level('flex-flow: column wrap', (context) => SizedBox(
    height: 300,
    child: Wrap(
      direction: Axis.vertical,
      children: List.generate(6, (index) => const FlexFrog()),
    ),
  )),
  // Level 21
  Level('align-content: flex-start', (context) => SizedBox(
    height: 200,
    child: Wrap(
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      children: List.generate(6, (index) => const FlexFrog()),
    ),
  )),
  // Level 22
  Level('align-content: flex-end', (context) => SizedBox(
    height: 200,
    child: Wrap(
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.end,
      children: List.generate(6, (index) => const FlexFrog()),
    ),
  )),
  // Level 23
  Level('flex-direction: column-reverse, align-content: center', (context) => SizedBox(
    height: 300,
    child: Wrap(
      direction: Axis.vertical,
      verticalDirection: VerticalDirection.up,
      alignment: WrapAlignment.center,
      children: List.generate(6, (index) => const FlexFrog()),
    ),
  )),
  // Level 24
  Level('flex-flow: column-reverse wrap-reverse, justify-content: center, align-content: space-between', (context) => Container(
    height: 300,
    child: Wrap(
      direction: Axis.vertical,
      verticalDirection: VerticalDirection.up,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.spaceBetween,
      children: List.generate(8, (index) => const FlexFrog()),
    ),
  )),
];