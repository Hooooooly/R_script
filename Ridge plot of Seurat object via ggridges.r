## get gene expression from Seurat object
## via function FetchData, where features 
## correspond to i.e genes you wanna examine,
## slot corresponds to the data type you wanna
## get, FetchData returns a dataframe
data <- FetchData(object = object, vars = features, slot = data)

features <- colnames(x = data) # get gene names
cells <- colnames(x = object) # cell identity

# extract genes expression of cell indentity of interest
# which would downsample the data if cell identity is set
data <- data[cells, , drop = FALSE] 

# extract group/condition info of each cell
# using cell identity as index, here are 2 
# groups in total
idents <- object[["group", drop = TRUE]][cells]

# if idents is not factor
# idents <- factor(x = idents)

# extract genes expression of features(genes) of interest
data = data[, features, drop = FALSE]

# ridge plot via ggridges
library(ggridges)
ggplot(data, aes(x = data[, "Sparcl1"], y = idents)) +
  geom_density_ridges(aes(fill = idents)) +
  scale_fill_manual(values = c("#00AFBB", "#E7B800"))
