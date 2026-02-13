import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Learning'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline),
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
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main Learning Area
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildContinueLearning(context),
                  const SizedBox(height: 24),
                  _buildCourseGrid(context),
                  const SizedBox(height: 24),
                  _buildRealTimeExamples(context),
                ],
              ),
            ),
          ),
          // Sidebar (Progress & Mentors)
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[50],
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMyProgress(context),
                  const SizedBox(height: 24),
                  _buildMyMentor(context),
                  const SizedBox(height: 24),
                  _buildUpcomingAssessments(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueLearning(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.black87,
            child: const Center(
              child: Icon(Icons.play_circle_fill, size: 64, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Current Module: Advanced Web Architecture', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                const LinearProgressIndicator(value: 0.6),
                const SizedBox(height: 8),
                Text('Lesson 4 of 10 • 60% Complete', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseGrid(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Available Courses', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.5,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blue[100],
                      child: Center(child: Icon(Icons.code, size: 40, color: Colors.blue[800])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Course Title ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        const Text('Trainer: John Doe', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildRealTimeExamples(BuildContext context) {
    return Card(
      color: Colors.indigo.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.science, color: Colors.indigo),
                const SizedBox(width: 8),
                Text('Real-time Industry Examples', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.indigo)),
              ],
            ),
            const SizedBox(height: 12),
            const ListTile(
              title: Text('Live Server Log Analysis'),
              subtitle: Text('Analyze real traffic logs using AI tools.'),
              trailing: Icon(Icons.arrow_forward),
            ),
            const Divider(),
            const ListTile(
              title: Text('E-commerce Transaction Flow'),
              subtitle: Text('Simulate high-concurrency payment processing.'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMyProgress(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('My Progress', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 16),
        const Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(value: 0.75, strokeWidth: 8, backgroundColor: Colors.grey),
              Text('75%', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('You are ahead of 80% of your peers! Keep it up.', style: TextStyle(fontSize: 12, color: Colors.green)),
      ],
    );
  }

  Widget _buildMyMentor(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('My Mentor', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        const ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(child: Text('DR')),
          title: Text('Dr. Roberts'),
          subtitle: Text('Senior Architect'),
        ),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.chat_bubble_outline, size: 16),
          label: const Text('Chat with Mentor'),
        ),
      ],
    );
  }

  Widget _buildUpcomingAssessments(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Assessments', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          color: Colors.red.shade50,
          child: const ListTile(
            title: Text('Module 3 Quiz'),
            subtitle: Text('Due: Tomorrow'),
            trailing: Icon(Icons.warning, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
