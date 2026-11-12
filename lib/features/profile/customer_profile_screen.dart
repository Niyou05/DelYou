import 'package:flutter/material.dart';

class CustomerProfileScreen extends StatelessWidget {
  const CustomerProfileScreen({super.key});

  static const Color primaryGreen = Color(0xFF006837);
  static const Color backgroundColor = Color(0xFFF4F8F3);
  static const Color accentOrange = Color(0xFFFF9800);
  static const Color textColor = Color(0xFF26332D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // PAGE HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My Profile',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: primaryGreen,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _showMessage(context, 'Settings coming soon');
                    },
                    icon: const Icon(
                      Icons.settings_outlined,
                      color: primaryGreen,
                      size: 27,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // PROFILE CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 48,
                          backgroundColor: Color(0xFFE8F5EC),
                          backgroundImage: AssetImage(
                            'assets/images/ss.jpg',
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            decoration: const BoxDecoration(
                              color: primaryGreen,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 17,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      'Your Name',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      '+213 XXX XX XX XX',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 18),

                    SizedBox(
                      width: 150,
                      height: 43,
                      child: ElevatedButton.icon(
                        onPressed: () => _showEditDialog(context),
                        icon: const Icon(Icons.edit_outlined, size: 17),
                        label: const Text('Edit Profile'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryGreen,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ACCOUNT SECTION
              _sectionTitle('My Account'),

              const SizedBox(height: 12),

              _menuCard([
                _menuItem(
                  context,
                  icon: Icons.receipt_long_outlined,
                  title: 'My Orders',
                  subtitle: 'View your order history',
                ),
                _menuItem(
                  context,
                  icon: Icons.location_on_outlined,
                  title: 'Saved Addresses',
                  subtitle: 'Manage your delivery locations',
                ),
                _menuItem(
                  context,
                  icon: Icons.payment_outlined,
                  title: 'Payment Methods',
                  subtitle: 'Manage your payments',
                ),
                _menuItem(
                  context,
                  icon: Icons.favorite_border,
                  title: 'Favorites',
                  subtitle: 'Your favorite shops and services',
                  showDivider: false,
                ),
              ]),

              const SizedBox(height: 25),

              // SUPPORT SECTION
              _sectionTitle('Support'),

              const SizedBox(height: 12),

              _menuCard([
                _menuItem(
                  context,
                  icon: Icons.help_outline,
                  title: 'Help Center',
                  subtitle: 'Get help with DelYou',
                ),
                _menuItem(
                  context,
                  icon: Icons.headset_mic_outlined,
                  title: 'Contact Us',
                  subtitle: 'We are here to help',
                  showDivider: false,
                ),
              ]),

              const SizedBox(height: 25),

              // LOGOUT
              SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton.icon(
                  onPressed: () => _showLogoutDialog(context),
                  icon: const Icon(Icons.logout, color: Colors.red),
                  label: const Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.red.withOpacity(0.25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Center(
                child: Text(
                  'DelYou • Your Delivery, Your Way',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    );
  }

  Widget _menuCard(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: children),
    );
  }

  Widget _menuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          leading: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5EC),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: primaryGreen),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 12),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: Colors.grey,
          ),
          onTap: () => _showMessage(context, '$title coming soon'),
        ),
        if (showDivider)
          const Divider(height: 1, indent: 58),
      ],
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: primaryGreen,
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    _showMessage(context, 'Edit profile screen coming soon');
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              _showMessage(context, 'Logout functionality coming soon');
            },
            child: const Text(
              'Log Out',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}