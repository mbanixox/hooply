import 'package:flutter/material.dart';
import 'package:hooply/shared/widgets/bottom_nav_scaffold.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavScaffold(
      currentIndex: 3,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            Text("App Settings", style: Theme.of(context).textTheme.titleLarge),

            const SizedBox(height: 24.0),

            _SettingsSection(
              title: "Game Settings",
              items: [
                _SettingsItem(
                  icon: Icons.timer,
                  title: "Quarter Length",
                  subtitle: "12 minutes",
                  onTap: () {},
                ),
                _SettingsItem(
                  icon: Icons.sports_basketball,
                  title: "Default Stats",
                  subtitle: "Customize tracked stats",
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 24.0),

            _SettingsSection(
              title: "Display",
              items: [
                _SettingsItem(
                  icon: Icons.dark_mode,
                  title: "Dark Mode",
                  subtitle: "System Default",
                  trailing: Switch(value: false, onChanged: (value) {}),
                  onTap: () {},
                ),
                _SettingsItem(
                  icon: Icons.format_size,
                  title: "Font Size",
                  subtitle: "Medium",
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 24.0),

            _SettingsSection(
              title: "Data",
              items: [
                _SettingsItem(
                  icon: Icons.backup,
                  title: "Backup Data",
                  subtitle: "Export your data",
                  onTap: () {},
                ),
                _SettingsItem(
                  icon: Icons.delete_outline,
                  title: "Clear All Data",
                  subtitle: "Delete all teams and games",
                  onTap: () {},
                  isDestructive: true,
                ),
              ],
            ),

            const SizedBox(height: 24.0),

            _SettingsSection(
              title: "About",
              items: [
                _SettingsItem(
                  icon: Icons.info_outline,
                  title: "App Version",
                  subtitle: "1.0.0",
                  onTap: () {},
                ),
                _SettingsItem(
                  icon: Icons.description,
                  title: "Terms of Service",
                  onTap: () {},
                ),
                _SettingsItem(
                  icon: Icons.privacy_tip,
                  title: "Privacy Policy",
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const _SettingsSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Card(child: Column(children: items)),
      ],
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Widget? trailing;
  final bool isDestructive;

  const _SettingsItem({
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    this.trailing,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isDestructive
        ? Theme.of(context).colorScheme.error
        : null;

    return ListTile(
      leading: Icon(
        icon,
        color: textColor ?? Theme.of(context).colorScheme.primary,
      ),
      title: Text(title, style: TextStyle(color: textColor)),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextStyle(color: textColor?.withValues(alpha: 0.7)),
            )
          : null,
      trailing: trailing ?? (onTap != null ? Icon(Icons.chevron_right) : null),
      onTap: onTap,
    );
  }
}
