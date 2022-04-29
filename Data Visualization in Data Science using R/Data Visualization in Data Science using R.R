
# Scatterplot 

## Load Library
```{r}
library(ggplot2) #ctrl+shift+enter
```

```{r}
library(tidyverse)
#> ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ──
#> ✔ ggplot2 3.3.2     ✔ purrr   0.3.4
#> ✔ tibble  3.0.3     ✔ dplyr   1.0.2
#> ✔ tidyr   1.1.2     ✔ stringr 1.4.0
#> ✔ readr   1.4.0     ✔ forcats 0.5.0
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
```

```{r}
install.packages("tidyverse")
library(tidyverse)
```

```{r}
?mpg
```
#displ, a car’s engine size, in litres.

hwy, a car’s fuel efficiency on the highway, in miles per gallon (mpg). A car with a low fuel efficiency consumes more fuel than a car with a high fuel efficiency when they travel the same distance.

To learn more about mpg, open its help page by running ?mpg.

```{r}
?mpg
#tanda tanya digunakan untuk mengetahui keterangan data pada data bawaan R
```

```{r}
?mpg
```


```{r}
ggplot(data = mpg) 
```
#argumen ukuran mesin dan hwy
```{r}
#fungsi kancas
ggplot(data = mpg)  + 
  geom_point(mapping = aes(x = displ, y = hwy))
```

#Plot menunjukkan hubungan negatif antara ukuran mesin (displ) dan efisiensi bahan bakar (hwy). Dengan kata lain, mobil dengan mesin besar menggunakan bahan bakar lebih banyak. Apakah ini mengkonfirmasi atau menyangkal hipotesis Anda tentang efisiensi bahan bakar dan ukuran mesin?

Dengan ggplot2, Anda memulai plot dengan fungsi ggplot(). ggplot() membuat sistem koordinat tempat Anda dapat menambahkan lapisan. Argumen pertama ggplot() adalah kumpulan data yang akan digunakan dalam grafik. Jadi ggplot(data = mpg) membuat grafik kosong, tetapi tidak terlalu menarik jadi saya tidak akan menunjukkannya di sini.

Anda melengkapi grafik Anda dengan menambahkan satu atau lebih lapisan ke ggplot(). Fungsi geom_point() menambahkan lapisan titik ke plot Anda, yang membuat scatterplot. ggplot2 hadir dengan banyak fungsi geom yang masing-masing menambahkan jenis lapisan yang berbeda ke plot. Anda akan mempelajari banyak dari mereka di sepanjang bab ini.

Setiap fungsi geom di ggplot2 mengambil argumen pemetaan. Ini menentukan bagaimana variabel dalam kumpulan data Anda dipetakan ke properti visual. Argumen pemetaan selalu dipasangkan dengan aes(), dan argumen x dan y dari aes() menentukan variabel mana yang akan dipetakan ke sumbu x dan y. ggplot2 mencari variabel yang dipetakan dalam argumen data, dalam hal ini, mpg.

#aestetic mapping
```{r}
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
```
```{r}
mpg
```

#“Nilai terbesar dari sebuah gambar adalah ketika gambar itu memaksa kita untuk memperhatikan apa yang tidak pernah kita harapkan untuk dilihat.” — John Tukey

Dalam plot di bawah, satu kelompok titik (disorot dengan warna merah) tampaknya berada di luar tren linier. Mobil-mobil ini memiliki jarak tempuh yang lebih tinggi dari yang Anda duga. Bagaimana Anda bisa menjelaskan mobil-mobil ini?
  
  
  ```{r}
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))
#> Warning: Using size for a discrete variable is not advised.
```
#control shape
```{r}
# Left
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Right
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

```

```{r}
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
```
#Facets
Salah satu cara untuk menambahkan variabel tambahan adalah dengan estetika. Cara lain, khususnya berguna untuk variabel kategori, adalah dengan membagi plot Anda menjadi faset, subplot yang masing-masing menampilkan satu subset data.

