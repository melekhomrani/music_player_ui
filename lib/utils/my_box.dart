import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  final Widget child;

  const MyBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          // darker shadow on the bottom right
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 15,
            offset: const Offset(5, 5),
          ),
          // lighter shadow on the top left
          const BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            offset: Offset(-5, -5),
          ),
        ],
      ),
      child: Center(child: child),
    );
  }
}
