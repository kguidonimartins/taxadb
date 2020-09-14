
#' @importFrom contentid resolve


td_import <- function(provider = getOption("taxadb_default_provider", "itis"),
                      schema = c("dwc", "common"),
                      version = latest_version()){


  keys <- unlist(lapply(provider, paste, schema, version, sep="-"))
  dict <- c(
         "ncbi-dwc-2019" = "hash://sha256/598c626c6087369d0ed3c49b3c1092435a02df247038989ed12071a1c17a0549",
         "ncbi-common-2019" = "hash://sha256/b42ce79bbebc3224a5e7a288333947b0f2d685fa84347e455a8ee7c03c7a14e0",
         "itis-dwc-2019" = "hash://sha256/9bc29db0ce5e2695727fc5f894ef0681b766ccc9c813071cdd1bc8b4921ec110",
         "itis-common-2019" = "hash://sha256/bc63094c83d8dfa4bffa2c9d0487ff1a95952ad7e8a6eb252fb93e4f1e590fcb",
         "col-dwc-2019" = "hash://sha256/2c5e65f240a23e2fc32240dd3144cdf2d1d0c9dcb5568c467cc3f94772abcb72"
         )

    ids <- dict[keys]

    paths <- vapply(ids, contentid::resolve, "", store=TRUE)

    paths
}