Untuk membagi plot Anda dengan satu variabel, gunakan facet_wrap(). Argumen pertama facet_wrap() harus berupa rumus, yang Anda buat dengan ~ diikuti dengan nama variabel (di sini "rumus" adalah nama struktur data di R, bukan sinonim untuk "persamaan"). Variabel yang Anda berikan ke facet_wrap() harus diskrit.
```{r}
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
```
Untuk faset plot Anda pada kombinasi dua variabel, tambahkan facet_grid() ke panggilan plot Anda. Argumen pertama facet_grid() juga merupakan rumus. Kali ini rumus harus berisi dua nama variabel yang dipisahkan oleh tanda ~.
```{r}
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)
```
#geometrics object
#Kedua plot berisi variabel x yang sama, variabel y yang sama, dan keduanya menggambarkan data yang sama. Tapi plotnya tidak sama. Setiap plot menggunakan objek visual yang berbeda untuk mewakili data. Dalam sintaks ggplot2, kami mengatakan bahwa mereka menggunakan geom yang berbeda.

Geom adalah objek geometris yang digunakan plot untuk mewakili data. Orang sering menggambarkan plot berdasarkan jenis geom yang digunakan plot. Misalnya diagram batang menggunakan geom batang, diagram garis menggunakan geom garis, boxplot menggunakan geom boxplot, dan sebagainya. Scatterplot mematahkan tren; mereka menggunakan titik geom. Seperti yang kita lihat di atas, Anda dapat menggunakan geom yang berbeda untuk memplot data yang sama. Plot di sebelah kiri menggunakan geom titik, dan plot di sebelah kanan menggunakan geom halus, garis halus yang dipasang pada data.

Untuk mengubah geom di plot Anda, ubah fungsi geom yang Anda tambahkan ke ggplot(). Misalnya, untuk membuat plot di atas, Anda dapat menggunakan kode ini:#
  
  ```{r}
# left
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# right
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))
```

#Setiap fungsi geom di ggplot2 membutuhkan argumen pemetaan. Namun, tidak setiap estetika bekerja dengan setiap geom. Anda dapat mengatur bentuk sebuah titik, tetapi Anda tidak dapat mengatur "bentuk" dari sebuah garis. Di sisi lain, Anda bisa mengatur linetype dari sebuah garis. geom_smooth() akan menggambar garis yang berbeda, dengan linetype yang berbeda, untuk setiap nilai unik dari variabel yang Anda petakan ke linetype.

```{r}
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = class))
```
#Di sini geom_smooth() memisahkan mobil menjadi tiga baris berdasarkan nilai drv-nya, yang menggambarkan drivetrain mobil. Satu garis menggambarkan semua titik dengan nilai 4, satu garis menggambarkan semua titik dengan nilai f, dan satu garis menggambarkan semua titik dengan nilai r. Di sini, 4 adalah singkatan dari penggerak empat roda, f untuk penggerak roda depan, dan r untuk penggerak roda belakang.

Jika ini terdengar aneh, kita dapat membuatnya lebih jelas dengan melapisi garis di atas data mentah dan kemudian mewarnai semuanya sesuai dengan drv.

```{r}
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )
```
Untuk menampilkan beberapa geom di plot yang sama, tambahkan beberapa fungsi geom ke
```{r}
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
```
```{r}
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()
```
Anda dapat menggunakan ide yang sama untuk menentukan data yang berbeda untuk setiap lapisan. Di sini, garis halus kami hanya menampilkan sebagian dari kumpulan data mpg, mobil subkompak. Argumen data lokal di geom_smooth() menimpa argumen data global di ggplot() untuk lapisan itu saja.

```{r}
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "midsize"), se = TRUE)
```

#Statistical Information
Selanjutnya, mari kita lihat diagram batang. Bagan batang tampak sederhana, tetapi menarik karena mengungkapkan sesuatu yang halus tentang plot. Pertimbangkan diagram batang dasar, seperti yang digambar dengan geom_bar(). Bagan berikut menampilkan jumlah total berlian dalam kumpulan data berlian, dikelompokkan berdasarkan potongan. Dataset berlian hadir dalam ggplot2 dan berisi informasi tentang ~54.000 berlian, termasuk harga, karat, warna, kejernihan, dan potongan setiap berlian. Bagan menunjukkan bahwa lebih banyak berlian tersedia dengan potongan berkualitas tinggi dibandingkan dengan potongan berkualitas rendah.
```{r}
?diamonds
```


