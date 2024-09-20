import 'package:custfyp/providers/auth_service_provider.dart';
import 'package:custfyp/services/dialog_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../user_profile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthServiceProvider>(
      builder: (_, authProvider, __) {
        final user = authProvider.user;
        return Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                // currentAccountPicture: Hero(tag: "user-profile-image" , child:Image.asset("assets/images/text_on_board_image.PNG")),
                accountName: Text(authProvider.displayName),
                accountEmail: Text(user?.email ?? 'guest@example.com'),
              ),
              ListTile(
                leading: const Icon(Icons.account_circle_rounded),
                title: const Text("Personal Information"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserProfile()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.chat),
                title: const Text("Chat"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("LogOut"),
                onTap: () {
                  showLogoutConfirmationDialog(context);
                },
              ),
              // if(user.subscribedPlan !=null)
              // ListTile(
              //   leading: const Icon(Icons.subscriptions),
              //   title: const Text("Subscription"),
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // ),
            ],
          ),
        );
      },
    );
  }
}
