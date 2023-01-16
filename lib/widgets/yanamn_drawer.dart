// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

enum IsSelected
// ignore: constant_identifier_names
{ Groups, Profile, SignOut }

class YanamnDrawer extends StatelessWidget {
  const YanamnDrawer({
    Key? key,
    required this.fullName,
    required this.email,
    required this.selected,
  }) : super(key: key);

  final String fullName;
  final String email;
  final IsSelected selected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: const EdgeInsets.symmetric(vertical: 50),
      children: [
        Icon(Icons.account_circle_sharp,
            size: 200, color: Theme.of(context).primaryColor),
        const SizedBox(height: 15),
        Text(fullName,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 22)),
        Text(email,
            textAlign: TextAlign.center,
            style:
                const TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
        const SizedBox(height: 5),
        const Divider(),
        const SizedBox(height: 15),
        DrawerTile(
            selected: (selected == IsSelected.Groups), icon: Icons.groups_sharp, title: 'Groups'),
        DrawerTile(
            selected: (selected == IsSelected.Profile), icon: Icons.account_circle, title: 'Profile'),
        DrawerTile(
            selected: (selected == IsSelected.SignOut), icon: Icons.exit_to_app, title: 'Sign Out'),
      ],
    ));
  }
}

class DrawerTile extends StatelessWidget {
  final bool selected;
  final IconData icon;
  final String title;
  final void Function()? onTap;

  const DrawerTile({
    Key? key,
    required this.selected,
    required this.icon,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: true,
      leading: Icon(icon, size: 35),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      title: Text(title, textScaleFactor: 1.2),
      selectedColor: Theme.of(context).primaryColor,
      selected: selected,
      horizontalTitleGap: 25,
      selectedTileColor: const Color.fromARGB(120, 224, 152, 85),
      onTap: onTap,
    );
  }
}
