import 'package:flutter/material.dart';

import 'app_color.dart';
import 'bottom_appbar_menu.dart';
import 'floating_button.dart';
import 'item_details_screen.dart';

// FoodItem class to represent each food item
class FoodItem {
  final String name;
  final String description;
  final String image;
  final double rating;

  FoodItem({
    required this.name,
    required this.description,
    required this.image,
    required this.rating,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List of food items
  final List<FoodItem> foodItems = [
    FoodItem(
      name: 'Cheeseburger',
      description: "Wendy's Burger",
      image: 'assets/images/wendys burger.png',
      rating: 4.9,
    ),
    FoodItem(
      name: 'Veggie Burger',
      description: 'Healthy Choice',
      image: 'assets/images/veggie burger.png',
      rating: 4.8,
    ),
    FoodItem(
      name: 'Chicken Burger',
      description: 'Crispy Delight',
      image: 'assets/images/chicken burger.png',
      rating: 4.7,
    ),
    FoodItem(
      name: 'Fried Chicken Burger',
      description: 'Fried Chicken Special',
      image: 'assets/images/fried chicken burger.png',
      rating: 4.6,
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),
              _homeHeader(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              _searchSection(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              _categorySlider(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              _itemList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBarMenu(),
    );
  }

  Widget _homeHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Yum Yard',
          style: TextStyle(
            color: AppColor.homeTitleColor,
            fontSize: 45,
            fontFamily: 'Lobster',
          ),
        ),
        Container(
          width: 60,
          height: 60,
          decoration: ShapeDecoration(
            color: AppColor.homeHeaderShapeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            image: const DecorationImage(
              image: AssetImage("assets/images/image8.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }

  Widget _searchSection() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.03),
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: ShapeDecoration(
            color: AppColor.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Icon(Icons.tune, color: Colors.white),
        ),
      ],
    );
  }

  Widget _categorySlider() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: 75,
              decoration: ShapeDecoration(
                color: AppColor.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Center(
                child: FittedBox(
                  child: Text(
                    "Cat $index",
                    style: TextStyle(
                      color: AppColor.categoryItemTextColor,
                      fontSize: 16,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _itemList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: foodItems.length,
      itemBuilder: (context, index) {
        final item = foodItems[index];
        return Container(
          decoration: ShapeDecoration(
            color: AppColor.itemListShapeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: [
              BoxShadow(
                color: AppColor.itemListShadowColor,
                blurRadius: 17,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ItemDetailsScreen(),
                  ));
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.10 ,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(item.description),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber),
                        Text(item.rating.toString()),
                      ],
                    ),
                    const Icon(Icons.favorite_border),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
