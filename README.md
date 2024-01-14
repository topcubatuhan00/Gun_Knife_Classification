#Proje Açıklaması
##Amaç

Projenin temel amacı, görselde bulunan ateşli silahları tespit etmektir. Bu amaç doğrultusunda ResNet50 mimarisi kullanılarak bir derin öğrenme modeli oluşturulmuştur.
İlk Bölüm: Veri Seti ve Özellik Çıkarımı

Proje başlangıcında, veri setinde bulunan görseller kullanılarak özellik çıkarımı gerçekleştirildi. Çıkarılan özellikler "X" adındaki matris içerisinde toplandı ve dosya adlarından yola çıkılarak etiket değerleri üretildi. Elde edilen etiketler "y" adındaki matris içerisinde saklandı. Bu işlem, veri setindeki her dosya için tekrarlandı. Sonuç olarak, elde edilen özellikler, fscchi2 algoritması kullanılarak en iyi 1000 özellik olarak seçildi. Bu seçilen 1000 özellik matrisinin son sütununa etiket matrisi eklenerek hangi özelliklerin hangi etikete sahip olduğu işaretlendi.

#İkinci Bölüm: SVM Modeli Oluşturma ve Doğruluk Tespiti

İkinci aşamada, özellik ve etiket matrisi kullanılarak SVM (Destek Vektör Makinesi) modeli oluşturuldu. Bu modelin terminalden doğruluk oranının tespiti hedeflenmiştir. Tanımlamalar arasında SVM modelinden sonra test görsellerinin konumu ve yanlış bildiği sonuçların sayısını tutacağı değişken bulunmaktadır.

Görsellerden tek tek özellikler çıkarıldı. Bu özellikler predict fonksiyonuna verilerek hangi etikete ait olduğunun çıktısı elde edildi. Bu gelen çıktıya göre model görsel hakkındaki tahminini söyledikten sonra gerçek etiketi ile kıyaslama yapıldı. Eğer doğru bilemediyse yanlış sonuç değişkeni 1 arttırıldı. İşlem bittikten sonra toplam test görseli sayısından yanlış bildiği sayı çıkarılıp toplam test görseli sayısına bölünerek doğruluk oranı çıktı olarak verildi.
Veri Seti

Veri seti 2 grupta ayrıldı. İlk veri seti eğitim olarak kullanıldı ve toplam 4000 adet görsel içerdi. Bu görsellerden 2000 adedi silah, 2000 adedi bıçak içermekteydi. Eğitim veri seti kullanılarak özellik çıkarımı ve model eğitimi gerçekleştirildi. Diğer veri seti test veri seti olarak kullanıldı ve 400 adet görsel içeriyordu. Bu görsellerden 200 tanesi bıçak, 200 tanesi silah içermekteydi.

Eğitim veri setinde bulunan silah görsellerinin ana adı "S" olarak adlandırıldı, bıçak görselleri ise "B" olarak adlandırıldı. Test veri setinde bulunan görsellerde ise bıçak bulunan görseller "BT", silah bulunan görseller ise "ST" olarak adlandırıldı. "T" ifadesi test anlamına gelmektedir.
