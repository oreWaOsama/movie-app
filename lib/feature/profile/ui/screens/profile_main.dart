import 'package:flutter/material.dart';
import 'profile_widgets/history_widget.dart';
import 'profile_widgets/update_profile_widget.dart';
import 'profile_widgets/watch_list_widget.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({super.key});

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  int _selectedTab = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF202020),
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Column(
                children: [
                  // Profile info row containing picture+name and stats
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Profile picture and name column
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Container(
                                  width: 118,
                                  height: 118,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset(
                                    'assets/images/pp.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                const Text(
                                  'John Safwat',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Stats column (Wish List and History)
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _buildStatColumn('12', 'Wish List'),
                                  _buildStatColumn('10', 'History'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 24),

                  // Buttons Row
                  Row(
                    children: [
                      // Edit Profile Button
                      Expanded(
                        child: Container(
                          height: 56,
                          margin: const EdgeInsets.only(right: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const UpdateProfileWidget(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF6BD00),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35),
                            ),
                            child: const Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Color(0xFF121312),
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Exit Button
                      SizedBox(
                        width: 135,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE82626),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Exit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.logout, size: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Tab Bar
                  Row(
                    children: [
                      Expanded(
                        child: _buildTab(
                          'Watch List',
                          Icons.format_list_bulleted,
                          0,
                        ),
                      ),
                      Expanded(
                        child: _buildTab(
                          'History',
                          Icons.folder_outlined,
                          1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Content Area
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Expanded(child: _buildTabContent()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, IconData icon, int index) {
    final isSelected = _selectedTab == index;
    return InkWell(
      onTap: () => _onTabSelected(index),
      child: Container(
        padding: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 3,
              color: isSelected ? const Color(0xFFF6BD00) : Colors.transparent,
            ),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTab) {
      case 0:
        return const WatchListWidget();
      case 1:
        return const HistoryWidget();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w800,
            height: 1, // Reduce line height
          ),
          softWrap: false, // Prevent text wrapping
          overflow: TextOverflow.visible, // Allow text to overflow if needed
        ),
      ],
    );
  }
}
