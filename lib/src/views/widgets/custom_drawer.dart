import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DrawerHeader(
              child: Text('data'),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  alignment: Alignment.centerLeft,
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: const Text(
                  'Filmes',
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  alignment: Alignment.centerLeft,
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/tv_page');
                },
                child: const Text(
                  'Tv',
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
