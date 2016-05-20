#' Prints a clean version of a budget item
#'
#' \code{print.item} prints a clean version of a budget item.
#'
#' @param x A budget item.
#' @export

print.item <- function(x) {
    writeLines("budget item")
    print(x$df, row.names=FALSE)
    invisible(NULL)
}