```{r}
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))
```
Pada sumbu x, grafik menampilkan potongan, variabel dari berlian. Pada sumbu y, ini menampilkan hitungan, tetapi hitungan bukanlah variabel dalam berlian! Hitungan dari mana? Banyak grafik, seperti scatterplot, memplot nilai mentah dari kumpulan data Anda. Grafik lain, seperti diagram batang, menghitung nilai baru untuk diplot:
  
  diagram batang, histogram, dan poligon frekuensi bin data Anda dan kemudian plot jumlah bin, jumlah titik yang jatuh di setiap bin.

smooths menyesuaikan model dengan data Anda dan kemudian memplot prediksi dari model.

boxplots menghitung ringkasan distribusi yang kuat dan kemudian menampilkan kotak yang diformat khusus.

Algoritme yang digunakan untuk menghitung nilai baru untuk grafik disebut stat, kependekan dari transformasi statistik. Gambar di bawah menjelaskan bagaimana proses ini bekerja dengan geom_bar().

```{r}
ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))
#fungsi geombar bisa digantikan stat_count
```
#karyanya karena setiap geom memiliki stat default; dan setiap stat memiliki geom default. Ini berarti bahwa Anda biasanya dapat menggunakan geom tanpa mengkhawatirkan transformasi statistik yang mendasarinya. Ada tiga alasan Anda mungkin perlu menggunakan stat secara eksplisit:

Anda mungkin ingin mengganti stat default. Pada kode di bawah ini, saya mengubah stat geom_bar() dari count (default) menjadi identity. Ini memungkinkan saya memetakan ketinggian batang ke nilai mentah a
kamu
variabel. Sayangnya ketika orang berbicara tentang diagram batang dengan santai, mereka mungkin mengacu pada jenis diagram batang ini, di mana ketinggian batang sudah ada dalam data, atau diagram batang sebelumnya di mana ketinggian batang dihasilkan dengan menghitung baris.

```{r}
demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")
```
```{r}
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))
```
##Position adjustments

Ada satu lagi keajaiban yang terkait dengan diagram batang. Anda dapat mewarnai bagan batang menggunakan estetika warna, atau, yang lebih berguna

```{r}
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))
```
```{r}
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color))
```
```{r}
diamonds
```

Penumpukan dilakukan secara otomatis dengan penyesuaian posisi yang ditentukan oleh argumen posisi. Jika Anda tidak menginginkan bagan batang bertumpuk

```{r}

```

#latihan 
1. why not blue

```{r}
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
```

```{r}
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 2, position = "identity")
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")
```

```{r}
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")
```
```{r}
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")
```
##Jitter
#melihat banyaknya point
```{r}
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")
```
The values of hwy and displ are rounded so the points appear on a grid and many points overlap each other. This problem is known as overplotting. This arrangement makes it hard to see where the mass of the data is. Are the data points spread equally throughout the graph, or is there one special combination of hwy and displ that contains 109 values?
  
  You can avoid this gridding by setting the position adjustment to “jitter”. position = "jitter" adds a small amount of random noise to each point. This spreads the points out because no two points are likely to receive the same amount of random noise.

#Coordinate Systems
```{r}
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot()
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()

```

coord_quickmap() sets the aspect ratio correctly for maps. This is very impor
```{r}
nz <- map_data("nz")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black") +
  coord_quickmap()
```
```{r}
bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()
```

```{r}

```


## Loading dataset
```{r}
head(iris)
```

## Basic scatter plot
```{r}
# The iris dataset   is provided natively by R
#head(iris)

# basic scatterplot
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
  geom_point()
```

## Changing aesthetics
```{r}
# Changing size
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
  geom_point(size=6) #tambahkan size di dalam geom
```



```{r}
library(dplyr)
glimpse(iris)
```


```{r}
# Coloring by another variable
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + 
  geom_point() #lihat perbedaan di colour species
#ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
# geom_point(size=6)
```

```{r}
# Grouping by alpha
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, alpha=Species)) + 
  geom_point()

# pick the most useful grouping!
```

```{r}
# Grouping by shape
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, shape=Species)) + 
  geom_point()

# pick the most useful grouping!
```

```{r}
# Size --> buuble plot!!!
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, size=Species)) + 
  geom_point() 
```

