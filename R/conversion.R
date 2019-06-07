# Suite d'instruction pour convertir le datasets de seanoe en dataset compatible avec celui du laboratoire d'econum
# Guyliann Engels
# 2019-05-29

# Les différentes étapes sont détaillé dans le notebook : comparaison_variable.Rmd

# packages ----

SciViews::R
library(fst)
source("R/pix_to_mm.R")
source("R/grayscale_std.R")

# import dataset ----

vf <- read("data/data_raw/features_native.csv.gz")
eco <- read_fst(path = "data/data_raw/econum_set.fst")

# Pixel to mm ----
pix_conv <- 0.01058
(commun_names_pix <- c("perim.", "width", "height", "major", "minor", "feret"))

vf %>%
  map_at(.at = commun_names_pix,.f =  pix_to_mm) -> vf
vf <- as_tibble(vf)

# Pixel^2 to mm^2 -----
vf$area <- pix_to_mm(vf$area, pix_conv = 0.01058^2)

# Conversion des niveaux de gris -----

(gray <- c("mean", "stddev", "mode","min", "max", "median"))

vf %>%
  map_at(.at = gray, .f = grayscale_std) %>% as_tibble() -> vf

gray1 <- c("mean", "mode", "median", "min", "max")

vf %>%
  map_at(.at = gray1, .f = grayscale_convert) %>% as_tibble() -> vf

vf %>%
  dplyr::rename(min1 = min, max1 = max) %>%
  dplyr::rename(max = min1, min = max1) -> vf

# Les variables calculés par la variable `zooimage::calcVars`

vf %>%
  mutate(
    aspect_ratio = minor/major,
    range = max - min,
    mean_pos = (max-mean)/range,
    sd_norm = stddev/range,
    cv = stddev/mean *100,
    mean_dia = (major + minor)/2,
    meanf_dia = (feret + minor)/2,
    ecd = 2 * (area/3.14)^(1/2),
    transpi1 = 1-(ecd/mean_dia),
    transpi2 = 1-(ecd/meanf_dia),
    compactness = perim.^2/4/pi/area,
    pa = perim.^2/16 - area,
    elongation = ifelse(pa <= 0, 1, area/(perim./4 - pa^0.5)^2),
    skew = skew*-1) -> vf


# Conversion econum ----

names(eco) %>% str_to_lower() -> t
names(eco) <- t

eco %>%
  mutate(
    aspect_ratio = minor/major,
    range = max - min,
    mean_pos = (max-mean)/range,
    sd_norm = stddev/range,
    cv = stddev/mean *100,
    mean_dia = (major + minor)/2,
    meanf_dia = (feret + minor)/2,
    ecd = 2 * (area/3.14)^(1/2),
    transpi1 = 1-(ecd/mean_dia),
    transpi2 = 1-(ecd/meanf_dia),
    compactness = perim.^2/4/pi/area,
    pa = perim.^2/16 - area,
    elongation = ifelse(pa <= 0, 1, area/(perim./4 - pa^0.5)^2),
    skew = skew) -> eco


# variables communes 

names(vf) -> names_vf
names(eco) -> names_eco
commun <- names_vf[names_vf %in% names_eco]

#length(commun)
#commun

#for(i in 1:length(commun))
#  boxplot(sample(vf[[commun[i]]], size = 20000), eco[[commun[i]]], main = #commun[i])

# write_fst(x = eco, "data/data_conv/econum_rev_var.fst", 100)
write_fst(x = vf, "data/data_conv/senoe_rev_var.fst", 100)

