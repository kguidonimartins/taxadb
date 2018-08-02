
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/cboettig/taxald.svg?branch=master)](https://travis-ci.org/cboettig/taxald)
[![Coverage
status](https://codecov.io/gh/cboettig/taxald/branch/master/graph/badge.svg)](https://codecov.io/github/cboettig/taxald?branch=master)
[![CRAN
status](https://www.r-pkg.org/badges/version/taxald)](https://cran.r-project.org/package=taxald)

<!-- README.md is generated from README.Rmd. Please edit that file -->

# taxald

**This package is purley exploratory at this stage\!**

Central to `taxald` design is to create a *local* database of all
available taxonomic authority data that we can query quickly, even when
working with tens of thousands of species. The second key feature of
`taxald` design is to return queries from each authority using a
*consistent* and convenient table structure, facilitating queries that
compare, combine, or work across names from multiple authorities.

## Install and initial setup

`taxald` should now be installable. To get started, try:

``` r
devtools::install_github("cboettig/taxald")
```

``` r
library(taxald)
library(tictoc) # let's display timing of queries for reference
```

Before we can use most `taxald` functions, we need to do a one-time
installation of the database `taxald` uses for almost all commands. This
can take a while to run, but needs only be done once. The database is
installed on your local harddisk and will persist between R sessions.
Download and install the database like so:

``` r
tic()
create_db()
#> 
  |                                                                       
  |                                                                 |   0%
  |                                                                       
  |=                                                                |   1%
  |                                                                       
  |=                                                                |   2%
  |                                                                       
  |==                                                               |   2%
  |                                                                       
  |==                                                               |   3%
  |                                                                       
  |==                                                               |   4%
  |                                                                       
  |===                                                              |   4%
  |                                                                       
  |===                                                              |   5%
  |                                                                       
  |====                                                             |   6%
  |                                                                       
  |====                                                             |   7%
  |                                                                       
  |=====                                                            |   7%
  |                                                                       
  |=====                                                            |   8%
  |                                                                       
  |======                                                           |   9%
  |                                                                       
  |======                                                           |  10%
  |                                                                       
  |=======                                                          |  10%
  |                                                                       
  |=======                                                          |  11%
  |                                                                       
  |========                                                         |  12%
  |                                                                       
  |========                                                         |  13%
  |                                                                       
  |=========                                                        |  13%
  |                                                                       
  |=========                                                        |  14%
  |                                                                       
  |=========                                                        |  15%
  |                                                                       
  |==========                                                       |  15%
  |                                                                       
  |==========                                                       |  16%
  |                                                                       
  |===========                                                      |  16%
  |                                                                       
  |===========                                                      |  17%
  |                                                                       
  |============                                                     |  18%
  |                                                                       
  |============                                                     |  19%
  |                                                                       
  |=============                                                    |  19%
  |                                                                       
  |=============                                                    |  20%
  |                                                                       
  |==============                                                   |  21%
  |                                                                       
  |==============                                                   |  22%
  |                                                                       
  |===============                                                  |  22%
  |                                                                       
  |===============                                                  |  23%
  |                                                                       
  |===============                                                  |  24%
  |                                                                       
  |================                                                 |  24%
  |                                                                       
  |================                                                 |  25%
  |                                                                       
  |=================                                                |  26%
  |                                                                       
  |=================                                                |  27%
  |                                                                       
  |==================                                               |  27%
  |                                                                       
  |==================                                               |  28%
  |                                                                       
  |===================                                              |  29%
  |                                                                       
  |===================                                              |  30%
  |                                                                       
  |====================                                             |  30%
  |                                                                       
  |====================                                             |  31%
  |                                                                       
  |====================                                             |  32%
  |                                                                       
  |=====================                                            |  32%
  |                                                                       
  |=====================                                            |  33%
  |                                                                       
  |======================                                           |  33%
  |                                                                       
  |======================                                           |  34%
  |                                                                       
  |=======================                                          |  35%
  |                                                                       
  |=======================                                          |  36%
  |                                                                       
  |========================                                         |  36%
  |                                                                       
  |========================                                         |  37%
  |                                                                       
  |=========================                                        |  38%
  |                                                                       
  |=========================                                        |  39%
  |                                                                       
  |==========================                                       |  39%
  |                                                                       
  |==========================                                       |  40%
  |                                                                       
  |==========================                                       |  41%
  |                                                                       
  |===========================                                      |  41%
  |                                                                       
  |===========================                                      |  42%
  |                                                                       
  |============================                                     |  43%
  |                                                                       
  |============================                                     |  44%
  |                                                                       
  |=============================                                    |  44%
  |                                                                       
  |=============================                                    |  45%
  |                                                                       
  |==============================                                   |  46%
  |                                                                       
  |==============================                                   |  47%
  |                                                                       
  |===============================                                  |  47%
  |                                                                       
  |===============================                                  |  48%
  |                                                                       
  |================================                                 |  48%
  |                                                                       
  |================================                                 |  49%
  |                                                                       
  |================================                                 |  50%
  |                                                                       
  |=================================                                |  50%
  |                                                                       
  |=================================                                |  51%
  |                                                                       
  |==================================                               |  52%
  |                                                                       
  |==================================                               |  53%
  |                                                                       
  |===================================                              |  53%
  |                                                                       
  |===================================                              |  54%
  |                                                                       
  |====================================                             |  55%
  |                                                                       
  |====================================                             |  56%
  |                                                                       
  |=====================================                            |  56%
  |                                                                       
  |=====================================                            |  57%
  |                                                                       
  |======================================                           |  58%
  |                                                                       
  |======================================                           |  59%
  |                                                                       
  |=======================================                          |  60%
  |                                                                       
  |=======================================                          |  61%
  |                                                                       
  |========================================                         |  61%
  |                                                                       
  |========================================                         |  62%
  |                                                                       
  |=========================================                        |  63%
  |                                                                       
  |=========================================                        |  64%
  |                                                                       
  |==========================================                       |  64%
  |                                                                       
  |==========================================                       |  65%
  |                                                                       
  |===========================================                      |  65%
  |                                                                       
  |===========================================                      |  66%
  |                                                                       
  |============================================                     |  67%
  |                                                                       
  |============================================                     |  68%
  |                                                                       
  |=============================================                    |  69%
  |                                                                       
  |=============================================                    |  70%
  |                                                                       
  |==============================================                   |  70%
  |                                                                       
  |==============================================                   |  71%
  |                                                                       
  |===============================================                  |  72%
  |                                                                       
  |===============================================                  |  73%
  |                                                                       
  |================================================                 |  73%
  |                                                                       
  |================================================                 |  74%
  |                                                                       
  |=================================================                |  75%
  |                                                                       
  |=================================================                |  76%
  |                                                                       
  |==================================================               |  76%
  |                                                                       
  |==================================================               |  77%
  |                                                                       
  |==================================================               |  78%
  |                                                                       
  |===================================================              |  78%
  |                                                                       
  |===================================================              |  79%
  |                                                                       
  |====================================================             |  80%
  |                                                                       
  |====================================================             |  81%
  |                                                                       
  |=====================================================            |  81%
  |                                                                       
  |=====================================================            |  82%
  |                                                                       
  |======================================================           |  82%
  |                                                                       
  |======================================================           |  83%
  |                                                                       
  |=======================================================          |  84%
  |                                                                       
  |=======================================================          |  85%
  |                                                                       
  |========================================================         |  85%
  |                                                                       
  |========================================================         |  86%
  |                                                                       
  |========================================================         |  87%
  |                                                                       
  |=========================================================        |  87%
  |                                                                       
  |=========================================================        |  88%
  |                                                                       
  |==========================================================       |  89%
  |                                                                       
  |==========================================================       |  90%
  |                                                                       
  |===========================================================      |  90%
  |                                                                       
  |===========================================================      |  91%
  |                                                                       
  |============================================================     |  92%
  |                                                                       
  |============================================================     |  93%
  |                                                                       
  |=============================================================    |  93%
  |                                                                       
  |=============================================================    |  94%
  |                                                                       
  |=============================================================    |  95%
  |                                                                       
  |==============================================================   |  95%
  |                                                                       
  |==============================================================   |  96%
  |                                                                       
  |===============================================================  |  97%
  |                                                                       
  |===============================================================  |  98%
  |                                                                       
  |================================================================ |  98%
  |                                                                       
  |================================================================ |  99%
  |                                                                       
  |=================================================================|  99%
  |                                                                       
  |=================================================================| 100%
toc()
#> 31.591 sec elapsed
```

The default behavior installs only the ITIS database using the hierachy
schema. While this should be sufficient for getting started on basic
tasks like looking up classification or translating between IDs and
scientific names, users will want to install additional authorities and
schemas for advanced use. See the `authorities` vignette for details. By
default, `taxald` will install the database into a hidden `.taxald`
folder in your home directory (`~/.taxald`). You can control this by
passing the path to `create_taxadb()` or setting the environmental
variable `TAXALD_HOME` to a different location.

This function downloads each of the individual tables and loads them
into a [MonetDBLite](https://www.monetdb.org) database. (MonetDBLite is
much like SQLite, requiring no external server setup. However, for our
purposes, MonetDB’s columnar design provides significantly faster
performance than SQLite, Postgres, or even some in-memory operations in
`dplyr`.)

Currently tables are pulled from the development cache on GitHub. Many
of these tables are still being cleaned up and standardized, see
[schema.md](schema.md). Multiple tablesare provided for each authority,
though some of these contain redundant information, different
orientations may prove more convenient or computationally efficient.

## Package API

Once the database is installed, we can start to make some queries.

First, let’s get a nice big species list, say, all the birds (known to
ITIS):

``` r
tic()
df <- descendants(name = "Aves", rank = "class")
toc()
#> 1.628 sec elapsed
```

How many species did we get?

``` r
length(df$species)
#> [1] 41604
```

Generally, we have a species list could have come from some particular
research project, and the names may not match those of any one
particular authority.

``` r
tic()
ids(df$species)
#> Joining, by = "species"
#> # A tibble: 166,416 x 2
#>    id          species                 
#>    <chr>       <chr>                   
#>  1 ITIS:174375 Struthio camelus        
#>  2 ITIS:174375 Struthio camelus        
#>  3 ITIS:174375 Struthio camelus        
#>  4 ITIS:174375 Struthio camelus        
#>  5 ITIS:174379 Rhea americana          
#>  6 ITIS:174379 Rhea americana          
#>  7 ITIS:174379 Rhea americana          
#>  8 ITIS:174379 Rhea americana          
#>  9 ITIS:174385 Dromaius novaehollandiae
#> 10 ITIS:174385 Dromaius novaehollandiae
#> # ... with 166,406 more rows
toc()
#> 0.874 sec elapsed
```

We can get the full hierachical classification for this list of species:

``` r
tic()
classification(df$species)
#> Joining, by = "species"
#> # A tibble: 166,416 x 26
#>    id    class family genus infraclass infrakingdom infraorder infraphylum
#>    <chr> <chr> <chr>  <chr> <chr>      <chr>        <chr>      <chr>      
#>  1 ITIS… Aves  Strut… Stru… <NA>       Deuterostom… <NA>       Gnathostom…
#>  2 ITIS… Aves  Strut… Stru… <NA>       Deuterostom… <NA>       Gnathostom…
#>  3 ITIS… Aves  Strut… Stru… <NA>       Deuterostom… <NA>       Gnathostom…
#>  4 ITIS… Aves  Strut… Stru… <NA>       Deuterostom… <NA>       Gnathostom…
#>  5 ITIS… Aves  Rheid… Rhea  <NA>       Deuterostom… <NA>       Gnathostom…
#>  6 ITIS… Aves  Rheid… Rhea  <NA>       Deuterostom… <NA>       Gnathostom…
#>  7 ITIS… Aves  Rheid… Rhea  <NA>       Deuterostom… <NA>       Gnathostom…
#>  8 ITIS… Aves  Rheid… Rhea  <NA>       Deuterostom… <NA>       Gnathostom…
#>  9 ITIS… Aves  Droma… Drom… <NA>       Deuterostom… <NA>       Gnathostom…
#> 10 ITIS… Aves  Droma… Drom… <NA>       Deuterostom… <NA>       Gnathostom…
#> # ... with 166,406 more rows, and 18 more variables: kingdom <chr>,
#> #   order <chr>, phylum <chr>, section <chr>, species <chr>,
#> #   subclass <chr>, subfamily <chr>, subgenus <chr>, subkingdom <chr>,
#> #   suborder <chr>, subphylum <chr>, subsection <chr>, subtribe <chr>,
#> #   superclass <chr>, superfamily <chr>, superorder <chr>,
#> #   superphylum <chr>, tribe <chr>
toc()
#> 1.24 sec elapsed
```

Design sketch/spec for package API:

  - Given vector of taxonomic names, return taxonomic identifiers
  - Given taxonomic identifiers, return heirarchical classification.

(Note that for some authorities, e.g. GBIF and TPL, taxonomic
identifiers are only assigned to species names. So given the name of a
higher-level rank, no id could be returned)

  - Given any higher-order rank name (e.g. `infraorder`) return
    identifiers of all member species.

  - Given common names, resolve to accepted scientific name

  - Resolve any known miss-spelling, recognized synonymous name, generic
    name or name-part to corresponding taxonomic name.

  - Map between identifiers

  - Normalize rank names

  - Resolve a list of names across multiple authorities to attain higher
    coverage,

  - provide merged tables

See [schema.md](schema.md) for a sketch of the underlying database
architecture imposed on the data source from each authority.

Note that all inputs and outputs should be vectorized.
