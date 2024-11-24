import 'package:coffeeappui/util/coffee_names.dart';
import 'package:coffeeappui/util/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //coffee TypeLIst
  final List coffeeTypes = [
    //[coffee Type, isSelected]
    ["Cappucino", true],
    ["Latte", false],
    ["Black", false],
    ["Tea", false],
  ];
  // user coffeeTypeSelected
  void coffeeTypeSelected(int index) {
    setState(() {
      //loop makes everything false
      for (int i = 0; i < coffeeTypes.length; i++) {
        coffeeTypes[i][1] = false;
      }
      coffeeTypes[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      //Appbar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "",
          ),
        ],
      ),
      body: Column(
        children: [
          // find Best coffee
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best coffee for You",
              style: GoogleFonts.lato(
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Find your coffee...",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //horizonal ListView of coffee Types
          SizedBox(
            height: 50,
            child: ListView.builder(
                // shrinkWrap: true,
                // physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: coffeeTypes.length,
                itemBuilder: (context, index) {
                  return CoffeeNames(
                      coffeeType: coffeeTypes[index][0],
                      isSelected: coffeeTypes[index][1],
                      onTap: () {
                        coffeeTypeSelected(index);
                      });
                }),
          ),
          //Horizontal ListView of coffee tiles
          const Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CoffeeTile(
                    cofeeName: "Latte",
                    coffeeImagePath: "lib/images/latte.jpg",
                    coffeePrice: "4.00",
                    subText: "With Almond Milk",
                  ),
                  CoffeeTile(
                    cofeeName: "Milk",
                    coffeeImagePath: "lib/images/milk.jpg",
                    coffeePrice: "4.20",
                    subText: "With Toned Milk",
                  ),
                  CoffeeTile(
                    cofeeName: "Cappucino",
                    coffeeImagePath: "lib/images/nathan.jpg",
                    coffeePrice: "4.70",
                    subText: "With Double Toned Milk",
                  ),
                  CoffeeTile(
                    cofeeName: "Tea",
                    coffeeImagePath: "lib/images/tea.jpg",
                    coffeePrice: "1.69",
                    subText: "With Full Cream Milk",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
