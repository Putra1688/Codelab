import 'package:flutter/material.dart';
import 'newnav_second.dart';

class NewNavigationFirst extends StatefulWidget {
  const NewNavigationFirst({super.key});

  @override
  State<NewNavigationFirst> createState() => _NewNavigationFirstState();
}

class _NewNavigationFirstState extends State<NewNavigationFirst> {
  Future _navigateAndGetColor(BuildContext context) async {
    final result = await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const NewNavigationSecond(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    ) ?? [Colors.blue.shade700, Colors.blue.shade400];
    
    if (result != null) {
      setState(() {
        gradientColors = result;
      });
    }
  }

  List<Color> gradientColors = [
    Colors.blue.shade700,
    Colors.blue.shade400,
    Colors.blue.shade200,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors,
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: Column(
          children: [
            // AppBar Custom
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 60.0,
                bottom: 20.0,
                left: 20.0,
                right: 20.0,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'Gradient Navigator',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'by Rangga',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Animated Icon
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.color_lens_outlined,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // Title
                      const Text(
                        'Current Gradient',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1.1,
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Gradient Preview
                      Container(
                        width: 200,
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: gradientColors,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // Change Color Button
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            _navigateAndGetColor(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: gradientColors.first,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 0,
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.palette_outlined),
                              SizedBox(width: 12),
                              Text(
                                'Change Gradient',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}