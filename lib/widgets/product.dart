import 'package:e_commerce_shopping_app_provider/models/product.dart';
import 'package:e_commerce_shopping_app_provider/provider/cart.dart';
import 'package:e_commerce_shopping_app_provider/provider/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../screens/product/view.dart';

class Product extends StatefulWidget {
  final ProductModel model;

  const Product({super.key, required this.model});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: SizedBox(
        width: size.width * 0.50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white54,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white60,
                        spreadRadius: 0.5,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductScreen(model: widget.model),
                          ),
                        );
                      },
                      child: Image.asset(
                        widget.model.image,
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: widget.model.isAvailable
                      ? GestureDetector(
                          onTap: () {
                            productProvider.toggleFavorite(widget.model);
                          },
                          child: Icon(
                            widget.model.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: size.width * 0.05,
                            color: widget.model.isFavorite
                                ? Colors.redAccent
                                : Colors.black,
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.020,
            ),
            Text(
              widget.model.name,
              style: GoogleFonts.poppins(
                fontSize: size.width * 0.033,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            SizedBox(
              child: widget.model.isAvailable
                  ? Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color(0xff03B680),
                          radius: 4,
                        ),
                        SizedBox(
                          width: size.width * 0.020,
                        ),
                        Text(
                          "Available",
                          style: GoogleFonts.poppins(
                            color: const Color(0xff03B680),
                            fontSize: size.width * 0.033,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.redAccent,
                          radius: 4,
                        ),
                        SizedBox(
                          width: size.width * 0.020,
                        ),
                        Text(
                          "Out of Stock",
                          style: GoogleFonts.poppins(
                            color: Colors.redAccent,
                            fontSize: size.width * 0.031,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
            ),
            SizedBox(
              width: size.width * 0.020,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ ${widget.model.price}",
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: size.width * 0.040,
                  ),
                ),
                widget.model.isAvailable
                    ? GestureDetector(
                        onTap: () {
                          context.read<CartProvider>().addToCart(widget.model);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.green,
                              content: Text(
                                "Item added!",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 13,
                          child: Icon(
                            CupertinoIcons.cart_fill_badge_plus,
                            size: size.width * 0.065,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
