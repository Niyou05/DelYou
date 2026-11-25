
import 'package:DelYou/features/delivery/screens/create_delivery_screen.dart';
import 'package:flutter/material.dart';
import 'package:DelYou/features/delivery/screens/create_delivery_screen.dart';
import 'package:DelYou/features/Traking/customer_traking_screen.dart';
import 'package:DelYou/features/profile/customer_profile_screen.dart';
import 'package:DelYou/features/Cart/custome_cart_screen.dart';

// *** colors *** //

const Color primaryGreen = Color(0xFF006837);
const Color darkGreen = Color(0xFF004B2B);
const Color lightGreen = Color(0xFFE8F5EC);
const Color softGreen = Color(0xFFDDF5E7);
const Color pageBackground = Color(0xFFF7FAF8);
const Color textDark = Color(0xFF17211B);
const Color textGrey = Color(0xFF7B8580);



// *** CUSTOMER HOME SCREEN *** //

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() =>
      _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int selectedIndex = 0;

  // *** SERVICE SELECTION *** //

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

 
  // *** Build *** //




@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: pageBackground,
    extendBody: true,
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFE8F5EC),
            Color(0xFFF7FAF8),
            Colors.white,
          ],
        ),
      ),
      child: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                18, 14, 18, 110,
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildHeader(),
                  const SizedBox(height: 20),

                  _buildSearchBar(),
                  const SizedBox(height: 22),

                  _buildHeroBanner(),
                  const SizedBox(height: 25),

                  _buildServicesSection(),
                  const SizedBox(height: 25),

                  _buildMarketplaceSection(),
                  const SizedBox(height: 25),

                  _buildPromotionCard(),
                  const SizedBox(height: 25),

                  _buildPopularNearYou(),
                  const SizedBox(height: 25),

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
 

 
                                              // *** HEADER *** //




Widget _buildHeader() {
  return Row(
    children: [
      Container(
        height: 48,
        width: 48,
        decoration: const BoxDecoration(
          color: softGreen,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.delivery_dining_rounded,
          color: primaryGreen,
          size: 28,
        ),
      ),

      const SizedBox(width: 12),

      const Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery to',
              style: TextStyle(
                fontSize: 12,
                color: textGrey,
              ),
            ),
            SizedBox(height: 3),
            Row(
              children: [
                Text(
                  'Batna, Algeria',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textDark,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 19,
                  color: primaryGreen,
                ),
              ],
            ),
          ],
        ),
      ),

      Container(
        height: 46,
        width: 46,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () => selectService('Notifications'),
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: primaryGreen,
          ),
        ),
      ),
    ],
  );
}
                                          
                                          
                                          
                                          
                                          // *** SEARCH BAR *** //





Widget _buildSearchBar() {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 54,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: primaryGreen.withOpacity(0.05),
                blurRadius: 12,
                offset: const Offset(0, 4),
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
              hintText: 'Search for anything...',
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 13,
              ),
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: primaryGreen,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),

      const SizedBox(width: 10),

      Container(
        height: 54,
        width: 54,
        decoration: const BoxDecoration(
          color: primaryGreen,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () => selectService('Filters'),
          icon: const Icon(
            Icons.tune_rounded,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
                                      
                                      
                                      
                                         // *** HERO BANNER *** //


  



Widget _buildHeroBanner() {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreateDeliveryScreen(),
        ),
      );
    },
    child: Container(
      height: 155,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFDDF5E7),
            Color(0xFFB8E6CA),
          ],
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'New Delivery',
                  style: TextStyle(
                    fontSize: 23,
                    height: 1.1,
                    fontWeight: FontWeight.w800,
                    color: darkGreen,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Fast • Safe • Reliable',
                  style: TextStyle(
                    fontSize: 11,
                    color: darkGreen,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Send Package',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Icon(
              Icons.delivery_dining_rounded,
              size: 95,
              color: primaryGreen,
            ),
          ),
        ],
      ),
    ),
  );
}


                            
                      // *** DELIVERY OPTIONS *** //








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





                           // *** DELIVERY ITEM *** //





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
    minimum: const EdgeInsets.fromLTRB(18, 0, 18, 12),
    child: Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: darkGreen,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: primaryGreen.withOpacity(0.20),
            blurRadius: 20,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildNavItem(Icons.home_rounded, 'Home', 0),

          _buildNavItem(
            Icons.local_shipping_outlined,
            'Track',
            1,
          ),

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
                  height: 54,
                  width: 54,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFB8F000),
                      width: 3,
                    ),
                  ),
                  child: const Icon(
                    Icons.add_rounded,
                    color: primaryGreen,
                    size: 32,
                  ),
                ),
              ),
            ),
          ),

          _buildNavItem(
            Icons.shopping_bag_outlined,
            'Cart',
            2,
          ),

          _buildNavItem(
            Icons.person_outline_rounded,
            'Profile',
            3,
          ),
        ],
      ),
    ),
  );
}

Widget _buildNavItem(
  IconData icon,
  String title,
  int index,
) {
  final isSelected = selectedIndex == index;

  return Expanded(
    child: GestureDetector(
      onTap: () {
        if (index == 0) {
          setState(() {
            selectedIndex = 0;
          });
          return;
        }

        setState(() {
          selectedIndex = index;
        });

        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const CustomerTrackingScreen(),
            ),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartScreen(),
            ),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const CustomerProfileScreen(),
            ),
          );
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withOpacity(0.13)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 21,
              color: isSelected
                  ? const Color(0xFFB8F000)
                  : Colors.white70,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 9,
                fontWeight: isSelected
                    ? FontWeight.bold
                    : FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}
