// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatting_app/pages/home_page.dart';
import 'package:chatting_app/pages/profile_page.dart';
import 'package:chatting_app/service/auth_service.dart';
import 'package:chatting_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../pages/auth/login_page.dart';

enum IsSelected
// ignore: constant_identifier_names
{ Groups, Profile, SignOut }

class YanamnDrawer extends StatelessWidget {
  // AuthService authService = AuthService();
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
          selected: (selected == IsSelected.Groups),
          icon: Icons.groups_sharp,
          title: 'Groups',
          onTap: (selected == IsSelected.Groups)
              ? () {}
              : () {
                  nextScreenReplacement(context, const HomePage());
                },
        ),
        DrawerTile(
          selected: (selected == IsSelected.Profile),
          icon: Icons.account_circle,
          title: 'Profile',
          onTap: (selected == IsSelected.Profile)
              ? () {}
              : () {
                  nextScreenReplacement(context, const ProfilePage());
                },
        ),
        DrawerTile(
          selected: (selected == IsSelected.SignOut),
          icon: Icons.exit_to_app,
          title: 'Sign Out',
          onTap: () async {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.cancel_outlined, color: Colors.red,)),
                    IconButton(
                        onPressed: () async {
                          await AuthService().signOut();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                              (route) => false);
                          // AuthService().signOut().whenComplete(() =>
                          //     nextScreenReplacement(
                          //         context, const LoginPage()));
                        },
                        icon: const Icon(Icons.done, color: Colors.green,)),
                  ],
                );
              },
            );
          },
        ),
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
