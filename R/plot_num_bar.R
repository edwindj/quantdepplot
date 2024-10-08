#' @import ggplot2
plot_num_bar <- function(data, name, fill = "#555555", type=c("median", "mean")){
  bin <- data$bin
  f <- data$f
  # CRAN checks
  med <- NULL

  mapping <- aes(x = f, y = med)
  if (match.arg(type) == "mean"){
    mapping <- aes(x = f, y = mean)
  }

  width <- resolution(f) * 1.0

  ggplot(data, mapping = mapping) +
    geom_col(fill=fill, width = width) +
    labs(y = name) +
    scale_y_continuous(position = "right") +
    coord_flip() +
    theme_minimal()
}


#
#
# pp <- qbin(iris, "Sepal.Length", 75)
#
# n <- pp$num_cols[1]
# d <- pp$data[[n]]
#
# plot_num(d,n)
#
#
# n <- pp$cat_cols[1]
# d <- pp$data[[n]]
# plot_cat(d, n)
#
#
# pn <- lapply(pp$num_cols, function(n){
#   d <- pp$data[[n]]
#   plot_num(d, n)
# })
#
# pc <- lapply(pp$cat_cols, function(n){
#   d <- pp$data[[n]]
#   plot_cat(d, n)
# })
#
# library(patchwork)
# p2 <- Reduce(`+`, pn) + Reduce(`+`, pc)
# p2 + plot_layout(ncol = 5)
#
# p2 <- pn[[1]]
# for (p in pn[-1]){
#   p2 <- p2 + p
# }
