import 'package:flutter/material.dart';
import 'M3Hesaplama.dart'; // M3 Hesaplama sayfasının import edildiğini varsayalım
import 'CimTohumuHesaplama.dart';
import 'M3TonDonusumu.dart';
import 'DolomitHesaplama.dart';
import 'AgacKabuguHesaplama.dart';

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toprak Peyzaj'),
        centerTitle: true,
        backgroundColor: Colors.green, // Üst çubuk rengi
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                width: 390, // Genişliği ekrana yay
                height: 200, // Yükseklik ayarını istediğiniz gibi değiştirin
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'), // Logo resminin yolu
                    fit: BoxFit.cover, // Resmi ekran boyutuna otomatik ayarlar
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // İlk düğmeye tıklanınca M3 Hesaplama sayfasına gitmek için
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => M3Hesaplama()), // M3 Hesaplama sayfasına git
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        minimumSize: Size(200, 60),
                        primary: Colors.green, // Düğme rengi
                      ),
                      child: Text(
                        'M3 Hesaplama',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => M3TonDonusumu()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16),
                        minimumSize: Size(200, 60),
                        primary: Colors.green,
                      ),
                      child: Text(
                        'M3-Ton Dönüşümü',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CimTohumuHesaplama()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        minimumSize: Size(200, 60),
                        primary: Colors.green, // Düğme rengi
                      ),
                      child: Text(
                        'Çim Tohumu Hesaplama',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DolomitHesaplama()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        minimumSize: Size(200, 60),
                        primary: Colors.green, // Düğme rengi
                      ),
                      child: Text(
                        'Dolomit Hesaplama',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AgacKabuguHesaplama()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        minimumSize: Size(200, 60),
                        primary: Colors.green, // Düğme rengi
                      ),
                      child: Text(
                        'Ağaç Kabuğu Hesaplama',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green, // Şeffaf arka plan
        elevation: 100, // Gölgelendirme kaldırılır
        child: Container(
          height: 30.0,
          alignment: Alignment.center,
          child: Text(
            '© 2023 Toprak Yazılım - Tüm Hakları Saklıdır',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
