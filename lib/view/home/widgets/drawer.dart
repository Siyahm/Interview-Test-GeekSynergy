import 'package:api_test/controller/home_controller.dart';
import 'package:api_test/view/home/widgets/drawer_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context, listen: false);
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.blue),
            child: const Center(
              child: CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 35,
                ),
              ),
            ),
          ),
          const DrawerRichText(
            leading: 'Company:',
            title: 'Geeksynergy Technologies Pvt Ltd',
          ),
          const DrawerRichText(
            leading: 'Address:',
            title: 'Sanjayanagar, Bengaluru-56',
          ),
          const DrawerRichText(
            leading: 'Phone:',
            title: 'XXXXXXXXX09',
          ),
          const DrawerRichText(
            leading: 'Email:',
            title: 'XXXXXX@gmail.com',
          ),
          TextButton(
              onPressed: () => homeController.logOut(context),
              child: const Text('Logout'))
        ],
      ),
    );
  }
}
