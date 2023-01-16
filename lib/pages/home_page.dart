// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chatting_app/helper/helper_function.dart';
import 'package:chatting_app/pages/search_page.dart';
import 'package:chatting_app/service/auth_service.dart';
import 'package:chatting_app/widgets/widgets.dart';

import '../widgets/yanamn_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String fullName = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    getUserDetailsFromSF();
  }

  getUserDetailsFromSF() async {
    await HelperFunctions.getUserNameFromSF().then((value) => setState(() {
          fullName = value ?? 'Name could not be fetched';
        }));
    await HelperFunctions.getUserEmailFromSF().then((value) => setState(() {
          email = value ?? 'Email could not be fetched';
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Groups'),
        actions: [
          IconButton(
              onPressed: () {
                nextScreen(context, const SearchPage());
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      drawer: YanamnDrawer(fullName: fullName, email: email, selected: IsSelected.Groups,),
    );
  }
}
