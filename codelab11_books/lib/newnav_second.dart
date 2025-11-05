import 'package:flutter/material.dart';

class NewNavigationSecond extends StatefulWidget {
  const NewNavigationSecond({super.key});

  @override
  State<NewNavigationSecond> createState() => _NewNavigationSecondState();
}

class _NewNavigationSecondState extends State<NewNavigationSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF667eea), Color(0xFF764ba2)],
          ),
        ),
        child: Column(
          children: [
            // Custom AppBar
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
                  colors: [Colors.black.withOpacity(0.3), Colors.transparent],
                ),
              ),
              child: GestureDetector(
                // Tambahkan GestureDetector di sini
                onTap: () {
                  Navigator.pop(context); // Kembali ketika di tap
                },
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose Gradient',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.1,
                          ),
                        ),
                        Text(
                          'Select your favorite gradient',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Gradient Option 1 - Sunset
                    _buildGradientOption(context, 'Sunset', [
                      Colors.orange.shade700,
                      Colors.pink.shade600,
                      Colors.purple.shade700,
                    ], Icons.wb_sunny_outlined),

                    // Gradient Option 2 - Ocean
                    _buildGradientOption(context, 'Ocean', [
                      Colors.blue.shade700,
                      Colors.blue.shade400,
                      Colors.blue.shade200,
                    ], Icons.water_drop_outlined),

                    // Gradient Option 3 - Forest
                    _buildGradientOption(context, 'Forest', [
                      Colors.green.shade800,
                      Colors.green.shade500,
                      Colors.lightGreen.shade300,
                    ], Icons.park_outlined),

                    // Gradient Option 4 - Fire
                    _buildGradientOption(context, 'Fire', [
                      Colors.red.shade700,
                      Colors.orange.shade600,
                      Colors.yellow.shade600,
                    ], Icons.local_fire_department_outlined),

                    // Gradient Option 5 - Royal
                    _buildGradientOption(context, 'Royal', [
                      Colors.purple.shade800,
                      Colors.purple.shade500,
                      Colors.blue.shade300,
                    ], Icons.auto_awesome_outlined),

                    // Gradient Option 6 - Mint
                    _buildGradientOption(context, 'Mint', [
                      Colors.teal.shade700,
                      Colors.cyan.shade400,
                      Colors.lightBlue.shade200,
                    ], Icons.icecream_outlined),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientOption(
    BuildContext context,
    String title,
    List<Color> colors,
    IconData icon,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {
            Navigator.pop(context, colors);
          },
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: colors,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 15),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 1.1,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white.withOpacity(0.2),
                    border: Border.all(color: Colors.white.withOpacity(0.4)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Select',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 12,
                      ),
                    ],
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
