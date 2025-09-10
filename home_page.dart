import 'package:flutter/material.dart';
import 'account_page.dart';
import 'addtask_page.dart';
import 'search_page.dart';
import 'prescription_page.dart';
import 'appointment_page.dart';
import 'vital_page.dart';
import 'family_page.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy calendar data
    final List<Map<String, dynamic>> calendarDays = [
      {
        "date": "22 Sept",
        "pillsRemaining": true,
        "appointmentsRemaining": false,
      },
      {
        "date": "23 Sept",
        "pillsRemaining": false,
        "appointmentsRemaining": true,
      },
      {
        "date": "24 Sept",
        "pillsRemaining": true,
        "appointmentsRemaining": true,
      },
      {
        "date": "25 Sept",
        "pillsRemaining": false,
        "appointmentsRemaining": false,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------------- HEADER ----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "SwasTrack",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const CircleAvatar(
                      radius: 20,
                      child: Icon(Icons.person, color: Colors.white),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AccountPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // ---------------- CALENDAR ----------------
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 31, // 15 before + today + 15 after
                  controller: ScrollController(
                    initialScrollOffset: 80 * 15,
                  ), // jump to today
                  itemBuilder: (context, index) {
                    // -15 to +15 around today
                    final date = DateTime.now().add(Duration(days: index - 15));
                    final day = date.day;
                    final month = date.month;

                    // dummy conditions (replace with real backend later)
                    final pillsRemaining = (index % 2 == 0);
                    final appointmentsRemaining = (index % 3 == 0);

                    return Container(
                      width: 80,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 8,
                      ),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat("d MMM").format(date), // Example: 7 Sep
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color:
                                  date.day == DateTime.now().day &&
                                      date.month == DateTime.now().month
                                  ? Colors
                                        .blue // highlight today
                                  : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 6),

                          if (pillsRemaining)
                            Container(
                              height: 6,
                              width: 40,
                              margin: const EdgeInsets.only(bottom: 4),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),

                          if (appointmentsRemaining)
                            Container(
                              height: 6,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // ---------------- SEARCH ----------------
              Row(
                children: [
                  // Search box
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 4),
                          ],
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 8),
                            Text(
                              "Search",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Plus button
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddTaskPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ---------------- FEATURE GRID ----------------
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                  children: [
                    _featureBox(
                      context,
                      icon: Icons.description,
                      label: "Medications",
                      page: const PrescriptionPage(),
                    ),
                    _featureBox(
                      context,
                      icon: Icons
                          .medical_services, // Flutter 3.7+ (else use medical_services)
                      label: "Appointments",
                      page: const AppointmentPage(),
                    ),
                    _featureBox(
                      context,
                      icon: Icons.monitor_heart,
                      label: "Vitals",
                      page: const VitalPage(),
                    ),
                    _featureBox(
                      context,
                      icon: Icons.family_restroom,
                      label: "Family",
                      page: const FamilyPage(),
                    ),
                  ],
                ),
              ),
              // ---------------- SOS BUTTON ----------------
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      // Placeholder action
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("🚨 SOS"),
                          content: const Text(
                            "SOS button pressed! (Here we’ll later add a call action)",
                          ),
                          actions: [
                            TextButton(
                              child: const Text("OK"),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text(
                      "SOS",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable feature box
  Widget _featureBox(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Widget page,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blue),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
