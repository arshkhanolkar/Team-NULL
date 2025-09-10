import 'package:flutter/material.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for now (later will come from backend)
    final List<Map<String, dynamic>> appointments = [
      {
        "doctor": "Dr. Mehta",
        "specialization": "Cardiologist",
        "date": "12 Sept 2025",
        "time": "10:30 AM",
        "location": "Fortis Hospital, Mumbai",
        "status": "Confirmed",
      },
      {
        "doctor": "Dr. Sharma",
        "specialization": "Dermatologist",
        "date": "15 Sept 2025",
        "time": "2:00 PM",
        "location": "Online Consultation",
        "status": "Pending",
      },
      {
        "doctor": "Dr. Ramesh",
        "specialization": "Dentist",
        "date": "20 Sept 2025",
        "time": "11:00 AM",
        "location": "Apollo Dental, Bandra",
        "status": "Completed",
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("My Appointments"), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Doctor + specialization
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appointment["doctor"],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Chip(
                        label: Text(appointment["status"]),
                        backgroundColor: appointment["status"] == "Confirmed"
                            ? Colors.green.shade100
                            : appointment["status"] == "Pending"
                            ? Colors.orange.shade100
                            : Colors.grey.shade300,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    appointment["specialization"],
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 12),

                  // Date & Time
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 18),
                      const SizedBox(width: 6),
                      Text("${appointment["date"]}, ${appointment["time"]}"),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Location
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 18),
                      const SizedBox(width: 6),
                      Expanded(child: Text(appointment["location"])),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Action buttons (scale-ready, even if not functional yet)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // TODO: Reschedule functionality
                        },
                        child: const Text("Reschedule"),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () {
                          // TODO: Cancel functionality
                        },
                        child: const Text("Cancel"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
