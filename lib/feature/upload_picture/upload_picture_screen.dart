import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class UploadPictureScreen extends ConsumerStatefulWidget {
  const UploadPictureScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UploadPictureScreenState();
}

class _UploadPictureScreenState extends ConsumerState<UploadPictureScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(child: Column(children: [],),),
    );
  }
}
