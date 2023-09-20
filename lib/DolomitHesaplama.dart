import 'package:flutter/material.dart';

class DolomitHesaplama extends StatefulWidget {
  @override
  _DolomitHesaplamaState createState() => _DolomitHesaplamaState();
}

class _DolomitHesaplamaState extends State<DolomitHesaplama> {
  double kenar1 = 0.0;
  double kenar2 = 0.0;
  double yukseklikCm = 0.0;
  double hacim = 0.0;
  double dolomitYogunluk = 1.3;
  double tonMiktari = 0.0;
  double kgMiktari = 0.0;
  double cuvalKg = 0.0;
  double cuvalSayisi = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dolomit Hesaplama'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Bu sayfa, sizlerin uygulama yapacağı alan için gerekli olan dolomit taşı mıktarını hesaplamak için kullanılır. Lütfen aşağıdaki bilgileri girin:',
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    kenar1 = double.tryParse(value) ?? 0.0;
                  });
                },
                decoration: InputDecoration(labelText: '1. Kenar Uzunluğu (m)'),
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    kenar2 = double.tryParse(value) ?? 0.0;
                  });
                },
                decoration: InputDecoration(labelText: '2. Kenar Uzunluğu (m)'),
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    yukseklikCm = double.tryParse(value) ?? 0.0;
                  });
                },
                decoration: InputDecoration(labelText: 'Yükseklik (cm)'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    double yukseklikMetre = yukseklikCm / 100.0;
                    hacim = kenar1 * kenar2 * yukseklikMetre;
                    tonMiktari = hacim * dolomitYogunluk;
                    kgMiktari = tonMiktari * 1000;
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  minimumSize: Size(200, 60),
                  primary: Colors.green,
                ),
                child: Text(
                  'Hacim ve Kg Hesapla',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Hacim: $hacim m³',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Ton Miktarı: $tonMiktari',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'KG Miktarı: $kgMiktari',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    cuvalKg = double.tryParse(value) ?? 0.0;
                  });
                },
                decoration: InputDecoration(labelText: 'Çuvalın KG Değeri (Önerilen 25KG)'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    cuvalSayisi = kgMiktari / cuvalKg;
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  minimumSize: Size(200, 60),
                  primary: Colors.green,
                ),
                child: Text(
                  'Çuval Sayısı Hesapla',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Çuval Sayısı: ${cuvalSayisi.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
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
