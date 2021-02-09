import 'package:flutter/material.dart';

class MyBottomAppBar extends StatelessWidget {
  final PageController pageController;
  final int currentPageIndex;
  final Function onPressIcon;

  MyBottomAppBar({
    @required this.pageController,
    @required this.currentPageIndex,
    @required this.onPressIcon,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 5,
      shape: CircularNotchedRectangle(),
      notchMargin: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PopupMenuButton(
              onSelected: (something) {
                // TODO: ....
              },
              icon: Icon(Icons.menu),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.search),
                      title: Text('Search'),
                      contentPadding: EdgeInsets.only(right: 15),
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Log Out'),
                      contentPadding: EdgeInsets.only(right: 15),
                    ),
                  ),
                ];
              },
            ),
            IconButton(
              icon: Icon(
                currentPageIndex != 0 ? Icons.favorite_border : Icons.favorite,
                // color: currentPageIndex != 0 ? Colors.black87 : Colors.red,
              ),
              onPressed: () => onPressIcon(0),
            ),
            SizedBox(width: 100),
            IconButton(
              icon: Icon(
                currentPageIndex != 2
                    ? Icons.shopping_cart_outlined
                    : Icons.shopping_cart,
                // color: currentPageIndex != 2 ? Colors.black87 : Colors.red,
              ),
              onPressed: () => onPressIcon(2),
            ),
            IconButton(
              icon: Icon(
                currentPageIndex != 3
                    ? Icons.account_circle_outlined
                    : Icons.account_circle,
                // color: currentPageIndex != 3 ? Colors.black87 : Colors.red,
              ),
              onPressed: () => onPressIcon(3),
            ),
          ],
        ),
      ),
    );
  }
}
