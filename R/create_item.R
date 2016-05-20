#' Creates a budget item
#'
#' \code{create_item} returns a budget item.
#'
#' @param name A name describing the budget item.
#' @param amount The amount associated with the budget item.
#' @param day The day associated with the budget item.  See Details for more information.
#' @param recurring Whether or not the budget item is recurring.
#' @return The output of \code{create_item} is a budget item.
#' @export
#' @examples
#' #####
#' # Common use cases
#' #
#'
#' # I need to pay my rent!
#' rent <- create_item( name = "Rent"
#'                    , amount = -800
#'                    , day = 1
#'                    , recurring = TRUE
#'                    )
#' rent

create_item <- function(name, amount, day, recurring) {
    # Check name
    if (missing(name)) {
        stop("Please provide a name for the budget item", call.=FALSE)
    } else if (length(name) != 1) {
        stop("name must be a single value", call.=FALSE)
    } else if (!is.character(name)) {
        name <- as.character(name)
    }

    # Check amount
    if (missing(amount)) {
        stop("Please provide an amount for the budget item", call.=FALSE)
    } else if (length(amount) != 1) {
        stop("amount must be a single value", call.=FALSE)
    } else if (!is.numeric(amount)) {
        stop("amount must be a numeric value", call.=FALSE)
    }

    # Check day
    if (missing(day)) {
        stop("Please provide a day for the budget item", call.=FALSE)
    } else if (length(day) != 1) {
        stop("day must be a single value", call.=FALSE)
    } else if (!is.character(day)) {
        day <- as.character(day)
    }

    # Check recurring
    if (missing(recurring)) {
        stop("Please note whether the budget item is recurring", call.=FALSE)
    } else if (length(recurring) != 1) {
        stop("recurring must be a single value", call.=FALSE)
    } else if (! recurring %in% c(TRUE, FALSE)) {
        stop("recurring must be TRUE or FALSE", call.=FALSE)
    }

    # Create item
    item_df <- data.frame( name = name
                         , amount = amount
                         , day = day
                         , recurring = recurring
                         , stringsAsFactors=FALSE
                         )
    item <- list(df = item_df)

    # Objectify!
    class(item) <- c("item", "list")
    item
}