import 'package:flutter/material.dart';

class M3Hesaplama extends StatefulWidget {
  @override
  _M3HesaplamaState createState() => _M3HesaplamaState();
}

class _M3HesaplamaState extends State<M3Hesaplama> {
  double kenar1 = 0.0;
  double kenar2 = 0.0;
  double yukseklikCm = 0.0;
  double hacim = 0.0;
  double cuvalLitre = 0.0;
  double cuvalSayisi = 0.0;
  String selectedToprak1 = 'Ham Toprak (1,1-1,3)';
  double minTonDegeri1 = 0.0;
  double maxTonDegeri1 = 0.0;


  Map<String, List<double>> toprakYogunluklari = {
    'Ham Toprak (1,1-1,3)': [1.1, 1.3],
    'Karışım Toprak (0,9-1,2)': [0.9, 1.2],
    'Gübreli Toprak (1-1,2)': [1.0, 1.2],
    'Yerli Torf (0,5-0,6)': [0.5, 0.6],
    'İthal Torf (0,15-0,2)': [0.15, 0.2],
    'Gübre (0,6-0,9)': [0.6, 0.9],
    'Curuf (0,7-0,8)': [0.7, 0.8],
    'Pomza (0,55-0,65)': [0.55, 0.65],
  };

  void hesaplaTon1() {
    List<double>? yogunluk = toprakYogunluklari[selectedToprak1];
    double minYogunluk = yogunluk![0];
    double maxYogunluk = yogunluk[1];
    setState(() {
      minTonDegeri1 = hacim * minYogunluk;
      maxTonDegeri1 = hacim * maxYogunluk;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hacim (M³) Hesaplama Aracı'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white, // Arka plan rengini burada değiştirin
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Text(
                'Bu sayfa, sizlerin uygulama yapacağı alan için gerekli olan toprak vb. diğer ürünlerin miktarını ve kaç çuval edeceğini hesaplamak için kullanılır. Lütfen aşağıdaki bilgileri girin:',
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedToprak1,
                onChanged: (newValue) {
                  setState(() {
                    selectedToprak1 = newValue!;
                  });
                },
                items: toprakYogunluklari.keys
                    .map<DropdownMenuItem<String>>((String toprak) {
                  return DropdownMenuItem<String>(
                    value: toprak,
                    child: Text(toprak),
                  );
                }).toList(),
              ),
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
                    hesaplaTon1();
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
              Text(
                'Ton Değeri : $minTonDegeri1 - $maxTonDegeri1',
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
                decoration: InputDecoration(labelText: 'Çuvalın Litre Değeri (Önerilen 40LT)'),
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
