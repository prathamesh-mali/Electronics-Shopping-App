import 'package:flutter/material.dart';
import 'package:elec_ecom_app/Models/product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Models/product_category.dart';

class AppData extends ChangeNotifier {
  static String dummyText =
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      ' industry. Lorem Ipsum has been the industry\'s standard dummy text'
      ' ever since the 1500s, when an unknown printer took a galley of type'
      ' and scrambled it to make a type specimen book.';

  static List<Product> products = [
    Product(
      name: 'Samsung A53 5G',
      price: 33000,
      about: dummyText,
      isAvailable: true,
      off: 30000,
      quantity: 1,
      images: [
        'assets/images/a53_1.png',
        'assets/images/a53_2.png',
        'assets/images/a53_3.png',
      ],
      isFavorite: false,
      rating: 4,
      type: ProductType.mobile,
    ),
    Product(
      name: "Samsung S24 Ultra",
      price: 150000,
      about: dummyText,
      isAvailable: true,
      off: 145000,
      quantity: 1,
      images: [
        'assets/images/s24_ultra_blackMain.png',
        'assets/images/s24_Ultra_black.png',
      ],
      isFavorite: false,
      rating: 5,
      type: ProductType.mobile,
    ),
    Product(
      name: "Samsung A54 5G",
      price: 38000,
      about: dummyText,
      isAvailable: true,
      off: 37500,
      quantity: 1,
      images: [
        'assets/images/a54_purple.png',
        'assets/images/54_black.png',
      ],
      isFavorite: false,
      rating: 4,
      type: ProductType.mobile,
    ),
    Product(
      name: "Sony X80",
      price: 16000,
      about: dummyText,
      isAvailable: false,
      off: 15999,
      quantity: 1,
      images: [
        'assets/images/sony_x_80_j_1.png',
        'assets/images/sony_x_80_j_2.png'
      ],
      isFavorite: false,
      rating: 3.5,
      type: ProductType.tv,
    ),
    Product(
      name: "Samsung Tab 7",
      price: 20000,
      about: dummyText,
      isAvailable: true,
      off: 15000,
      quantity: 1,
      images: [
        'assets/images/tab_s7_fe_1.png',
        'assets/images/tab_s7_fe_2.png'
      ],
      isFavorite: false,
      rating: 3.5,
      type: ProductType.tablet,
    ),
    Product(
      name: "Samsung Galaxy watch",
      price: 9000,
      about: dummyText,
      isAvailable: true,
      off: 8950,
      quantity: 1,
      images: [
        'assets/images/galaxy_watch_4_1.png',
        'assets/images/galaxy_watch_4_2.png'
      ],
      isFavorite: false,
      rating: 4,
      type: ProductType.watch,
    ),
    Product(
      name: 'Apple watch series 7',
      price: 44900,
      about: dummyText,
      isAvailable: false,
      off: 44800,
      quantity: 1,
      images: [
        'assets/images/apple_watch_series_7_1.png',
        'assets/images/apple_watch_series_7_2.png',
        'assets/images/apple_watch_series_7_3.png',
      ],
      isFavorite: false,
      rating: 3,
      type: ProductType.watch,
    ),
    Product(
      name: 'Beats Studio 3',
      price: 27900,
      about: dummyText,
      isAvailable: true,
      off: 26000,
      quantity: 1,
      images: [
        'assets/images/beats_studio_3-1.png',
        'assets/images/beats_studio_3-2.png',
        'assets/images/beats_studio_3-3.png',
        'assets/images/beats_studio_3-4.png',
      ],
      isFavorite: false,
      rating: 4.5,
      type: ProductType.headphone,
    ),
    Product(
      name: "Samsung Q 60 TV",
      price: 85000,
      about: dummyText,
      isAvailable: false,
      off: 84500,
      quantity: 1,
      images: [
        'assets/images/samsung_q_60_a_1.png',
        'assets/images/samsung_q_60_a_2.png',
      ],
      isFavorite: false,
      rating: 3,
      type: ProductType.tv,
    ),
    Product(
        name: "Samsung Tab S8",
        price: 30000,
        about: dummyText,
        isAvailable: false,
        off: 29800,
        quantity: 1,
        images: [
          'assets/images/tab_s8_1.png',
          'assets/images/tab_s8_2.png',
        ],
        isFavorite: false,
        rating: 4,
        type: ProductType.tablet)
  ];

