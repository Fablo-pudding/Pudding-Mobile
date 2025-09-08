import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pudding/common/constants/color.dart';

class PuddingBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const PuddingBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const icons = [
    Symbols.home,
    Symbols.chat_bubble,
    Symbols.crown,
    Symbols.kitchen,
    Symbols.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: PuddingColor.background,
        selectedItemColor: PuddingColor.brown,
        unselectedItemColor: PuddingColor.gray400,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: icons.map((icon) {
          return BottomNavigationBarItem(icon: Icon(icon, fill: 1), label: '');
        }).toList(),
      ),
    );
  }
}
