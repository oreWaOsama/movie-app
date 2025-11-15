import 'package:flutter/material.dart';

class WatchListWidget extends StatelessWidget {
  const WatchListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 120,
        height: 120,
        child: Image.asset(
          'assets/images/watch_list.png',
          fit: BoxFit.contain,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) return child;
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: frame != null
                  ? child
                  : const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            debugPrint('Error loading image: $error');
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, color: Colors.red[400], size: 48),
                const SizedBox(height: 16),
                const Text(
                  'Error loading image',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
