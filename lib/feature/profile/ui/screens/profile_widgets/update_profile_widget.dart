import 'package:flutter/material.dart';
import 'avatar_selection_dialog.dart';

class UpdateProfileWidget extends StatefulWidget {
  const UpdateProfileWidget({super.key});

  @override
  State<UpdateProfileWidget> createState() => _UpdateProfileWidgetState();
}

class _UpdateProfileWidgetState extends State<UpdateProfileWidget> {
  // Controllers for text fields
  final TextEditingController _nameController =
      TextEditingController(text: 'John Safwat');
  final TextEditingController _phoneController =
      TextEditingController(text: '01200000000');

  // Selected avatar
  String _selectedAvatar = 'assets/images/pp.png';

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  // Show avatar selection dialog
  void _showAvatarSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AvatarSelectionDialog(
          onAvatarSelected: (String avatarPath) {
            setState(() {
              _selectedAvatar = avatarPath;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFF6BD00),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Pick Avatar',
          style: TextStyle(
            color: Color(0xFFF6BD00),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    // Avatar section
                    GestureDetector(
                      onTap: _showAvatarSelectionDialog,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              const Color(0xFF8FD3F4), // Light blue background
                          image: DecorationImage(
                            image: AssetImage(_selectedAvatar),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Name input field
                    Container(
                      height: 54,
                      decoration: BoxDecoration(
                        color: const Color(0xFF282A28),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          children: [
                            const Icon(Icons.person,
                                color: Colors.white, size: 30),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: _nameController,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your name',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Phone input field
                    Container(
                      height: 54,
                      decoration: BoxDecoration(
                        color: const Color(0xFF282A28),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          children: [
                            const Icon(Icons.phone,
                                color: Colors.white, size: 25),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: _phoneController,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your phone number',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
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

          // Button section at the bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Delete Account Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      // Show confirmation dialog
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: const Color(0xFF282A28),
                          title: const Text(
                            'Delete Account',
                            style: TextStyle(color: Colors.white),
                          ),
                          content: const Text(
                            'Are you sure you want to delete your account? This action cannot be undone.',
                            style: TextStyle(color: Colors.white70),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(color: Color(0xFFF6BD00)),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                // Delete account logic would go here
                              },
                              child: const Text(
                                'Delete',
                                style: TextStyle(color: Color(0xFFE82626)),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE82626),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Delete Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Update Data Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate inputs
                      if (_nameController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter your name'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      if (_phoneController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter your phone number'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      // Show success message and return to profile page
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Profile updated successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );

                      // Navigate back after a short delay
                      Future.delayed(const Duration(seconds: 1), () {
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF6BD00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Update Data',
                      style: TextStyle(
                        color: Color(0xFF121312),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