```{r}
# Combine all
# A basic scatterplot with color depending on Species
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, shape=Species, alpha=Species, size=Species, color=Species)) + 
  geom_point() 
```

## Adding linear regression
```{r}
# Create dummy data
data <- data.frame(
  cond = rep(c("column_1", "column_2"), each=10), 
  x = 1:100 + rnorm(100,sd=9), 
  y = 1:100 + rnorm(100,sd=16) 
)
data
```

```{r}
data
```

```{r}
# Basic scatter plot
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
  geom_point() 

# With linear model
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
  geom_point() +
  geom_smooth(method=lm, color="red", se=FALSE) 

# With linear model, plus confidence interval
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
  geom_point() +
  geom_smooth(method=lm , color="red", se=TRUE) 
```




## JITTERING
```{r}
p <- ggplot(mpg, aes(cyl, hwy))
p + geom_point(aes())
```
#kesimpulan semakin besar cyl ... maka hw semakin ....
#data diatas hanya terdiri dari satu titik kan ya, makanya kita pakai geom gitter
dimana geom gitter bercerita satu titik terdiri dari banyak ttitik
```{r}
p + geom_jitter()
```
#Untuk Cyliner 8 konsumsi ada di sekitar..
#untuk cylinder 6 ...?
#jadi geomponint ini bercerita tentang daerah mana dimana banyak datanya

#menambahkan estetik
```{r}
# Add aesthetic mappings
p + geom_jitter(aes(colour = class))
```
#dari sini bisa kita lihat bahwa untuk tipe midsize lebih hemat dibandingkan tipe sub compact
#tipe suv semakin besar tipe subcompact maka ,,,


#geom gitter juga bisa sebagai configure
#untuk mid size ter
```{r}
ggplot(mpg, aes(cty, hwy)) + geom_jitter(width = 0.5, height = 5)
```


## BUBBLE THING

```{r}
# The dataset is provided in the gapminder 
install.packages("gapminder")
library(gapminder)
data <- gapminder %>% filter(year=="2007") %>% dplyr::select(-year)

# Most basic bubble plot
ggplot(data, aes(x=gdpPercap, y=lifeExp, size = pop)) +
  geom_point(alpha=0.7)
```

```{r}
# Another bubble plot
# Most basic bubble plot
data %>%
  arrange(desc(pop)) %>%
  mutate(country = factor(country, country)) %>%
  ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, color=continent)) +
  geom_point(alpha=0.5) +
  scale_size(range = c(.1, 24), name="Population (M)")
```

## Case Study for Analysis
```{r}
who_disease <- read.csv("D:/DATA SCIENCE/DATA SCIENTIST - KOMINFO/4. Data Visualization in Data Science using R/Data Viz Part 3/who_disease.csv")
```
```{r}
head(who_disease)
```
Picking few countries
```{r}
interestingCountries <- c("NGA", "SDN", "FRA", "NPL", "MYS", "TZA", "YEM", "UKR", "BGD", "VNM")
```

Picking 2 year to compare
```{r}
who_subset <- who_disease %>% 
  filter(
    countryCode %in% interestingCountries,
    disease == 'measles',
    year %in% c(2006, 2016) 
  ) %>% 
  mutate(year = paste0('cases_', year)) %>% 
  tidyr::spread(year, cases)

?spread
```

```{r}
head(who_subset)
```


```{r}
write.csv(who_subset, 'who_subset.csv', row.names = FALSE)
```

```{r}
(who_subset <- read.csv("who_subset.csv"))
```

Shows pattern with log scale
```{r}
# True value without logaritmic
ggplot(who_subset, aes(x = cases_2006, y = country)) +
  geom_point()

# With logaritmic
ggplot(who_subset, aes(x = log10(cases_2006), y = country)) +
  geom_point()

# With logaritmic and ordering
ggplot(who_subset, aes(x = log10(cases_2006), y = reorder(country, cases_2006))) +
  geom_point()

ggplot(who_subset, aes(x = cases_2006, y = reorder(country, cases_2006))) +
  geom_point()
```

