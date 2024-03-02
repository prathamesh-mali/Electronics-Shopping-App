import 'package:elec_ecom_app/Screens/cart_screen.dart';
import 'package:elec_ecom_app/widget/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:elec_ecom_app/Data/app_data.dart';
import 'package:elec_ecom_app/Models/product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    required this.product,
    super.key,
    required this.index,
  });

  final int index;
  final Product product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

Widget ratingBar(Product product) {
  return Wrap(
    spacing: 30,
    children: [
      RatingBar.builder(
          itemSize: 28,
          initialRating: product.rating,
          itemBuilder: (_, __) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
          onRatingUpdate: (_) {})
    ],
  );
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppData>(builder: (context, value, child) {
        return Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFE5E6E8),
              ),
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(top: 50),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.42,
              decoration: const BoxDecoration(
                color: Color(0xFFE5E6E8),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(200),
                  bottomLeft: Radius.circular(200),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5),
                        child: Text(
                          softWrap: true,
                          value.getProducts()[widget.index].name,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                  fontSize: 23, fontWeight: FontWeight.w600),
                        ),
                      ),
                      ratingBar(widget.product),
                      const SizedBox(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CarouselSlider(items: widget.product.images),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "About",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                value.getProducts()[widget.index].about,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Offer Price: ${value.getProducts()[widget.index].off.toString()}",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          value.decreaseQuantity(widget.product, widget.index);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            FontAwesomeIcons.minus,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 214, 214, 214),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          value.getProducts()[widget.index].quantity.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          value.increaseQuantity(widget.product, widget.index);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.deepOrange,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Price: ₹ ${value.getProducts()[widget.index].price.toString()}",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    value.addToCart(widget.product);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    alignment: Alignment.center,
                    height: 55,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.deepOrange,
                    ),
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.5,
                          color: Colors.deepOrangeAccent,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        );
      }),
    );
  }
}
