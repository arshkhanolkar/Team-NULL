import 'package:flutter/material.dart';

class FamilyPage extends StatefulWidget {
  const FamilyPage({super.key});

  @override
  State<FamilyPage> createState() => _FamilyPageState();
}

class _FamilyPageState extends State<FamilyPage> {
  // 4 family members with text controllers
  final List<Map<String, TextEditingController>> familyControllers =
      List.generate(
        4,
        (index) => {
          "name": TextEditingController(),
          "relationship": TextEditingController(),
          "email": TextEditingController(),
          "phone": TextEditingController(),
        },
      );

  @override
  void dispose() {
    // cleanup controllers
    for (var member in familyControllers) {
      member.values.forEach((c) => c.dispose());
    }
    super.dispose();
  }

  Widget buildFamilyCard(int index) {
    final member = familyControllers[index];
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Family Member ${index + 1}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Name
            TextField(
              controller: member["name"],
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Relationship
            TextField(
              controller: member["relationship"],
              decoration: const InputDecoration(
                labelText: "Relationship",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Email
            TextField(
              controller: member["email"],
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Phone
            TextField(
              controller: member["phone"],
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveFamilyData() {
    // For now, just print values to console (later hook with backend/db)
    for (var i = 0; i < familyControllers.length; i++) {
      final m = familyControllers[i];
      debugPrint(
        "Member ${i + 1}: "
        "Name=${m["name"]!.text}, "
        "Relation=${m["relationship"]!.text}, "
        "Email=${m["email"]!.text}, "
        "Phone=${m["phone"]!.text}",
      );
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Family details saved!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Family Contacts"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.grey[200],
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (int i = 0; i < familyControllers.length; i++) buildFamilyCard(i),
          const SizedBox(height: 20),

          // Save button
          ElevatedButton(
            onPressed: _saveFamilyData,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Save Family Details",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