```{r}
# Check the increaseness of 2016 and 2006 by log 2, log2 = 1 means there is increase by 2 times
who_subset %>% 
  # calculate the log fold change between 2016 and 2006
  mutate(logFoldChange = log2(cases_2016/cases_2006)) %>% 
  # set y axis as country ordered with respect to logFoldChange
  ggplot(aes(x = logFoldChange, y = reorder(country, logFoldChange))) +
  geom_point() +
  # add a visual anchor at x = 0
  geom_vline(xintercept = 0)


```
Ukraine berkurang signifikan dibanding yang lain.

```{r}
who_subset %>% 
  mutate(logFoldChange = log2(cases_2016/cases_2006)) %>%
  ggplot(aes(x = logFoldChange, y = reorder(country, logFoldChange))) +
  geom_point() +
  geom_vline(xintercept = 0) +
  facet_grid(region~.)

# scale y only shown that region
who_subset %>% 
  mutate(logFoldChange = log2(cases_2016/cases_2006)) %>%
  ggplot(aes(x = logFoldChange, y = reorder(country, logFoldChange))) +
  geom_point() +
  geom_vline(xintercept = 0) +
  facet_grid(region~., scale = 'free_y')
```

```{r}
# Make point visualization form pertussis disease in 1980 where the region is on America!
```


```{r}
amr_pertussis <- who_disease %>% 
  filter(   # filter data to our desired subset
    region == 'AMR', 
    year == 1980, 
    disease == 'pertussis'
  )
```

```{r}
amr_pertussis %>% filter(cases > 0) %>% 
  ggplot(aes(x = reorder(country, cases), y = cases)) + 
  # switch geometry to points and set point size = 2
  geom_point(size=2) + 
  # change y-axis to log10. 
  scale_y_log10() +
  # add theme_minimal()
  theme_minimal() +
  coord_flip()
```




# Boxplot and Violin
```{r}
md_speeding <- read.csv('md_speeding.csv')
```

```{r}
head(md_speeding, row.names=FALSE)
```

# BEYOND BOXPLOT for Distribution
```{r}
md_speeding %>% 
  filter(vehicle_color == 'RED') %>%
  # Map x and y to gender and speed columns respectively
  ggplot(aes(x = gender, y = speed)) + 
  # add a boxplot geometry
  geom_boxplot() +
  # give plot supplied title
  labs(title = 'Speed of red cars by gender of driver')
```


```{r}
md_speeding %>% 
  filter(vehicle_color == 'RED') %>%
  ggplot(aes(x = gender, y = speed)) + 
  # add jittered points with alpha of 0.3 and color 'steelblue'
  geom_jitter(color = 'steelblue', alpha = 0.3) +
  # make boxplot transparent with alpha = 0
  geom_boxplot(alpha = 0) +
  labs(title = 'Speed of red cars by gender of driver')
```


```{r}
# remove color filter
md_speeding %>%
  ggplot(aes(x = gender, y = speed)) + 
  geom_jitter(alpha = 0.3, color = 'steelblue') +
  geom_boxplot(alpha = 0) +
  # add a facet_wrap by vehicle_color
  facet_wrap(~vehicle_color) +
  # change title to reflect new faceting
  labs(title = 'Speed of different car colors, separated by gender of driver')


#That's a lot of points drawn to the screen! Do you think that drawing each data point with the jitter function is a good idea here, or does it feel to crowded to you? A lot can depend on the data's form so it's always good to experiment!
```



```{r}
# Load library for making beeswarm plots
install.packages("ggbeeswarm")
library(ggbeeswarm)

```

```{r}
md_speeding %>% 
  filter(vehicle_color == 'RED') %>%
  ggplot(aes(x = gender, y = speed)) + 
  # change point size to 0.5 and alpha to 0.8
  geom_beeswarm(cex = 0.5, alpha = 0.8) +
  # add a transparent boxplot on top of points
  geom_boxplot(alpha = 0)

?geom_beeswarm
```

```{r}
md_speeding %>% 
  filter(vehicle_color == 'RED') %>%
  ggplot(aes(x = gender, y = speed)) + 
  # Replace beeswarm geometry with a violin geometry with kernel width of 2.5
  geom_violin(bw = 2.5) +
  # add individual points on top of violins
  geom_point(alpha = 0.3, size = 0.5)

?geom_violin
```



