import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  final imageUrl =
      'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
                decoration: const BoxDecoration(color: Colors.white),
                margin: EdgeInsets.zero,
                accountName: const Text(
                  'Premansh Tomar',
                  textScaleFactor: 2,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                accountEmail: const Text(
                  'premanshtomar@gmail.com',
                  style: TextStyle(color: Colors.black),
                ),
              )),
          const ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.black,
            ),
            title: Text(
              'Home',
              textScaleFactor: 2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          const ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.black,
            ),
            title: Text(
              'Profile',
              textScaleFactor: 2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          const ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.black,
            ),
            title: Text(
              'Email',
              textScaleFactor: 2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
