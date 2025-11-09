import 'package:flutter/material.dart';

class AppbarDrawerIcon extends StatefulWidget {
  const AppbarDrawerIcon({super.key});

  @override
  State<AppbarDrawerIcon> createState() => _AppbarDrawerIconState();
}

class _AppbarDrawerIconState extends State<AppbarDrawerIcon> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isOpen = !isOpen;
          isOpen ? _controller.forward() : _controller.reverse();
        });
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: _animation,
      ),
    );
  }
}