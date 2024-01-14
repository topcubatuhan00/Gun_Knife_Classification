`en`
# About the Project
## Objective

The main objective of the project is to detect firearms in images. For this purpose, a deep learning model is created using the ResNet50 architecture.
## Part 1: Data Set and Feature Extraction

At the beginning of the project, feature extraction was performed using images from the dataset. Extracted features were accumulated in a matrix named "X," and label values were generated based on file names. The obtained labels were stored in a matrix called "y." This process was repeated for each file in the dataset. As a result, the extracted features were selected as the best 1000 features using the fscchi2 algorithm. The selected 1000 features were combined with the label matrix, marking which features corresponded to which labels.
## Part 2: SVM Model Creation and Accuracy Detection

In the second stage, an SVM (Support Vector Machine) model was created using the feature and label matrices. The aim was to determine the accuracy of the model from the terminal. Variables were defined to store the position of test images and the number of incorrectly predicted results after the SVM model.

Features were extracted individually from the images, and these features were input to the predict function to obtain the output of the corresponding label. After the model made predictions about the images, a comparison was made with the actual labels. If the model couldn't predict correctly, the incorrect result variable was incremented by 1. After the process, the accuracy rate was output by subtracting the number of incorrect predictions from the total number of test images and dividing by the total number of test images.
## Dataset Nomenclature

The dataset was divided into two groups. The first dataset was used for training and contained a total of 4000 images. This set consisted of 2000 firearm images and 2000 knife images. Feature extraction and model training were performed using the training dataset. The other dataset was used as the test dataset and contained 400 images. This set consisted of 200 knife images and 200 firearm images.

In the training dataset, firearm images were named "S," and knife images were named "B." In the test dataset, images with knives were named "BT," and images with firearms were named "ST." The "T" expression indicates the test set.

`tr`
# Proje Hakkında 
## Amaç

Projenin temel amacı, görselde bulunan ateşli silahları tespit etmektir. Bu amaç doğrultusunda ResNet50 mimarisi kullanılarak bir derin öğrenme modeli oluşturulmuştur. 

## İlk Bölüm: Veri Seti ve Özellik Çıkarımı

Proje başlangıcında, veri setinde bulunan görseller kullanılarak özellik çıkarımı gerçekleştirildi. Çıkarılan özellikler "X" adındaki matris içerisinde toplandı ve dosya adlarından yola çıkılarak etiket değerleri üretildi. Elde edilen etiketler "y" adındaki matris içerisinde saklandı. Bu işlem, veri setindeki her dosya için tekrarlandı. Sonuç olarak, elde edilen özellikler, fscchi2 algoritması kullanılarak en iyi 1000 özellik olarak seçildi. Bu seçilen 1000 özellik matrisinin son sütununa etiket matrisi eklenerek hangi özelliklerin hangi etikete sahip olduğu işaretlendi.

# İkinci Bölüm: SVM Modeli Oluşturma ve Doğruluk Tespiti

İkinci aşamada, özellik ve etiket matrisi kullanılarak SVM (Destek Vektör Makinesi) modeli oluşturuldu. Bu modelin terminalden doğruluk oranının tespiti hedeflenmiştir. Tanımlamalar arasında SVM modelinden sonra test görsellerinin konumu ve yanlış bildiği sonuçların sayısını tutacağı değişken bulunmaktadır.

Görsellerden tek tek özellikler çıkarıldı. Bu özellikler predict fonksiyonuna verilerek hangi etikete ait olduğunun çıktısı elde edildi. Bu gelen çıktıya göre model görsel hakkındaki tahminini söyledikten sonra gerçek etiketi ile kıyaslama yapıldı. Eğer doğru bilemediyse yanlış sonuç değişkeni 1 arttırıldı. İşlem bittikten sonra toplam test görseli sayısından yanlış bildiği sayı çıkarılıp toplam test görseli sayısına bölünerek doğruluk oranı çıktı olarak verildi. Veri Seti

# Veri Seti İsimlendirmesi

Veri seti 2 grupta ayrıldı. İlk veri seti eğitim olarak kullanıldı ve toplam 4000 adet görsel içerdi. Bu görsellerden 2000 adedi silah, 2000 adedi bıçak içermekteydi. Eğitim veri seti kullanılarak özellik çıkarımı ve model eğitimi gerçekleştirildi. Diğer veri seti test veri seti olarak kullanıldı ve 400 adet görsel içeriyordu. Bu görsellerden 200 tanesi bıçak, 200 tanesi silah içermekteydi.

Eğitim veri setinde bulunan silah görsellerinin ana adı "S" olarak adlandırıldı, bıçak görselleri ise "B" olarak adlandırıldı. Test veri setinde bulunan görsellerde ise bıçak bulunan görseller "BT", silah bulunan görseller ise "ST" olarak adlandırıldı. "T" ifadesi test anlamına gelmektedir.
