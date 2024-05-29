import 'package:e_commerce_shopping_app_provider/provider/cart.dart';
import 'package:e_commerce_shopping_app_provider/screens/favs/view.dart';
import 'package:e_commerce_shopping_app_provider/screens/home/view.dart';
import 'package:e_commerce_shopping_app_provider/screens/order/view.dart';
import 'package:e_commerce_shopping_app_provider/screens/profile/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'cart/view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final size = Size.zero;
  int currentIndex = 0;

  final navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  List<Widget> screens = [
    const HomeScreen(),
    const FavouriteScreen(),
    const CartScreen(),
    const OrderScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black26,
              width: 0.5,
            ),
          ),
        ),
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            bottomNavigationBarTheme: Theme.of(context).bottomNavigationBarTheme,
          ),
          child: BottomNavigationBar(
            items: [
              getIcon(0, "Home",Iconsax.home_14,),
              getIcon(1, "Favourite", Iconsax.heart,),
              BottomNavigationBarItem(
                  icon: Container(
                    padding: EdgeInsets.only(bottom: size.height * 0.005,),
                    margin: const EdgeInsets.only(bottom: 2,),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black26,),
                          ),
                          child: const Center(
                            child: Icon(Iconsax.bag,size: 22,color: Colors.black26,),
                          ),
                        ),
                        Positioned(
                          top: -5,
                            right: -3,
                            child: context.watch<CartProvider>().shoppingCart.isNotEmpty ?
                          CircleAvatar(
                            backgroundColor: Colors.redAccent,
                            radius: 10,
                            child: Text(
                              context.watch<CartProvider>().shoppingCart.length.toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ) : const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                label: "Cart",
              ),
              getIcon(3, "Orders", CupertinoIcons.list_bullet_indent,),
              getIcon(4, "Profile", Iconsax.profile_circle4,),
            ],
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
          ),
        ),
      ),
    );
  }
  getIcon(int i, String label, IconData icon){
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.only(
          bottom: size.height * 0.001,
        ),
        child: Icon(icon),
      ),
      label: label
    );
  }
}
