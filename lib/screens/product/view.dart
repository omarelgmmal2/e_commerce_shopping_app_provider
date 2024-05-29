import 'package:e_commerce_shopping_app_provider/models/product.dart';
import 'package:e_commerce_shopping_app_provider/provider/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../provider/cart.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel model;
  const ProductScreen({super.key, required this.model});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  Color selectedColor = Colors.redAccent;
  int selectedSize = 6;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  widget.model.isAvailable
                      ? GestureDetector(
                    onTap: () {
                      productProvider.toggleFavorite(widget.model);
                    },
                    child: Icon(
                      widget.model.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: size.width * 0.07,
                      color: widget.model.isFavorite
                          ? Colors.redAccent
                          : Colors.black,
                    ),
                  )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                      widget.model.image,
                    height: size.height / 3,
                  ),
                ),
                SizedBox(height: size.height * 0.020,),
                Text(
                    "NEW ARRIVIAL",
                  style: GoogleFonts.poppins(
                    fontSize: size.width * 0.04,
                    color: Colors.grey,
                  ),
                ),
                Text(
                    widget.model.name,
                  style: GoogleFonts.poppins(
                    fontSize: size.width * 0.07,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: size.height * 0.012,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width / 4,
                      height: size.height * 0.04,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Save 20%",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: size.height * 0.015,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star,size: 23,color: Colors.amber,),
                        Text(
                          "4.8",
                          style: GoogleFonts.poppins(
                            fontSize: size.width * 0.037,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          " (232) Reviews",
                          style: GoogleFonts.poppins(
                            color: Colors.black45,
                            fontSize: size.width * 0.037,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.015,),
                Text(
                  "Information",
                  style: GoogleFonts.poppins(
                    fontSize: size.height * 0.023,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: size.height * 0.01,),
                Text(
                  textAlign: TextAlign.justify,
                  widget.model.desc,
                  style: GoogleFonts.poppins(
                    fontSize: size.width * 0.037,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: size.height * 0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Color: ",
                      style: GoogleFonts.poppins(
                        fontSize: size.height * 0.023,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 30,
                          child: ListView.builder(
                            shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                Color color = widget.model.colors![index];
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedColor = color;
                                    });
                                  },
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    margin: const EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: color,
                                      border: Border.all(
                                        color: selectedColor == color ?
                                            Colors.black54 :
                                            Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            itemCount: widget.model.colors!.length,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Sizes: ",
                      style: GoogleFonts.poppins(
                        fontSize: size.height * 0.023,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 30,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              int size = widget.model.sizes![index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSize = size;
                                  });
                                },
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  margin: const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[100],
                                    border: Border.all(
                                      color: selectedSize == size ?
                                      Colors.black54 :
                                      Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(size.toString(),),
                                  ),
                                ),
                              );
                            },
                            itemCount: widget.model.sizes!.length,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: size.height * 0.08,
          margin: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                      "Price: ",
                    style: GoogleFonts.poppins(
                      color: Colors.black54,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01,),
                  Text(
                    "\$ ${widget.model.price}",
                    style: GoogleFonts.poppins(
                      fontSize: size.width * 0.055,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              widget.model.isAvailable ? SizedBox(
                width: size.width / 2,
                height: size.height * 0.06,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide.none,
                    ),
                  ),
                    onPressed: (){
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
                    child: Text(
                        "Add To Cart",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ),
              ) : Row(
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
            ],
          ),
        ),
      ),
    );
  }
}
