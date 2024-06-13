library(rmarkdown)
library(tidyverse)

convert_folder <- function(folder) {
  files <- dir(folder, full.names = T)
  files = files[! folder %in% files]
  print(files)
  print('--------------------')

  for (file in files) {
   
    print(file)
    if (dir.exists(file)) {
      convert_folder(file)
    } else {
      if (str_ends(file, "ipynb")) {
          convert_ipynb(input=file, output = xfun::with_ext(file, "Rmd"))
          file.remove(file)
      }
    }
  }
}


convert_folder(getwd())

