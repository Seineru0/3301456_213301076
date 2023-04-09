import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:you_you/tabs/favpage.dart';
import 'package:you_you/tabs/searchpage.dart';
import 'package:you_you/tabs/settpage.dart';
import 'package:you_you/tabs/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 int _selectedIndex = 0;
 final List<String> _titles = const [
    'Me and You',
    'Favoriler',
    'Arama',
    'Ayarlar',
 ];
final List<Widget> _tabs = const [
  HomeTab(),
  FavTab(),
  SearchTab(),
  SettingsTab(),
];
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Center(child: Text(_titles[_selectedIndex],style: GoogleFonts.roboto(fontWeight: FontWeight.w400),)),
        backgroundColor: Colors.black,
      ),
      body: _tabs[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          // Horizonal barımıza yanlardan boşluk veriken verical üst altan verir
          child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white70,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade900,
              gap: 10, // Yazılar ile icon arası boşluk vermek için.
              onTabChange: (index){ //sayfa değişimi için index alıyoruz
                setState(() {
                  _selectedIndex = index;
                });
              },
              padding: const EdgeInsets.all(20), //Yazı için boşluk
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: ' Anasayfa',
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: ' Beğenilen',
                ),
                GButton(
                  icon: Icons.search,
                  text: ' Ara',
                ),
                GButton(
                  icon: Icons.settings,
                  text: ' Ayarlar',
                ),
              ]),
        ),
      ),
    );
  }
}
