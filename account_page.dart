import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(
                      "assets/user.png",
                    ), // replace with NetworkImage if needed
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Ramesh Sonavane",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "ramesh.sonavane@google.com",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),

            // Account Options List
            _buildOption(
              icon: Icons.folder,
              title: "Your Collections",
              onTap: () {},
            ),
            _buildOption(
              icon: Icons.medication,
              title: "Medicine Stash",
              onTap: () {},
            ),
            _buildOption(
              icon: Icons.group,
              title: "Saved Family Members",
              onTap: () {},
            ),
            _buildOption(
              icon: Icons.alternate_email,
              title: "Change Email",
              onTap: () {},
            ),
            _buildOption(
              icon: Icons.lock,
              title: "Change Password",
              onTap: () {},
            ),
            _buildOption(
              icon: Icons.person,
              title: "Change Name",
              onTap: () {},
            ),
            _buildOption(
              icon: Icons.link,
              title: "Connected Accounts",
              onTap: () {},
            ),

            const SizedBox(height: 20),
            // Logout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton.icon(
                onPressed: () {
                  // logout function here
                },
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Option Tile
  Widget _buildOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
