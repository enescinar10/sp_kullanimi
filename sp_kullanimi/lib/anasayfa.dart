import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int sayac = 0;

  @override
  void initState() {
    super.initState();
    //test();
    sayacKontrol(); // sayfa ilk açıldığında 1 kere yapsın diiye init statew kullanıldı.
  }

  Future<void> sayacKontrol() async {
    var sp = await SharedPreferences.getInstance(); // erişim
    sayac = sp.getInt("sayac") ?? 0; // önce okuma yaptık
    setState(() {
      sayac = sayac + 1;
    });
    sp.setInt("sayac", sayac); // kayıt
}
  Future<void> test() async {
    // tanımlama
    var sp = await SharedPreferences.getInstance();

    // VERİ KAYDI
    sp.setString("ad", "Enes");
    sp.setInt("yas", 22);
    sp.setDouble("boy", 1.83);
    sp.setBool("bekar", true);

    var liste = <String>[];
    liste.add("Enes");
    liste.add("Serkan");
    liste.add("Defne");
    sp.setStringList("liste", liste);

    //Veri Silme
    //sp.remove("liste");

    //VERİ OKUMA
    String gelenAd = sp.getString("ad") ?? "isim yok"; // 2 soru işarete default vault varsayılan değerdir.
    int gelenYas = sp.getInt("yas") ?? 0;
    double gelenBoy = sp.getDouble("boy") ?? 0.0;
    bool gelenBekar = sp.getBool("bekar") ?? false;
    var gelenListe = sp.getStringList("liste") ?? <String>[];
    print("gelen ad : $gelenAd");
    print("gelen yas : $gelenYas");
    print("gelen boy : $gelenBoy");
    print("gelen bekar : $gelenBekar");

    if(gelenListe != null){
      for(var a in gelenListe){
        print("gelen liste : $a");
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preferences Kullanımı"),
      ),
      body:  Center(
        child: Text("Açılış Sayısı : $sayac ",style: const TextStyle(fontSize: 50),),
      ),
    );
  }
}


