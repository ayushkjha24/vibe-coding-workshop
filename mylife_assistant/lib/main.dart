import 'package:flutter/material.dart';
import 'package:mylife_assistant/screens/calendar_screen.dart';
import 'package:mylife_assistant/screens/notes_screen.dart';
import 'package:mylife_assistant/screens/profile_screen.dart';
import 'package:mylife_assistant/screens/settings_screen.dart';
import 'package:mylife_assistant/suggestion_engine.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyLife Assistant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/settings': (context) => SettingsScreen(),
        '/notes': (context) => NotesScreen(),
        '/calendar': (context) => CalendarScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'MyLife Assistant',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: const Icon(Icons.note),
              title: const Text('Notes'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, '/notes');
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Calendar'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, '/calendar');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good morning, User!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Upcoming Events'),
            _buildEventCard('Team Meeting', '10:00 AM - 11:00 AM'),
            _buildEventCard('Lunch with Sarah', '1:00 PM - 2:00 PM'),
            const SizedBox(height: 20),
            _buildSectionTitle('Your Tasks'),
            _buildTaskCard('Finish report for Q3', true),
            _buildTaskCard('Call the dentist', false),
            const SizedBox(height: 20),
            _buildSectionTitle('Suggestions for you'),
            ...SuggestionEngine().getSuggestions().map((suggestion) => _buildSuggestionCard(suggestion)),
            const SizedBox(height: 20),
            _buildSectionTitle('Habits'),
            _buildHabitCard('Morning Jog'),
            const SizedBox(height: 20),
            _buildQuickAddButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildEventCard(String title, String time) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.event),
        title: Text(title),
        subtitle: Text(time),
      ),
    );
  }

  Widget _buildTaskCard(String title, bool isCompleted) {
    return Card(
      child: ListTile(
        leading: Icon(
          isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
        ),
        title: Text(title),
      ),
    );
  }

  Widget _buildSuggestionCard(String suggestion) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.lightbulb_outline),
        title: Text(suggestion),
      ),
    );
  }

  Widget _buildHabitCard(String habit) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.directions_run),
        title: Text(habit),
      ),
    );
  }

  Widget _buildQuickAddButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Note'),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Event'),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Task'),
        ),
      ],
    );
  }
}