```{r}
md_speeding %>% 
  filter(vehicle_color == 'RED') %>%
  ggplot(aes(x = gender, y = speed)) + 
  geom_violin(bw = 2.5) +
  # add a transparent boxplot and shrink its width to 0.3
  geom_boxplot(alpha = 0, width = 0.3) +
  # Reset point size to default and set point shape to 95
  geom_point(shape = 95) +
  # Supply a subtitle detailing the kernel width
  labs(subtitle = 'Gaussian kernel SD = 2.5')

#You've encoded a lot of information into a single plot here! You have summary statistics, density estimates, and raw points. For many scenarios this may be too much, but sometimes, especially when exploring a dataset, it can be great to glean so much in one glance.
```

```{r}
md_speeding %>% 
  ggplot(aes(x = gender, y = speed)) + 
  # replace with violin plot with kernel width of 2.5, change color argument to fill 
  geom_violin(alpha = 0.3, color = 'steelblue', fill = 'steelblue', bw = 2.5) +
  # reduce width to 0.3
  geom_boxplot(alpha = 0, width = 0.3) +
  facet_wrap(~vehicle_color) +
  labs(
    title = 'Speed of different car colors, separated by gender of driver'
    # add a subtitle w/ kernel width
    , subtitle = 'Gaussian kernel width: 2.5'
  )

#When swapping the jittered points for a violin plot in these large-comparison situations, you still hear from all the data, but your plot becomes a lot less busy. Do you think it works well in this case compared to the more basic boxes + jitter?
```
## ggridges
```{r}
install.packages("ggridges")
library(ggridges)
```

```{r}
md_speeding %>% 
  mutate(day_of_week = factor(day_of_week, levels = c("Mon","Tues","Wed","Thu","Fri","Sat","Sun") )) %>% 
  ggplot(aes( x = percentage_over_limit, y = day_of_week)) + 
  # Set bandwidth to 3.5
  geom_density_ridges(bandwidth = 3.5) +
  # add limits of 0 to 150 to x-scale
  scale_x_continuous(limits = c(0, 150)) 
# provide subtitle with bandwidth
labs(subtitle = 'Gaussian kernel SD = 3.5')
```

```{r}
md_speeding %>% 
  mutate(day_of_week = factor(day_of_week, levels = c("Mon","Tues","Wed","Thu","Fri","Sat","Sun") )) %>% 
  ggplot(aes( x = percentage_over_limit, y = day_of_week)) + 
  # make ridgeline densities a bit see-through with alpha = 0.7
  geom_density_ridges(bandwidth = 3.5, alpha = 0.7) +
  # set expand values to c(0,0)
  scale_x_continuous(limits = c(0,150), expand  = c(0,0)) +
  labs(subtitle = 'Guassian kernel SD = 3.5') +
  # remove y axis ticks by setting equal to element_blank()
  theme(axis.ticks.y = element_blank() )
```


```{r}
md_speeding %>% 
  mutate(day_of_week = factor(day_of_week, levels = c("Mon","Tues","Wed","Thu","Fri","Sat","Sun") )) %>% 
  ggplot(aes( x = percentage_over_limit, y = day_of_week)) + 
  geom_point(
    alpha = 0.2,  # make semi-transparent with alpha = 0.2
    shape = '|',  # turn points to vertical lines with shape = '|'
    position = position_nudge(y = -0.05) # nudge the points downward by 0.05
  ) +
  geom_density_ridges(bandwidth = 3.5, alpha = 0.7) +
  scale_x_continuous(limits = c(0,150), expand  = c(0,0)) +
  labs(subtitle = 'Guassian kernel SD = 3.5') +
  theme( axis.ticks.y = element_blank() )
```






```{r pressure, echo=FALSE, fig.cap="A caption", out.width = '25%'}
knitr::include_graphics("distribution.png")
```

# LEAFLET

```{r}
install.packages("leaflet")
library(leaflet)
```


```{r}
leaflet() %>%
  addTiles()
```

```{r}
## Change addTiles() to addProviderTiles() and set the provider argument to "CartoDB"
leaflet() %>% 
  addProviderTiles(provider = "CartoDB") #ESRI #"CartoDB.PositronNoLabels"
```


```{r}
# Map with CartoDB tile centered on DataCamp's NYC office with zoom of 6
leaflet()  %>% 
  addProviderTiles("CartoDB")  %>% 
  setView(lng = -73.98575, lat = 40.74856, zoom = 6)
```



