import 'package:flutter/material.dart';

class M3TonDonusumu extends StatefulWidget {
  @override
  _M3TonDonusumuState createState() => _M3TonDonusumuState();
}

class _M3TonDonusumuState extends State<M3TonDonusumu> {
  String selectedToprak1 = 'Ham Toprak (1,1-1,3)';
  double m3Degeri1 = 0.0;
  double minTonDegeri1 = 0.0;
  double maxTonDegeri1 = 0.0;
  String selectedToprak2 = 'Ham Toprak (1,1-1,3)';
  double tonDegeri2 = 0.0;
  double minM3Degeri2 = 0.0;
  double maxM3Degeri2 = 0.0;

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
      minTonDegeri1 = m3Degeri1 * minYogunluk;
      maxTonDegeri1 = m3Degeri1 * maxYogunluk;
    });
  }



  void hesaplaM32() {
    double? yogunluk = toprakYogunluklari[selectedToprak2] as double?;
    setState(() {
      minM3Degeri2 = tonDegeri2 / yogunluk!;
      maxM3Degeri2 = tonDegeri2 / yogunluk!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('M³ - Ton Dönüşümü'),
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
                'Bu sayfa,  seçilen ürün çeşidine göre m3-ton dönüşümünü yoğunluk aralıklarına göre hesaplamak için kullanılır. Lütfen aşağıdaki bilgileri girin:',
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
                    m3Degeri1 = double.tryParse(value) ?? 0.0;
                  });
                },
                decoration: InputDecoration(labelText: 'M³ Değeri '),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: hesaplaTon1,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  minimumSize: Size(200, 60),
                  primary: Colors.green,
                ),
                child: Text(
                  'Ton Hesapla ',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Min Ton Değeri : $minTonDegeri1',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Max Ton Değeri : $maxTonDegeri1',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Divider(
                color: Colors.green,
                thickness: 3,
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedToprak2,
                onChanged: (newValue) {
                  setState(() {
                    selectedToprak2 = newValue!;
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
                    tonDegeri2 = double.tryParse(value) ?? 0.0;
                  });
                },
                decoration: InputDecoration(labelText: 'Ton Değeri '),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: hesaplaM32,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  minimumSize: Size(200, 60),
                  primary: Colors.green,
                ),
                child: Text(
                  'M³ Hesapla ',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Min M³ Değeri : $minM3Degeri2',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Max M³ Değeri : $maxM3Degeri2',
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
