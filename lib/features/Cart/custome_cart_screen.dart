
import 'package:flutter/material.dart';

const Color primaryGreen = Color(0xFF006837);
const Color pageBackground = Color(0xFFF8F9F7);

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItem> cartItems = [
    CartItem(
      name: 'Fresh Apples',
      description: '1 kg • Fresh fruits',
      price: 450,
      quantity: 2,
      icon: Icons.apple,
      color: const Color(0xFFFFE5E5),
    ),
    CartItem(
      name: 'Fresh Milk',
      description: '1 Liter • Dairy',
      price: 120,
      quantity: 1,
      icon: Icons.local_drink,
      color: const Color(0xFFE5F0FF),
    ),
    CartItem(
      name: 'Fresh Bread',
      description: '1 Piece • Bakery',
      price: 80,
      quantity: 2,
      icon: Icons.bakery_dining,
      color: const Color(0xFFFFF0D9),
    ),
  ];

  final double deliveryFee = 150;

  int get subtotal {
    return cartItems.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }

  int get total {
    return cartItems.isEmpty ? 0 : subtotal + deliveryFee.toInt();
  }

  void increaseQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems.removeAt(index);
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackground,
      appBar: AppBar(
        backgroundColor: pageBackground,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black87,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: cartItems.isEmpty
          ? _buildEmptyCart()
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      _buildCartHeader(),
                      const SizedBox(height: 20),

                      ...List.generate(
                        cartItems.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: _buildCartItem(index),
                        ),
                      ),

                      const SizedBox(height: 10),
                      _buildDeliveryInfo(),
                    ],
                  ),
                ),

                _buildCheckoutSection(),
              ],
            ),
    );
  }

  Widget _buildCartHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Your Items',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${cartItems.length} Products',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildCartItem(int index) {
    final item = cartItems[index];

    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.035),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 85,
            height: 90,
            decoration: BoxDecoration(
              color: item.color,
              borderRadius: BorderRadius.circular(17),
            ),
            child: Icon(
              item.icon,
              size: 42,
              color: primaryGreen,
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  item.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  '${item.price} DA',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: primaryGreen,
                  ),
                ),
              ],
            ),
          ),

          Column(
            children: [
              IconButton(
                onPressed: () => removeItem(index),
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.redAccent,
                  size: 20,
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  color: pageBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    _quantityButton(
                      Icons.remove,
                      () => decreaseQuantity(index),
                    ),

                    Text(
                      '${item.quantity}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),

                    _quantityButton(
                      Icons.add,
                      () => increaseQuantity(index),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quantityButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Icon(
          icon,
          size: 15,
          color: primaryGreen,
        ),
      ),
    );
  }

  Widget _buildDeliveryInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F3EC),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.local_shipping_outlined,
            color: primaryGreen,
            size: 25,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Delivery to your doorstep',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: primaryGreen,
              ),
            ),
          ),
          Icon(
            Icons.check_circle,
            color: primaryGreen,
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutSection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 20, 22, 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        children: [
          _priceRow('Subtotal', '$subtotal DA'),
          const SizedBox(height: 12),
          _priceRow('Delivery Fee', '$deliveryFee DA'),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(),
          ),

          _priceRow(
            'Total',
            '$total DA',
            isTotal: true,
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: cartItems.isEmpty
                  ? null
                  : () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Checkout coming soon!'),
                        ),
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryGreen,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Proceed to Checkout',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward_rounded),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceRow(
    String title,
    String price, {
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isTotal ? 18 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            color: isTotal ? Colors.black87 : Colors.grey,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontSize: isTotal ? 19 : 14,
            fontWeight: FontWeight.bold,
            color: isTotal ? primaryGreen : Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_cart_outlined,
            size: 85,
            color: Colors.grey,
          ),
          const SizedBox(height: 20),
          const Text(
            'Your cart is empty!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Explore stores and add your favorite products.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryGreen,
              foregroundColor: Colors.white,
            ),
            child: const Text('Start Shopping'),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String name;
  final String description;
  final int price;
  int quantity;
  final IconData icon;
  final Color color;

  CartItem({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.icon,
    required this.color,
  });
}