```{r}
leaflet()  %>% 
  addProviderTiles("CartoDB")  %>% 
  addMarkers(lng = 106.827153, lat =  -6.175392)
```

```{r}
leaflet()  %>% 
  addProviderTiles("CartoDB")  %>% 
  addMarkers(lng = 106.827153, lat =  -6.175392) %>% 
  setView(lng = 106.827153, lat =  -6.175392, zoom = 12)
```

```{r}
leaflet()  %>% 
  addProviderTiles("CartoDB")  %>% 
  addMarkers(lng = 106.827153, lat =  -6.175392, popup = 'Monas') %>% 
  setView(lng = 106.827153, lat =  -6.175392, zoom = 12)
```


```{r}
leaflet()  %>% 
  addProviderTiles("CartoDB")  %>% 
  addMarkers(lng = 106.827153, lat =  -6.175392, popup = 'Monas') %>% 
  setView(lng = 106.827153, lat =  -6.175392, zoom = 12) %>%
  clearBounds() #
#clearMarkers()  %>% 

```
## OTHER DATASET
```{r}
ipeds <- read.csv('D:/DATA SCIENCE/DATA SCIENTIST - KOMINFO/4. Data Visualization in Data Science using R/Data Viz Part 3/ipeds.csv')
head(ipeds)
```

```{r}
library(tidyverse)
```


```{r}
# Remove colleges with missing sector information
ipeds <- 
  ipeds %>% 
  drop_na()
```

```{r}
ipeds_for_profit <- ipeds %>%
  filter(sector_label == "For-Profit")
leaflet()  %>% 
  addProviderTiles("CartoDB")  %>% 
  addMarkers(lng = ipeds_for_profit$lng, lat = ipeds_for_profit$lat) 
#clearMarkers() %>%
#addCircleMarkers(lng = ipeds_for_profit$lng, lat = ipeds_for_profit$lat)
```

```{r}
leaflet()  %>% 
  addProviderTiles("CartoDB")  %>% 
  addMarkers(lng = ipeds_for_profit$lng, lat = ipeds_for_profit$lat) %>%
  clearMarkers() %>%
  addCircleMarkers(lng = ipeds_for_profit$lng, lat = ipeds_for_profit$lat, radius = 2, color = "red")
```


```{r}
leaflet()  %>% 
  addProviderTiles("CartoDB")  %>% 
  addCircleMarkers(data = ipeds_for_profit, radius = 2, popup = ~name)
```

```{r}
leaflet()  %>% 
  addProviderTiles("CartoDB")  %>% 
  addCircleMarkers(data = ipeds_for_profit, radius = 2, popup = ~paste0("<b>", name, "</b>", "<br/>", sector_label)) #bold and break
```

```{r}
leaflet()  %>% 
  addProviderTiles("CartoDB")  %>% 
  addCircleMarkers(data = ipeds_for_profit, radius = 2, label = ~paste0(name, " (", sector_label, ")"))
```

```{r}
ipeds_100 <- head(ipeds, n = 100)
```

```{r}
map <- leaflet() %>% 
  addProviderTiles("CartoDB")
map
```

```{r}
# Make a color palette called pal for the values of `sector_label` using `colorFactor()`  
# Colors should be: "red", "blue", and "#9b4a11" for "Public", "Private", and "For-Profit" colleges, respectively
pal <- colorFactor(palette = c("red", "blue", "#9b4a11"), 
                   levels = c("Public", "Private", "For-Profit"))

# Add circle markers that color colleges using pal() and the values of sector_label
map2 <- 
  map %>% 
  addCircleMarkers(data = ipeds_100, radius = 2, 
                   color = ~pal(sector_label), 
                   label = ~paste0(name, " (", sector_label, ")"))

# Print map2
map2
```

```{r}
map2 %>% 
  addLegend(pal = pal, 
            values = c("Public", "Private", "For-Profit"))
```

```{r}
# Customize the legend
map2 %>% 
  addLegend(pal = pal, 
            values = c("Public", "Private", "For-Profit"),
            # opacity of .5, title of Sector, and position of topright
            opacity = 0.5, title = "Sector", position = "topleft")
```





## SP

