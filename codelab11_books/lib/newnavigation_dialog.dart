import 'package:flutter/material.dart';

class NewNavigationDialogScreen extends StatefulWidget {
  const NewNavigationDialogScreen({super.key});

  @override
  State<NewNavigationDialogScreen> createState() =>
      _NewNavigationDialogScreenState();
}

class _NewNavigationDialogScreenState extends State<NewNavigationDialogScreen> {
  List<Color> gradientColors = [
    Colors.blue.shade700,
    Colors.blue.shade400,
    Colors.blue.shade200,
  ];

  _showColorDialog(BuildContext context) async {
    final result = await showDialog(
      barrierDismissible: true,
      context: context,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple.shade800, Colors.blue.shade800],
            ),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 25,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0), // <- Kurangi padding
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header dengan icon - PERKECIL
                Container(
                  width: 60, // <- Kecilkan
                  height: 60, // <- Kecilkan
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.palette_outlined,
                    size: 30, // <- Kecilkan
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 16), // <- Kurangi
                // Title
                const Text(
                  'Choose Your Theme',
                  style: TextStyle(
                    fontSize: 20, // <- Kecilkan
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.1,
                  ),
                ),

                const SizedBox(height: 6), // <- Kurangi
                // Subtitle
                Text(
                  'Select your favorite color combination',
                  style: TextStyle(
                    fontSize: 12, // <- Kecilkan
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                // Color Options Grid - PERKECIL UKURANNYA
                Wrap(
                  spacing: 12, // <- Kurangi
                  runSpacing: 12, // <- Kurangi
                  alignment: WrapAlignment.center,
                  children: [
                    _buildColorOption(context, 'Sunset', [
                      Colors.orange.shade700,
                      Colors.pink.shade600,
                      Colors.purple.shade700,
                    ], Icons.wb_sunny_outlined),
                    _buildColorOption(context, 'Ocean', [
                      Colors.blue.shade700,
                      Colors.blue.shade400,
                      Colors.blue.shade200,
                    ], Icons.water_drop_outlined),
                    _buildColorOption(context, 'Forest', [
                      Colors.green.shade800,
                      Colors.green.shade500,
                      Colors.lightGreen.shade300,
                    ], Icons.park_outlined),
                    _buildColorOption(context, 'Fire', [
                      Colors.red.shade700,
                      Colors.orange.shade600,
                      Colors.yellow.shade600,
                    ], Icons.local_fire_department_outlined),
                    _buildColorOption(context, 'Royal', [
                      Colors.purple.shade800,
                      Colors.purple.shade500,
                      Colors.blue.shade300,
                    ], Icons.auto_awesome_outlined),
                    _buildColorOption(context, 'Mint', [
                      Colors.teal.shade700,
                      Colors.cyan.shade400,
                      Colors.lightBlue.shade200,
                    ], Icons.icecream_outlined),
                  ],
                ),

                const SizedBox(height: 16), // <- Kurangi
                // Close Button - PERKECIL
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                      ), // <- Kecilkan
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <- Kecilkan
                        side: BorderSide(
                          color: Colors.white.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Maybe Later',
                      style: TextStyle(
                        fontSize: 14, // <- Kecilkan
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    if (result != null) {
      setState(() {
        gradientColors = result;
      });
    }
  }

  // PERKECIL UKURAN COLOR OPTION
  Widget _buildColorOption(
    BuildContext context,
    String title,
    List<Color> colors,
    IconData icon,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, colors);
      },
      child: Container(
        width: 85, // <- Kecilkan dari 100
        height: 100, // <- Kecilkan dari 120
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), // <- Kecilkan
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8, // <- Kecilkan
              offset: const Offset(0, 3), // <- Kecilkan
            ),
          ],
        ),
        child: Column(
          children: [
            // Gradient Box - PERKECIL
            Container(
              width: 85, // <- Kecilkan
              height: 60, // <- Kecilkan
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: colors,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), // <- Kecilkan
                  topRight: Radius.circular(16), // <- Kecilkan
                ),
              ),
              child: Icon(icon, color: Colors.white, size: 20), // <- Kecilkan
            ),

            // Title Box - PERKECIL
            Container(
              width: 85, // <- Kecilkan
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16), // <- Kecilkan
                  bottomRight: Radius.circular(16), // <- Kecilkan
                ),
              ),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11, // <- Kecilkan
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
              child: const Column(
                children: [
                  Text(
                    'Gradient Dialog',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Modern Color Picker',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'by Rangga :)',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
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
                      // Main Icon
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.color_lens_outlined,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Current Theme Preview
                      const Text(
                        'Current Theme',
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
                        width: 220,
                        height: 70,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: gradientColors,
                          ),
                          borderRadius: BorderRadius.circular(35),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Change Theme Button
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            _showColorDialog(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: gradientColors.first,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 18,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 0,
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.palette_outlined, size: 24),
                              SizedBox(width: 12),
                              Text(
                                'Choose Theme',
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