  static List<ProductCategory> categories = [
    ProductCategory(
      ProductType.all,
      true,
      Icons.all_inclusive,
    ),
    ProductCategory(
      ProductType.mobile,
      false,
      FontAwesomeIcons.mobileScreenButton,
    ),
    ProductCategory(ProductType.watch, false, Icons.watch),
    ProductCategory(
      ProductType.tablet,
      false,
      FontAwesomeIcons.tablet,
    ),
    ProductCategory(
      ProductType.headphone,
      false,
      Icons.headphones,
    ),
    ProductCategory(
      ProductType.tv,
      false,
      Icons.tv,
    ),
  ];

  List<Product> Cart = [];
  List<Product> allProducts = AppData.products;
  List<Product> favoriteProducts = [];
  List<Product> filteredProducts = [];

  List<Product> geCart() {
    return Cart;
  }

  List<Product> getProducts() {
    return products;
  }

  List<ProductCategory> getCategory() {
    return AppData.categories;
  }

  List<Product> filterFavoriteProducts(List<Product> filteredProducts) {
    return filteredProducts.where((product) => product.isFavorite).toList();
  }

  void initializeFavoriteProducts(List<Product> filteredProducts) {
    favoriteProducts = filterFavoriteProducts(filteredProducts);
  }

  addToFavorite(int index) {
    filteredProducts[index].isFavorite = !filteredProducts[index].isFavorite;
    notifyListeners();
  }

  increaseQuantity(Product product, int index) {
    products[index].quantity = products[index].quantity + 1;

    notifyListeners();
  }

  decreaseQuantity(Product product, int index) {
    products[index].quantity = products[index].quantity - 1;

    notifyListeners();
  }

  List<Product> getfilteredProducts() {
    return filteredProducts;
  }

  void addToCart(Product product) {
    int existingIndex = Cart.indexOf(product);

    if (existingIndex != -1) {
      Cart[existingIndex].quantity = product.quantity;
      Cart[existingIndex].off = Cart[existingIndex].off + product.off;
      Cart[existingIndex].price = Cart[existingIndex].price + product.price;
    } else {
      Cart.add(product);
    }
    notifyListeners();
  }

  removeFromCart(index) {
    Cart.remove(index);
    notifyListeners();
  }

  double calculateTotalPrice(List<Product> cart) {
    double totalPrice = 0.0;
    for (Product product in cart) {
      totalPrice += product.off * product.quantity;
    }
    return totalPrice;
  }

  void filterItemsByCategory(int index) {
    for (ProductCategory element in categories) {
      element.isSelected = false;
    }
    categories[index].isSelected = true;

    if (categories[index].type == ProductType.all) {
      // If "all" category is selected, include all products
      filteredProducts.clear(); // Clear previous filtered products
      filteredProducts
          .addAll(allProducts); // Copy all products to filtered products
    } else {
      // Filter products based on the selected category
      filteredProducts.clear(); // Clear previous filtered products
      for (int i = 0; i < allProducts.length; i++) {
        if (allProducts[i].type == categories[index].type) {
          filteredProducts.add(allProducts[i]);
        }
      }
    }

    if (categories[index].type != ProductType.all) {
      List<Product> favoriteProducts =
          allProducts.where((item) => item.isFavorite).toList();
      for (int i = 0; i < favoriteProducts.length; i++) {
        if (filteredProducts.contains(favoriteProducts[i])) {
          filteredProducts.remove(favoriteProducts[i]);
        }
      }
    }
    notifyListeners();
  }
}
