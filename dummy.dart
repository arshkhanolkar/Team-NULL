import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Account")),
    body: const Center(child: Text("Account Page")),
  );
}

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Add Task")),
    body: const Center(child: Text("Add Task Page")),
  );
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Search")),
    body: const Center(child: Text("Search Page")),
  );
}

class PrescriptionPage extends StatelessWidget {
  const PrescriptionPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Prescription")),
    body: const Center(child: Text("Prescription Page")),
  );
}

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Appointments")),
    body: const Center(child: Text("Appointments Page")),
  );
}

class VitalPage extends StatelessWidget {
  const VitalPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Vitals")),
    body: const Center(child: Text("Vital Page")),
  );
}

class FamilyPage extends StatelessWidget {
  const FamilyPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Family")),
    body: const Center(child: Text("Family Page")),
  );
}
