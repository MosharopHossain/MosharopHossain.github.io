import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/widgets/appbar/my_appbar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'drawer_menu.g.dart';

class DrawerMenu extends ConsumerStatefulWidget {
  const DrawerMenu({super.key});

  @override
  ConsumerState<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends ConsumerState<DrawerMenu>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animatedController;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    _animatedController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<Offset>(begin: Offset(0, -1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animatedController,
            curve: Curves.easeIn,
          ),
        );
    super.initState();
  }

  @override
  void dispose() {
    _animatedController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(drawerMenuControllerProvider, (previous, next) {
      if (next.value == true) {
        _animatedController.forward();
      } else {
        _animatedController.reverse();
      }
    });
    return ClipRect(
      child: SlideTransition(
        position: _animation,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.surface.withOpacity(.4),
                blurRadius: 6,
                spreadRadius: 3,
              ),
            ],
          ),
          child: SmallMenu(),
        ),
      ),
    );
  }
}

@riverpod
class DrawerMenuController extends _$DrawerMenuController {
  @override
  FutureOr<bool> build() {
    return false;
  }

  void openMenu() {
    update((state) => true);
  }

  void closeMenu() {
    update((state) => false);
  }
}