```{r}
library(sp)

?sp
```


```{r}
load(file = "D:/DATA SCIENCE/DATA SCIENTIST - KOMINFO/4. Data Visualization in Data Science using R/Data Viz Part 3/nc_zips.Rda")
```




```{r}
# map the polygons in shp
shp %>% 
  leaflet() %>% 
  addTiles() %>% 
  addPolygons()

```


```{r}
# map the polygons in shp
shp %>% 
  leaflet() %>% 
  addTiles() %>% 
  addPolygons()

# which zips were not in the income data?
shp_na <- shp[is.na(shp$mean_income),]

```

```{r}
nc_income <- read.csv('D:/DATA SCIENCE/DATA SCIENTIST - KOMINFO/4. Data Visualization in Data Science using R/Data Viz Part 3/mean_income_by_zip_nc.csv')
head(nc_income)
```

```{r}
nc_income$zipcode <- as.factor(nc_income$zipcode)
```


```{r}
# Summarize the nc_income data
summary(nc_income)

# Left join nc_income onto shp@data and store in shp_nc_income
shp_nc_income <- shp@data %>% 
  left_join(nc_income, by = c("GEOID10" = "zipcode"))

# Print the number of missing values of each variable in shp_nc_income
shp_nc_income  %>%
  summarize_all(funs(sum(is.na(.))))
```

```{r}
# map the polygons in shp
shp %>% 
  leaflet() %>% 
  addTiles() %>% 
  addPolygons()

# which zips were not in the income data?
shp_na <- shp[is.na(shp$mean_income),]

# map the polygons in shp_na
shp_na %>% 
  leaflet() %>% 
  addTiles() %>% 
  addPolygons() %>%
  
  ```

```{r}
shp_nc_income$mean_income
```


```{r}
# summarize the mean income variable
summary(shp_nc_income$mean_income)
```

```{r}
# subset shp to include only zip codes in the top quartile of mean income
high_inc <- shp[!is.na(shp_nc_income$mean_income) & shp_nc_income$mean_income > 55917,]
```

```{r}
# map the boundaries of the zip codes in the top quartile of mean income
high_inc %>%
  leaflet() %>%
  addTiles() %>%
  addPolygons()
```

```{r}
# Create a logged version of the nc_pal color palette
nc_pal <- colorNumeric("YlGn", domain = log(high_inc@data$mean_income))

# apply the nc_pal
high_inc %>%
  leaflet() %>%
  #addProviderTiles("CartoDB") %>%
  addPolygons(weight = 1, color = ~nc_pal(log(mean_income)), fillOpacity = 1,
              label = ~paste0("Mean Income: ", dollar(mean_income)),
              highlightOptions = highlightOptions(weight = 5, color = "white", bringToFront = TRUE))
```
```{r}
# Print the slot names of `wealthy_zips`
slotNames(wealthy_zips)
```

```{r}
# Print a summary of the `mean_income` variable
summary(wealthy_zips@data$mean_income)
```

```{r}
# plot zip codes with mean incomes >= $200k
```

```{r}
# plot zip codes with mean incomes >= $200k
wealthy_zips %>% 
  leaflet() %>% 
  addProviderTiles("CartoDB") %>% 
  # set color to green and create Wealth Zipcodes group
  addPolygons(weight = 1, fillOpacity = .7, color = "green",  group = "Wealthy Zipcodes", 
              label = ~paste0("Mean Income: ", mean_income),
              highlightOptions = highlightOptions(weight = 5, color = "white", bringToFront = TRUE))
```

```{r}
# Add polygons using wealthy_zips
wealthy_zips %>% 
  leaflet() %>% 
  addProviderTiles("CartoDB") %>% 
  addPolygons(data = wealthy_zips, weight = 1, fillOpacity = .5, color = "Grey",  group = "Wealthy Zip Codes", 
              label = ~paste0("Mean Income: ", mean_income),
              highlightOptions = highlightOptions(weight = 5, color = "white", bringToFront = TRUE)) %>% 
  # Update layer controls including "Wealthy Zip Codes"
  addLayersControl(baseGroups = c("OSM", "Carto", "Esri"), 
                   overlayGroups = c("Public", "Private", "For-Profit", "Wealthy Zip Codes"))     

```


