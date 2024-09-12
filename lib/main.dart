import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final cols = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChessBoard(),
    );
  }
}

class ChessBoard extends StatelessWidget {
  const ChessBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              child: ListView.builder(
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return SizedBox(
                    height: 30,
                    width: 30,
                    child: Text('${index + 1}'),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              height: 260,
              width: 240,
              child: ListView.builder(
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return SizedBox(
                      height: 240,
                      width: 30,
                      child: ListView.builder(
                        itemCount: 8,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (_, secondaryIndex) {
                          return Container(
                            height: 30,
                            width: 30,
                            color: index % 2 == 1
                                ? secondaryIndex % 2 == 1
                                    ? Colors.black
                                    : Colors.white
                                : secondaryIndex % 2 == 0
                                    ? Colors.black
                                    : Colors.white,
                          );
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
