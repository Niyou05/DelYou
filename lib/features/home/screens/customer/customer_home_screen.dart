
import 'package:DelYou/features/delivery/screens/create_delivery_screen.dart';
import 'package:flutter/material.dart';
import 'package:DelYou/features/delivery/screens/create_delivery_screen.dart';
import 'package:DelYou/features/Traking/customer_traking_screen.dart';
import 'package:DelYou/features/profile/customer_profile_screen.dart';




// ================= COLORS =================

const Color primaryGreen = Color(0xFF006837);
const Color lightGreen = Color(0xFFE8F5EC);
const Color pageBackground = Color.fromARGB(255, 145, 155, 139);

// ================= CUSTOMER HOME SCREEN =================

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() =>
      _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int selectedIndex = 0;

  // ================= SERVICE SELECTION =================

  void selectService(String service) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$service selected',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryGreen,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // ================= BUILD =================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: const Color(0xFFFFF3E0),
  extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF9800),
              Color(0xFFFFF3E0),
            ],
          ),
        ),

        child: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),

            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  14,
                  20,
                  110,
                ),

                sliver: SliverList(
                  delegate: SliverChildListDelegate([

                    // HEADER
                    _buildHeader(),

                    const SizedBox(height: 18),

                    // SEARCH BAR
                    _buildSearchBar(),

                    const SizedBox(height: 22),

                    // HERO BANNER
                    _buildHeroBanner(),

                    const SizedBox(height: 25),

                    // DELIVERY OPTIONS
                    _buildServicesSection(),

                    const SizedBox(height: 25),

                    // MARKETPLACE CATEGORIES
                    _buildMarketplaceSection(),

                    const SizedBox(height: 27),

                    // PROMOTION
                    _buildPromotionCard(),

                    const SizedBox(height: 25),

                    // POPULAR PLACES
                    _buildPopularNearYou(),

                    const SizedBox(height: 25),

                    // RECENT ACTIVITY
                    _buildRecentActivity(),

                  ]),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  // ================= HEADER =================

  Widget _buildHeader() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),

      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFF9800),
            Color(0xFFFFF3E0),
          ],
        ),

        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),

      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: lightGreen,
            backgroundImage: const AssetImage(
              'assets/images/ss.jpg',
            ),
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
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),

                SizedBox(height: 3),

                Text(
                  'Hello Adam 👋',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          Material(
            color: const Color(0xFF006837),
            shape: const CircleBorder(),

            child: IconButton(
              onPressed: () => selectService('Notifications'),
              icon: const Icon(
                Icons.notifications_none_rounded,
              ),
              color: Colors.white,
              iconSize: 24,
            ),
          ),
        ],
      ),
    );
  }

  // ================= SEARCH BAR =================

  Widget _buildSearchBar() {
    return Container(
      height: 53,

      padding: const EdgeInsets.symmetric(horizontal: 16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: TextField(
        textInputAction: TextInputAction.search,

        onSubmitted: (value) {
          if (value.trim().isNotEmpty) {
            selectService('Search: $value');
          }
        },

        decoration: InputDecoration(
          hintText: 'Search food, shops, products...',

          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 12,
          ),

          prefixIcon: const Icon(
            Icons.search_rounded,
            color: primaryGreen,
          ),

          border: InputBorder.none,
        ),
      ),
    );
  }

  // ================= HERO BANNER =================

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

              Positioned(
                right: 18,
                bottom: 11,

                child: ElevatedButton(
                  onPressed: () =>
                      selectService('Black Friday offer'),

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromARGB(255, 3, 4, 3),

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

  // ================= DELIVERY OPTIONS =================

  Widget _buildServicesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Row(
          children: [
            const Text(
              'Delivery Options',

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Spacer(),

            GestureDetector(
              onTap: () => selectService('All delivery options'),

              child: const Text(
                'See all',

                style: TextStyle(
                  fontSize: 11,
                  color: Colors.black,
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

  // ================= DELIVERY ITEM =================

  Widget _serviceItem(
    String title,
    IconData icon,
    String price,
  ) {
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

            child: Icon(
              icon,
              color: const Color.fromARGB(255, 248, 255, 250),
              size: 23,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            title,
            textAlign: TextAlign.center,

            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
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

  // ================= MARKETPLACE CATEGORIES =================

  Widget _buildMarketplaceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Text(
          'Explore Categories',

          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 15),

        SizedBox(
          height: 105,

          child: ListView(
            scrollDirection: Axis.horizontal,

            children: [
              _categoryItem(
                'Food',
                Icons.restaurant_rounded,
                const Color(0xFFFFE5D6),
              ),

              _categoryItem(
                'Market',
                Icons.shopping_basket_rounded,
                const Color(0xFFE8F5EC),
              ),

              _categoryItem(
                'Pharmacy',
                Icons.local_pharmacy_rounded,
                const Color(0xFFE5EDFF),
              ),

              _categoryItem(
                'Shops',
                Icons.shopping_bag_rounded,
                const Color(0xFFFFF0D9),
              ),

              _categoryItem(
                'Electronics',
                Icons.devices_rounded,
                const Color(0xFFF0E5FF),
              ),

              _categoryItem(
                'More',
                Icons.grid_view_rounded,
                const Color(0xFFE5F4F4),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ================= CATEGORY ITEM =================

  Widget _categoryItem(
    String title,
    IconData icon,
    Color background,
  ) {
    return GestureDetector(
      onTap: () => selectService(title),

      child: Container(
        width: 78,
        margin: const EdgeInsets.only(right: 12),

        child: Column(
          children: [
            Container(
              height: 58,
              width: 58,

              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(19),
              ),

              child: Icon(
                icon,
                color: primaryGreen,
                size: 25,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              title,
              textAlign: TextAlign.center,

              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= PROMOTION CARD =================

  Widget _buildPromotionCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Text(
          'Special offers',

          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
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

                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 10,
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      height: 29,

                      child: ElevatedButton(
                        onPressed: () =>
                            selectService('Track delivery'),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB8F000),
                          foregroundColor: const Color(0xFF173B20),
                          elevation: 0,

                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                          ),

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

  // ================= POPULAR NEAR YOU =================

  Widget _buildPopularNearYou() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Row(
          children: [
            const Text(
              'Popular Near You',

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Spacer(),

            GestureDetector(
              onTap: () => selectService('All nearby places'),

              child: const Text(
                'See all',

                style: TextStyle(
                  color: primaryGreen,
                  fontSize: 11,
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
              child: _popularCard(
                'Restaurants',
                'Discover local food',
                Icons.restaurant_rounded,
                const Color(0xFFFFE5D6),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: _popularCard(
                'Supermarkets',
                'Daily essentials',
                Icons.shopping_cart_rounded,
                const Color(0xFFE8F5EC),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: _popularCard(
                'Local Shops',
                'Explore nearby stores',
                Icons.storefront_rounded,
                const Color(0xFFFFF0D9),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: _popularCard(
                'Pharmacies',
                'Health essentials',
                Icons.local_pharmacy_rounded,
                const Color(0xFFE5EDFF),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ================= POPULAR CARD =================

  Widget _popularCard(
    String title,
    String subtitle,
    IconData icon,
    Color background,
  ) {
    return GestureDetector(
      onTap: () => selectService(title),

      child: Container(
        padding: const EdgeInsets.all(13),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              height: 43,
              width: 43,

              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(13),
              ),

              child: Icon(
                icon,
                color: primaryGreen,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              title,

              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              subtitle,

              style: TextStyle(
                fontSize: 9,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= RECENT ACTIVITY =================

  Widget _buildRecentActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Row(
          children: [
            const Text(
              'Recent activity',

              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Spacer(),

            GestureDetector(
              onTap: () => selectService('Order history'),

              child: const Text(
                'See all',

                style: TextStyle(
                  fontSize: 11,
                  color: Colors.black,
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

                child: Icon(
                  Icons.local_shipping_rounded,
                  color: Color.fromARGB(255, 248, 250, 249),
                ),
              ),

              SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      'Your deliveries',

                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),

                    SizedBox(height: 4),

                    Text(
                      'Your recent orders will appear here.',

                      style: TextStyle(
                        color: Color.fromARGB(255, 246, 245, 245),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),

              Icon(
                Icons.chevron_right_rounded,
                color: primaryGreen,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ================= BOTTOM NAVIGATION =================

Widget _buildBottomNavigation() {
  return SafeArea(
    minimum: const EdgeInsets.fromLTRB(20, 0, 20, 12),
    child: Container(
      height: 68,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 246, 123, 0).withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildNavItem(Icons.home_rounded, 'Home', 0),
          _buildNavItem(Icons.receipt_long_outlined, 'Orders', 1),

          // CREATE BUTTON
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const CreateDeliveryScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF9800),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: primaryGreen.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ),
          ),

          _buildNavItem(Icons.track_changes, 'track', 2),
          _buildNavItem(Icons.person_outline_rounded, 'Profile', 3),
        ],
      ),
    ),
  );
}

// NAVIGATION ITEM
Widget _buildNavItem(IconData icon, String title, int index) {
  final isSelected = selectedIndex == index;

  return Expanded(
    child: GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });

        if (index == 2) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const CustomerTrackingScreen(),
    ),
  );
} //Tracking

else if (index == 3) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CustomerProfileScreen(),
      ),
    );
  } // Profile


 else if (index != 0) {
  selectService(title);
}
      }, //No actions
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFFFE0B2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 19,
              color: isSelected
                  ? const Color(0xFFFF9800)
                  : Colors.grey.shade600,
            ),
            const SizedBox(height: 3),
            Text(
              title,
              style: TextStyle(
                fontSize: 9,
                fontWeight:
                    isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected
                    ? Colors.black
                    : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}
