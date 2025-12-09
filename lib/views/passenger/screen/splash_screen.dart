import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_bus/core/theme/colors.dart';

class HelloBusSplashScreen extends StatefulWidget {
  const HelloBusSplashScreen({super.key});

  @override
  State<HelloBusSplashScreen> createState() => _HelloBusSplashScreenState();
}

class _HelloBusSplashScreenState extends State<HelloBusSplashScreen>
    with TickerProviderStateMixin {
  
  late AnimationController busController;
  late AnimationController watermarkController;
  late AnimationController textController;

  late Animation<double> busScale;
  late Animation<double> watermarkScale;
  late Animation<double> textOpacity;

  @override
  void initState() {
    super.initState();

    // --- Bus Zoom Animation ---
    busController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    busScale = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: busController, curve: Curves.easeOut),
    );
    busController.forward();

    // --- Watermark Pulse Animation ---
    watermarkController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      lowerBound: 0.9,
      upperBound: 1.05,
    )..repeat(reverse: true);
    watermarkScale = watermarkController;

    // --- Text Fade-in Animation ---
    textController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    textOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: textController, curve: Curves.easeIn),
    );
    textController.forward();

    // --- Auto Navigate to Login after 5 seconds ---
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  void dispose() {
    busController.dispose();
    watermarkController.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.backgroundTop, AppColors.backgroundBottom],
          ),
        ),
        child: Stack(
          children: [
            // Watermark Animation
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              left: 0,
              right: 0,
              child: ScaleTransition(
                scale: watermarkScale,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Hello",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 150,
                        fontWeight: FontWeight.w100,
                        color: AppColors.watermarkText,
                        height: 1.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Bus",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 150,
                        fontWeight: FontWeight.w800,
                        color: AppColors.watermarkText,
                        height: 1.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            // Bus Zoom Animation
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Center(
                child: ScaleTransition(
                  scale: busScale,
                  child: Image.asset(
                    'assets/images/bus.png',
                    width: 700,
                    height: 420,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            // Footer text with fade animation
            Positioned(
              bottom: 120,
              left: 0,
              right: 0,
              child: FadeTransition(
                opacity: textOpacity,
                child: Column(
                  children: [
                    Text(
                      "We're going on a trip.",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Are you in?",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
