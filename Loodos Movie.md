# Loodos Movie

Proje 3 sayfadan oluşmaktadır.

- Splash
- Ana Sayfa
- Detay Sayfası

## Proje Mimarisi
Projeyi yaparken VIPER mimarisi kullandım.
## Proje İçeriği
## _Splash_
- Kullanıcının internete bağlı olup olmadığı control edilir. Eğer bağlı değil ise uyarı alır.
- İnternete bağlı olan kullanıcıyı Adobe After Effects ile oluşturduğum animasyon ekranı karşılar. Buradaki animasyon Json olarak Firebase'den gelmektedir.
- Kullanıcı animasyona tıkladıktan 3 saniye sonra uygulamanın ana sayfasına yönlendirilmektedir.

## _Ana Sayfa_
- Ana sayfada bulunan SearchBar ile kullanıcı film/dizi araması yapabilmektedir.
- Arama sonuçlarında karşılaşılan hatalar TableView'de gösterilmektedir.
- Eğer arama sonuçlarında film/dizi varsa TableView'i en aşağıya kaydırarak servisten diğer sayfalardaki film/dizi sonuçlarını görebilmektedir.

## _Detay Sayfası_
- Detay sayfasında Firebase Analystic kullanılarak detayı gösterilen film/dizi loglanmaktadır.
