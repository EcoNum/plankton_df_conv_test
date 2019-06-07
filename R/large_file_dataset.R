# la gestion des fichier de données est réalisée avec le package piggyback 
library(piggyback)

# ignore les gros fichiers
pb_track("data/data_raw/")

# on importe les fichiers intéressants pour travailler
pb_download(file = "features_native.csv.gz",
            dest = "data/data_raw/",
            repo = "EcoNum/skimage-test",
            tag = "v1.0.0")

pb_download(file = "taxa.csv.gz",
            dest = "data/data_raw/",
            repo = "EcoNum/skimage-test",
            tag = "v1.0.0")

