import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          ),
        ],
      ),
      body: Row(
        children: [
          // Sidebar Navigation (Mock)
          NavigationRail(
            selectedIndex: 0,
            onDestinationSelected: (int index) {},
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.dashboard),
                label: Text('Overview'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.people),
                label: Text('Users'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.assignment_ind),
                label: Text('Mentors'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // Main Content Area
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                _buildStatCards(context),
                const SizedBox(height: 24),
                _buildRecentActivity(context),
                const SizedBox(height: 24),
                _buildAIInsights(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCards(BuildContext context) {
    return Row(
      children: [
        _StatCard(
          title: 'Total Students',
          value: '1,240',
          icon: Icons.school,
          color: Colors.blue,
        ),
        const SizedBox(width: 16),
        _StatCard(
          title: 'Active Trainers',
          value: '45',
          icon: Icons.person_pin,
          color: Colors.orange,
        ),
        const SizedBox(width: 16),
        _StatCard(
          title: 'Courses Active',
          value: '32',
          icon: Icons.video_library,
          color: Colors.green,
        ),
      ],
    );
  }

  Widget _buildRecentActivity(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent User Registrations',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            const ListTile(
              leading: CircleAvatar(child: Text('JD')),
              title: Text('John Doe'),
              subtitle: Text('Student - Registered 2 mins ago'),
              trailing: Chip(label: Text('Pending Approval')),
            ),
            const Divider(),
            const ListTile(
              leading: CircleAvatar(child: Text('AS')),
              title: Text('Alice Smith'),
              subtitle: Text('Trainer - Registered 1 hour ago'),
              trailing: Chip(label: Text('Active'), backgroundColor: Colors.greenAccent),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAIInsights(BuildContext context) {
    return Card(
      color: Colors.purple.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.auto_awesome, color: Colors.purple),
                const SizedBox(width: 8),
                Text(
                  'AI System Insights',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.purple.shade900),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('• 3 Students are struggling with "Advanced Flutter State Management". Suggested action: Assign Mentor.'),
            const SizedBox(height: 8),
            const Text('• Trainer "Mike" has high engagement rates this week.'),
            const SizedBox(height: 8),
            const Text('• Recommended: Create new module on "AI Integration" based on industry trends.'),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 32, color: color),
              const SizedBox(height: 16),
              Text(
                value,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
