import 'package:flutter/material.dart';

import 'core/widgets/shimmer_list.dart';

class WrapExample extends StatelessWidget {
  const WrapExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrap Example'),
      ),
      body: const Padding(padding: EdgeInsets.all(16.0), child: ShimmerLIst()),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: WrapExample(),
  ));
}
