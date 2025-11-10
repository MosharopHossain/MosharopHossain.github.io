import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/widgets/appbar/drawer_menu.dart';

class AppbarDrawerIcon extends ConsumerStatefulWidget {
  const AppbarDrawerIcon({super.key});

  @override
  ConsumerState<AppbarDrawerIcon> createState() => _AppbarDrawerIconState();
}

class _AppbarDrawerIconState extends ConsumerState<AppbarDrawerIcon>
    with SingleTickerProviderStateMixin {
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
        print('Drawer icon pressed');
        setState(() {
          if (!isOpen) {
            _controller.forward();
            ref.read(drawerMenuControllerProvider.notifier).openMenu();
          } else {
            _controller.reverse();
            ref.read(drawerMenuControllerProvider.notifier).closeMenu();
          }
          isOpen = !isOpen;

          // isOpen ? _controller.forward() : _controller.reverse();
        });
      },
      icon: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _animation),
    );
  }
}
