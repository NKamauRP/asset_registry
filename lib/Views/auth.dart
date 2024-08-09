import 'package:asset_registry/Config/api_service.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLogin = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  // Toggle between login and registration
  void _toggleAuthMode() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  // Navigate to the landing page after successful login/registration
  void _navigateToLandingPage() {
    Navigator.pushReplacementNamed(context, '/landing');
  }

  void _submit() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final username = _isLogin ? null : _usernameController.text;

    final success = await ApiService().registerUser(email, password, username);

    if (success) {
      // Handle successful registration or login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_isLogin ? 'Logged in successfully!' : 'Registered successfully!'),
        ),
      );
      _navigateToLandingPage(); // Navigate to landing page
    } else {
      // Handle failed registration or login
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to process request')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width > 600;

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
        child: Center(
          child: isLargeScreen
              ? Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                            'Quisque sit amet accumsan arcu. Nulla facilisi. Phasellus '
                            'in dolor euismod, tincidunt orci in, pellentesque velit. '
                            'Nullam ac vestibulum sem. Donec at venenatis mauris. Aliquam '
                            'euismod neque at enim feugiat, et dictum felis pretium. '
                            'Phasellus consequat orci vel elit euismod, sed fermentum odio. '
                            'Vestibulum aliquet, mauris sed cursus tempus, leo libero '
                            'mollis magna, nec fringilla turpis sem at arcu. Aliquam erat volutpat.',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: const Color.fromRGBO(255, 255, 255, 0.8),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  _isLogin ? 'Login' : 'Register',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(3, 51, 71, 1.0),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                if (!_isLogin)
                                  TextFormField(
                                    controller: _usernameController,
                                    decoration: InputDecoration(
                                      labelText: 'Username',
                                      labelStyle: const TextStyle(color: Color.fromRGBO(3, 51, 71, 1.0)),
                                      filled: true,
                                      fillColor: const Color.fromRGBO(236, 230, 214, 0.5),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    style: const TextStyle(color: Color.fromRGBO(3, 51, 71, 1.0)),
                                  ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: const TextStyle(color: Color.fromRGBO(3, 51, 71, 1.0)),
                                    filled: true,
                                    fillColor: const Color.fromRGBO(236, 230, 214, 0.5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  style: const TextStyle(color: Color.fromRGBO(3, 51, 71, 1.0)),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle: const TextStyle(color: Color.fromRGBO(3, 51, 71, 1.0)),
                                    filled: true,
                                    fillColor: const Color.fromRGBO(236, 230, 214, 0.5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  obscureText: true,
                                  style: const TextStyle(color: Color.fromRGBO(3, 51, 71, 1.0)),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: _submit, // Call submit method
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                    backgroundColor: const Color.fromRGBO(255, 147, 0, 1.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(_isLogin ? 'Login' : 'Register'),
                                ),
                                const SizedBox(height: 10),
                                TextButton(
                                  onPressed: _toggleAuthMode,
                                  child: Text(
                                    _isLogin
                                        ? 'Don\'t have an account? Register'
                                        : 'Already have an account? Login',
                                    style: const TextStyle(color: Color.fromRGBO(3, 51, 71, 1.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: const Color.fromRGBO(255, 255, 255, 0.8),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  _isLogin ? 'Login' : 'Register',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(3, 51, 71, 1.0),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                if (!_isLogin)
                                  TextFormField(
                                    controller: _usernameController,
                                    decoration: InputDecoration(
                                      labelText: 'Username',
                                      labelStyle: const TextStyle(color: Color.fromRGBO(3, 51, 71, 1.0)),
                                      filled: true,
                                      fillColor: const Color.fromRGBO(236, 230, 214, 0.5),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    style: const TextStyle(color: Color.fromRGBO(3, 51, 71, 1.0)),
                                  ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: const TextStyle(color: Color.fromRGBO(3, 51, 71, 1.0)),
                                    filled: true,
                                    fillColor: const Color.fromRGBO(236, 230, 214, 0.5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  style: const TextStyle(color: Color.fromRGBO(3, 51, 71, 1.0)),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle: const TextStyle(color: Color.fromRGBO(3, 51, 71, 1.0)),
                                    filled: true,
                                    fillColor: const Color.fromRGBO(236, 230, 214, 0.5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  obscureText: true,
                                  style: const TextStyle(color: Color.fromRGBO(3, 51, 71, 1.0)),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: _submit, // Call submit method
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                    backgroundColor: const Color.fromRGBO(255, 147, 0, 1.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(_isLogin ? 'Login' : 'Register'),
                                ),
                                const SizedBox(height: 10),
                                TextButton(
                                  onPressed: _toggleAuthMode,
                                  child: Text(
                                    _isLogin
                                        ? 'Don\'t have an account? Register'
                                        : 'Already have an account? Login',
                                    style: const TextStyle(color: Color.fromRGBO(3, 51, 71, 1.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Quisque sit amet accumsan arcu. Nulla facilisi. Phasellus '
                          'in dolor euismod, tincidunt orci in, pellentesque velit. '
                          'Nullam ac vestibulum sem. Donec at venenatis mauris. Aliquam '
                          'euismod neque at enim feugiat, et dictum felis pretium. '
                          'Phasellus consequat orci vel elit euismod, sed fermentum odio. '
                          'Vestibulum aliquet, mauris sed cursus tempus, leo libero '
                          'mollis magna, nec fringilla turpis sem at arcu. Aliquam erat volutpat.',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
