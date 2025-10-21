import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavView extends StatefulWidget {
  const BottomNavView({super.key});

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  int currentIndex = 0;

  final List<Widget> pages = [
    Center(child: Text('Home')),
    Center(child: Text('Search')),
    Center(child: Text('Reels')),
    Center(child: Text('Favourite')),

    Center(child: Text('Profile')),
  ];

  Color getSelectedColor(int index) =>
      currentIndex == index ? Colors.black : Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        backgroundColor: Colors.black,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          // Open Add Post screen (placeholder)
          setState(() {
            // Optionally navigate to a separate add-post page.
            // Here we keep the current index unchanged and show a simple dialog.
          });
          showModalBottomSheet(
            context: context,
            builder: (_) => SizedBox(
              height: 200,
              child: Center(child: Text('Create a new post')),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
        elevation: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Left side: Home, Search
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.home_outlined, color: getSelectedColor(0)),
                    onPressed: () => setState(() => currentIndex = 0),
                    splashRadius: 24,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search_outlined,
                      color: getSelectedColor(1),
                    ),
                    onPressed: () => setState(() => currentIndex = 1),
                    splashRadius: 24,
                  ),
                ],
              ),

              // Spacer for center FAB
              const SizedBox(width: 48),

              // Right side: Reels, Shop, Profile
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.favorite_outline,
                      color: getSelectedColor(3),
                    ),
                    onPressed: () => setState(() => currentIndex = 3),
                    splashRadius: 24,
                  ),

                  // Profile as circle avatar
                  GestureDetector(
                    onTap: () => setState(() => currentIndex = 4),
                    child: Container(
                      margin: const EdgeInsets.only(left: 8, right: 4),
                      padding: const EdgeInsets.all(1.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: currentIndex == 4
                              ? Colors.black
                              : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 13,
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.person_outline,
                          color: getSelectedColor(4),
                          size: 16,
                        ),
                      ),
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
