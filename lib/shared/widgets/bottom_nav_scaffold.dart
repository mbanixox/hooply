import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../routes/route_names.dart';

class BottomNavScaffold extends StatelessWidget {
  final int currentIndex;
  final PreferredSizeWidget? appBar;
  final Widget body;

  const BottomNavScaffold({
    super.key,
    required this.body,
    required this.currentIndex,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Navigate to game setup
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Start Game - Coming Soon!')),
          );
        },
        icon: const Icon(Icons.play_arrow),
        label: const Text('New Game'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        // shape: const CircularNotchedRectangle(),
        // notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavBarItem(
              icon: Icons.home,
              label: 'Home',
              isSelected: currentIndex == 0,
              onTap: () => context.go(RouteNames.home),
            ),
            _NavBarItem(
              icon: Icons.group,
              label: 'Teams',
              isSelected: currentIndex == 1,
              onTap: () => context.go(RouteNames.teamList),
            ),
            const SizedBox(width: 80), // Space for FAButton
            _NavBarItem(
              icon: Icons.history,
              label: 'History',
              isSelected: currentIndex == 2,
              onTap: () => context.go(RouteNames.history),
            ),
            _NavBarItem(
              icon: Icons.settings,
              label: 'Settings',
              isSelected: currentIndex == 3,
              onTap: () => context.go(RouteNames.settings),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? Theme.of(context).colorScheme.primary
        : Colors.grey[600];

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: color,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
