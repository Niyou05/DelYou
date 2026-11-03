import 'package:flutter/material.dart';

const Color primaryGreen = Color(0xFF006837);
const Color lightGreen = Color(0xFFE8F5EC);
const Color pageBackground = Color.fromARGB(255, 145, 155, 139);

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int selectedIndex = 0;

  void selectService(String service) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$service selected'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 246, 247),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 110),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _buildHeader(),
                    const SizedBox(height: 22),
                    _buildHeroBanner(),
                    const SizedBox(height: 25),
                    _buildServicesSection(),
                    const SizedBox(height: 27),
                    _buildPromotionCard(),
                    const SizedBox(height: 25),
                    _buildRecentActivity(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  // Header: profile image, greeting and notifications.
  Widget _buildHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: lightGreen,
          backgroundImage: const AssetImage('assets/images/ss.jpg'),
          onBackgroundImageError: (_, __) {},
          child: const SizedBox.shrink(),
        ),
        const SizedBox(width: 11),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Good morning',
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              SizedBox(height: 3),
              Text(
                'Hello Adam 👋',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF202820),
                ),
              ),
            ],
          ),
        ),
        Material(
          color: const Color.fromARGB(255, 0, 0, 0),
          shape: const CircleBorder(),
          child: IconButton(
            onPressed: () => selectService('Notifications'),
            icon: const Icon(Icons.notifications_none_rounded),
            color: const Color.fromARGB(255, 254, 255, 255),
            iconSize: 24,
          ),
        ),
      ],
    );
  }

  // Bright promotional banner.
 

Widget _buildHeroBanner() {
  return GestureDetector(
    onTap: () => selectService('Black Friday offer'),
    child: Container(
      height: 165,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/images.jfif',
              fit: BoxFit.cover,
            ),

            // Explore Now button
            Positioned(
              right: 18,
              bottom: 11,
              child: ElevatedButton(
                onPressed: () => selectService('Black Friday offer'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 3, 4, 3),
                  foregroundColor: Colors.white,
                  elevation: 2,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Explore Now',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


  Widget _buildServicesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Services',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => selectService('All services'),
              child: const Text(
                'See all',
                style: TextStyle(
                  fontSize: 11,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: _serviceItem(
                'Motorcycle',
                Icons.two_wheeler_rounded,
                '250 DA',
              ),
            ),
            Expanded(
              child: _serviceItem(
                'Car',
                Icons.directions_car_filled_rounded,
                '400 DA',
              ),
            ),
            Expanded(
              child: _serviceItem(
                'Van',
                Icons.local_shipping_rounded,
                '600 DA',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _serviceItem(String title, IconData icon, String price) {
    return GestureDetector(
      onTap: () => selectService(title),
      child: Column(
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color.fromARGB(255, 248, 255, 250), size: 23),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 3),
          Text(
            price,
            style: const TextStyle(
              fontSize: 9,
              color: primaryGreen,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Large dark-green promotional card.
  Widget _buildPromotionCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Special offers',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 13),
        Container(
          height: 174,
          width: double.infinity,
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
            color: const Color(0xFF004B2B),
            borderRadius: BorderRadius.circular(19),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'DELYOU SPECIAL OFFER',
                      style: TextStyle(
                        fontSize: 9,
                        color: Color(0xFFBDE8CE),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4,
                      ),
                    ),
                    const SizedBox(height: 9),
                    const Text(
                      'Your packages\ndelivered with care',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        height: 1.15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 7),
                    const Text(
                      'Easy. Fast. Reliable.',
                      style: TextStyle(color: Colors.white70, fontSize: 10),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 29,
                      child: ElevatedButton(
                        onPressed: () => selectService('Track delivery'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB8F000),
                          foregroundColor: const Color(0xFF173B20),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          shape: const StadiumBorder(),
                        ),
                        child: const Text(
                          'Track now',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 4,
                child: Icon(
                  Icons.inventory_2_rounded,
                  size: 86,
                  color: Color(0xFFB8F000),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecentActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Recent activity',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => selectService('Order history'),
              child: const Text(
                'See all',
                style: TextStyle(
                  fontSize: 11,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 60, 59, 59),
            borderRadius: BorderRadius.circular(17),
          ),
          child: const Row(
            children: [
              CircleAvatar(
                backgroundColor: Color.fromARGB(255, 9, 9, 9),
                child: Icon(Icons.local_shipping_rounded, color: Color.fromARGB(255, 248, 250, 249)),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your deliveries',
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 13),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Your recent orders will appear here.',
                      style: TextStyle(color: Color.fromARGB(255, 246, 245, 245), fontSize: 10),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: primaryGreen),
            ],
          ),
        ),
      ],
    );
  }

  // Floating bottom navigation bar.
  Widget _buildBottomNavigation() {
    final items = [
      (Icons.home_rounded, 'Home'),
      (Icons.receipt_long_outlined, 'Orders'),
      (Icons.notifications_none_rounded, 'Activity'),
      (Icons.person_outline_rounded, 'Profile'),
    ];

    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(20, 0, 20, 12),
      child: Container(
        height: 62,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: List.generate(items.length, (index) {
            final isSelected = selectedIndex == index;
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() => selectedIndex = index);
                  if (index != 0) {
                    selectService(items[index].$2);
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color.fromARGB(255, 138, 165, 230) : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        items[index].$1,
                        size: 19,
                        color: isSelected ? const Color.fromARGB(255, 0, 0, 0) : const Color.fromARGB(255, 5, 5, 5),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        items[index].$2,
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                          color: isSelected ? const Color.fromARGB(255, 8, 8, 8) : Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
