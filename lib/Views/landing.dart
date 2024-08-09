import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 147, 0, 1.0), // Start color
              Color.fromRGBO(236, 230, 214, 1.0), // End color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return Row(
                children: [
                  Expanded(
                    child: _buildScrollableMenu(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: _buildInfoSection(),
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildInfoSection(),
                  ),
                  Expanded(
                    flex: 3,
                    child: _buildScrollableMenu(),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildScrollableMenu() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      scrollDirection: Axis.horizontal,
      children: [
        _buildMenuItem(Icons.person, "Profile"),
        _buildMenuItem(Icons.inventory, "Manage Assets"),
        _buildMenuItem(Icons.group, "Manage Users"),
        _buildMenuItem(Icons.settings, "Settings"),
        _buildMenuItem(Icons.apartment, "Department"),
        _buildMenuItem(Icons.assignment, "Asset Allocation"),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: const Color.fromRGBO(3, 51, 71, 1.0)),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(3, 51, 71, 1.0),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Information",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(3, 51, 71, 1.0),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vel pulvinar odio. Integer et velit eu odio gravida egestas. Morbi dapibus nisi id massa ultrices, et feugiat odio eleifend. Sed eget velit sit amet massa blandit aliquam. Cras dictum orci vel lacus vehicula tincidunt. Integer interdum interdum est, at iaculis nisl fermentum at.",
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(3, 51, 71, 1.0),
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
