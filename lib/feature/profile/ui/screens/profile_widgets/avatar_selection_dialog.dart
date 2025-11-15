import 'package:flutter/material.dart';

class AvatarSelectionDialog extends StatelessWidget {
  final Function(String) onAvatarSelected;

  const AvatarSelectionDialog({
    super.key,
    required this.onAvatarSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Sample avatar images - replace with your actual avatar assets
    final List<String> avatars = List.generate(9, (_) => 'assets/images/pp.png');

    return Dialog(
      backgroundColor: const Color(0xFF121312),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 160),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Pick Avatar',
                style: TextStyle(
                  color: Color(0xFFF6BD00),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.0,
                ),
                itemCount: avatars.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      onAvatarSelected(avatars[index]);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFF6BD00),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          avatars[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
