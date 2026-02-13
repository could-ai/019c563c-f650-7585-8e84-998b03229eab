import 'package:flutter/material.dart';

class TrainerDashboard extends StatelessWidget {
  const TrainerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trainer Portal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {
              // Open Chat
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildQuickActions(context),
            const SizedBox(height: 24),
            _buildCourseManagement(context),
            const SizedBox(height: 24),
            _buildStudentProgress(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.upload),
        label: const Text('Upload Content'),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back, Trainer',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'Manage your courses and track student progress',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 24,
          child: Icon(Icons.person),
        ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
            label: const Text('New Lesson'),
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.quiz),
            label: const Text('Create Assessment'),
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.assignment_ind),
            label: const Text('Assign Mentor'),
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
          ),
        ),
      ],
    );
  }

  Widget _buildCourseManagement(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Courses', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    width: 60,
                    height: 40,
                    color: Colors.grey[300],
                    child: const Icon(Icons.play_circle_outline),
                  ),
                  title: Text('Module ${index + 1}: Industry Standards'),
                  subtitle: const Text('Video • 45 mins • 120 Students enrolled'),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {},
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentProgress(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Student Progress (AI Tracked)', style: Theme.of(context).textTheme.titleLarge),
                Chip(
                  avatar: const Icon(Icons.auto_awesome, size: 16),
                  label: const Text('AI Analysis'),
                  backgroundColor: Colors.blue.shade50,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const ListTile(
              leading: CircleAvatar(child: Text('S1')),
              title: Text('Sarah Johnson'),
              subtitle: LinearProgressIndicator(value: 0.8),
              trailing: Text('80%'),
            ),
            const ListTile(
              leading: CircleAvatar(child: Text('S2')),
              title: Text('Mike Brown'),
              subtitle: LinearProgressIndicator(value: 0.45, color: Colors.orange),
              trailing: Text('45%'),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                'AI Alert: Mike Brown is falling behind in "Module 2". Suggested intervention: Schedule 1:1.',
                style: TextStyle(color: Colors.orange, fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
