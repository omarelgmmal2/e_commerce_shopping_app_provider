import 'package:e_commerce_shopping_app_provider/provider/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    final List<ProductModel> allProducts = [
      ...productProvider.shirts,
      ...productProvider.pants,
      ...productProvider.shoes,
    ];

    final List<ProductModel> favouriteProducts =
        allProducts.where((element) => element.isFavorite).toList();

    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                //SizedBox(height: size.height * 0.045,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Favourites Products",
                    style: GoogleFonts.poppins(
                      fontSize: size.width * 0.050,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                SizedBox(
                  width: size.width,
                  child: TextFormField(
                    decoration: InputDecoration(
                      focusColor: Colors.black38,
                      isCollapsed: false,
                      hintText: "Search products",
                      prefixIcon: const Icon(Icons.search),
                      helperStyle: GoogleFonts.poppins(
                        fontSize: size.width * 0.040,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.01,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Colors.black26,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Colors.black26,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.030,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: favouriteProducts.length,
                  itemBuilder: (context, index) {
                    final product = favouriteProducts[index];
                    return Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white60,
                            spreadRadius: 0.5,
                            offset: Offset(5,5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            product.image,
                            fit: BoxFit.contain,
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(
                            height: size.height * 0.020,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              product.name,
                              style: GoogleFonts.poppins(
                                fontSize: size.width * 0.033,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "\$ ${product.price}",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: size.width * 0.040,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    productProvider.toggleFavorite(product);
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
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
    );
  }
}
