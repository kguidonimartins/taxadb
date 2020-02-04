library(arrow)

uri <- "https://github.com/boettiger-lab/taxadb-cache/releases/download/2019/2019.2fdwc_col.tsv.bz2"
curl::curl_download(uri, "col.tsv.bz2")
col <- vroom::vroom("col.tsv.bz2")

## Fails
arrow::write_parquet(col, "col.parquet")

#R.utils::bunzip2("col.tsv.bz2")
## Fails to read either compressed or uncompressed data
##col <- arrow::read_tsv_arrow("col.tsv")

library(nycflights13)
arrow::write_parquet(flights, "flights.parquet")
#
