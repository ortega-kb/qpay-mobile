import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InformationScreen extends ConsumerStatefulWidget {
  const InformationScreen({super.key});

  @override
  ConsumerState createState() => _InformationScreenState();
}

class _InformationScreenState extends ConsumerState<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
    );
  }
}
