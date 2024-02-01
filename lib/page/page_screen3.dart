import 'package:flutter/material.dart';

class PageScreen3 extends StatefulWidget {
  const PageScreen3({super.key});

  @override
  State<PageScreen3> createState() => _PageScreen3State();
}

class _PageScreen3State extends State<PageScreen3> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Center(child: Text("Screen3")));
  }
}
