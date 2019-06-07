
<!-- README.md is generated from README.Rmd. Please edit that file -->

# plankton\_001

<!-- badges: start -->

<!-- badges: end -->

## Introduction

Les organismes planctoniques sont à la base de la chaine trophique. En
étudier leur diversité est la première étape à la compréhension de la
complixité du milieu aquatique.

Les organismes planctoniques sont échantillonsé via différentes méthodes
comme les traits de plancton verticaux et horizontaux. Les échantillons
sont par la suite stockés avec une solution à base de formol.

Anciennement, les échantillons étaient analysés par des spécialistes.
Ils identifiaient et dénombraient les individus présents dans chaque
échantillon. Des outils de classifications automatiques ont été mis au
point afin de faciliter l’identification et le dénombrement des
individus. De plus, le temps d’analyse est plus court qu’une
identification manuelle.

Les échantillons sont premièrement numérisés. Chaque image est decoupé
en une série de vignettes sur lesquelles une série de variables sont
mesurées. Toutes ces variables sont consignées dans des jeux de données.

Les méthodes et outils employés varient pour numériser, découper et
mesurer de nombreux paramètres dans l’identification et le dénombrement
d’organismes planctoniques.

Il est dès lors indispensable de trouver des solutions afin de comparer
puis de convertir les observations obtenues par chaque méthode.

## But

Le but de ce dépôt est de proposer un outils de comparaison et de
conversion entre deux jeux de données obtenu par des outils et méthodes
différentes.

## M\&M

Deux datasets sont utilisés dont le premier provient du SEANOE et le
second du service d’ECONUM. Il s’agit de variables obtenues avec
ZooProcess (seanoe) et par ZooImage (econum) sur des images d’organismes
planctoniques obtnues avec le ZooScan.

### seanoe

Le premier dataset provient de ZooScanNet
<https://www.seanoe.org/data/00446/55741/>

``` r
zs <- read("data/data_raw/features_native.csv.gz", n_max = 10)
#> Parsed with column specification:
#> cols(
#>   .default = col_double()
#> )
#> See spec(...) for full column specifications.
names(zs)
#>  [1] "objid"      "area"       "mean"       "stddev"     "mode"      
#>  [6] "min"        "max"        "perim."     "width"      "height"    
#> [11] "major"      "minor"      "circ."      "feret"      "intden"    
#> [16] "median"     "skew"       "kurt"       "%area"      "area_exc"  
#> [21] "fractal"    "skelarea"   "slope"      "histcum1"   "histcum2"  
#> [26] "histcum3"   "nb1"        "nb2"        "nb3"        "symetrieh" 
#> [31] "symetriev"  "symetriehc" "symetrievc" "convperim"  "convarea"  
#> [36] "fcons"      "thickr"     "elongation" "range"      "meanpos"   
#> [41] "cv"         "sr"         "perimferet" "perimmajor"
```

### ECONUM

Le second dataset provient du service d’ECONUM.

``` r
en <- read_fst("data/data_raw/econum_set.fst", to = 10)
names(en)
#>  [1] "ECD"        "Area"       "Mean"       "StdDev"     "Mode"      
#>  [6] "Min"        "Max"        "X"          "Y"          "XM"        
#> [11] "YM"         "Perim."     "BX"         "BY"         "Width"     
#> [16] "Height"     "Major"      "Minor"      "Angle"      "Circ."     
#> [21] "Feret"      "IntDen"     "Median"     "Skew"       "Kurt"      
#> [26] "RawIntDen"  "FeretX"     "FeretY"     "FeretAngle" "MinFeret"  
#> [31] "AR"         "Round"      "Solidity"   "XStart"     "YStart"    
#> [36] "Dil"        "Class"
```

# Résultats & discussion

Une simple comparaison des noms des variables montrent des différences.

## Note

Les jeux de données employé sont de tailles trop important que pour être
géré par le gestionnaire de version Git. Le package est
[piggyback](https://ropensci.github.io/piggyback/) est
employé.

-----

<img src="README-figures/EcoNum-logo.png" width="70" height="70" align="left"/>
Ce dépôt rentre dans le cadre des recherches menées au sein du service
d’Ecologie Numérique des Milieux aquatiques

Pour en apprendre plus, visitez
<https://econum.github.io>

-----

<img src="README-figures/site-title.png" width="130" height="50" align="left"/>
This package is developped with the SciViews Box 2019.

To learn more, please visit <http://www.sciviews.org>

-----
