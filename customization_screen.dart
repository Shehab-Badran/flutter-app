import 'package:flutter/material.dart';
import 'order_details_screen.dart';
import 'app_color.dart';



class CustomizeBurgerScreen extends StatefulWidget {
  @override
  _CustomizeBurgerScreenState createState() => _CustomizeBurgerScreenState();
}

class _CustomizeBurgerScreenState extends State<CustomizeBurgerScreen> {
  int portion = 1;
  double spiceLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/sandwich.png',
                height: 200,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Customize Your Burger",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Customize your burger to your tastes. Ultimate Experience",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Spicy",
                  style: TextStyle(fontSize: 16),
                ),
                Expanded(
                  child: Slider(
                    value: spiceLevel,
                    activeColor: AppColor.primaryColor,
                    inactiveColor: Colors.grey,
                    onChanged: (value) {
                      setState(() {
                        spiceLevel = value;
                      });
                    },
                    min: 0,
                    max: 2,
                    divisions: 1,
                    label: spiceLevel == 0
                        ? "Mild"
                        : spiceLevel == 1
                            ? "Hot"
                            : spiceLevel.toString(),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Portion", style: TextStyle(fontSize: 16)),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (portion > 1) portion--;
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text(
                      portion.toString(),
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          portion++;
                        });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Toppings",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            _buildOptionsRow([
              'Tomato',
              'Onions',
              'Pickles',
              'Bacon',
            ], [
              'assets/images/tomato.png',
              'assets/images/onion.png',
              'assets/images/pickles.png',
              'assets/images/bacon.png',
            ]),
            SizedBox(height: 16),
            Text(
              "Side Options",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            _buildOptionsRow([
              'Fries',
              'Coleslaw',
              'Salad',
              'Onion Rings',
            ], [
              'assets/images/fries.png',
              'assets/images/coleslow.png',
              'assets/images/latus.png',
              'assets/images/onion rings.png',
            ]),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${(16.49 * portion).toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) {
                          return OrderDetailsScreen();
                        },
                      ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "ORDER NOW",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white,),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionsRow(List<String> names, List<String> imagePaths) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          names.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      imagePaths[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Text(names[index]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
