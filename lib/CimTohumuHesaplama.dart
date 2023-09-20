import 'package:flutter/material.dart';

class CimTohumuHesaplama extends StatefulWidget {
  @override
  _CimTohumuHesaplamaState createState() => _CimTohumuHesaplamaState();
}

class _CimTohumuHesaplamaState extends State<CimTohumuHesaplama> {
  double kenar1 = 0.0;
  double kenar2 = 0.0;
  double alan = 0.0;
  double tohumMiktarGram = 0.0;
  double tohumMiktarKg = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Çim Tohumu Hesaplama'),
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
                'Bu sayfa, sizlerin uygulama yapacağı alan için gerekli olan çim tohumu miktarını hesaplamak için kullanılır. Lütfen aşağıdaki bilgileri girin:',
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    alan = kenar1 * kenar2;
                    tohumMiktarGram = alan * 60; // 1 m² için 60 gram tohum miktarı
                    tohumMiktarKg = tohumMiktarGram / 1000; // Gramdan kilograma dönüşüm
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  minimumSize: Size(200, 60),
                  primary: Colors.green,
                ),
                child: Text(
                  'Hesapla',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Alan: $alan m²',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Çim Tohumu Miktarı (kilogram): $tohumMiktarKg',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Çim Tohumu Miktarı (gram): $tohumMiktarGram',
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
