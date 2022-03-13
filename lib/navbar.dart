import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Oflutter.com'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://pbs.twimg.com/profile_images/1455185376876826625/s1AjSxph_400x400.jpg',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://cdn.arstechnica.net/wp-content/uploads/2020/08/Google-Messaging-mess-800x400.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Categories'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('About'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}

