import 'package:flutter/material.dart';

class AgacKabuguHesaplama extends StatefulWidget {
  @override
  _AgacKabuguHesaplamaState createState() => _AgacKabuguHesaplamaState();
}

class _AgacKabuguHesaplamaState extends State<AgacKabuguHesaplama> {
  double kenar1 = 0.0;
  double kenar2 = 0.0;
  double yukseklikCm = 0.0;
  double hacim = 0.0;
  double cuvalLitre = 0.0;
  double cuvalSayisi = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ağaç Kabuğu Hesaplama'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Text(
                'Bu sayfa, sizlerin uygulama yapacağı alan için gerekli olan ağaç kabuğu hacmini hesaplamak ve çuval sayısını bulmak için kullanılır. Lütfen aşağıdaki bilgileri girin:',
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
                decoration: InputDecoration(labelText: 'Yükseklik (Önerilen 5 cm)'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    double yukseklikMetre = yukseklikCm / 100.0;
                    hacim = kenar1 * kenar2 * yukseklikMetre;
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  minimumSize: Size(200, 60),
                  primary: Colors.green,
                ),
                child: Text(
                  'Hacim Hesapla',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Hacim: $hacim m³',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    cuvalLitre = double.tryParse(value) ?? 0.0;
                  });
                },
                decoration: InputDecoration(labelText: 'Çuvalın Litre Değeri (Önerilen 60LT)'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    cuvalSayisi = hacim * 1000 / cuvalLitre;
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
