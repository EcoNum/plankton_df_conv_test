#' Standardisatipon of gray level
#'
#' @param x variable expressed between 0 and 255 pixel.
#' @param gs_level conversion variable (255).
#'
#' @return standardised variable
#' @export
#'
#' @examples
#' 
#' grayscale_std(x = 239, gs_level = 255)
#' 
#' 
grayscale_std <- function(x, gs_level = 255){
  x <- x / gs_level
}


#' Conversion of grayscale into D.O.
#'
#' @param x 
#'
#' @return converted variable
#' @export
#'
#' @examples
grayscale_convert <- function(x){
  x <- 1 - x
}
