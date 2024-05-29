import 'package:e_commerce_shopping_app_provider/models/cart.dart';
import 'package:e_commerce_shopping_app_provider/provider/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final CartModel model;

  const CartItem({super.key, required this.model});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width * 0.30,
            height: size.height * 0.13,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Image.asset(
                widget.model.product.image,
                height: 70,
                width: 70,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.model.product.name,
                  style: GoogleFonts.poppins(
                    fontSize: size.width * 0.035,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Text(
                  "\$ ${widget.model.product.price}",
                  style: GoogleFonts.poppins(
                    fontSize: size.width * 0.035,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.030,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<CartProvider>().incrementQty(
                            widget.model.id);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Icon(
                          Iconsax.add,
                          color: Colors.black,
                          size: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Text(
                      widget.model.quantity.toString(),
                      style: GoogleFonts.poppins(
                        //fontSize: size.width * 0.035,
                        //color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<CartProvider>().decrementQty(
                            widget.model.id);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Icon(
                          Iconsax.minus,
                          color: Colors.black,
                          size: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<CartProvider>().removeItem(widget.model.id);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Color.fromARGB(255, 247, 247, 247),
                  content: Text(
                    "Item Removed!",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.redAccent.withOpacity(0.07),
              radius: 18,
              child: const Icon(
                  CupertinoIcons.delete_solid,
                color: Colors.redAccent,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
