#' Conversion of pixel into millimeter
#'
#' @param x variable expressed in pixel
#' @param pix_conv conversion variable (0.01058).
#'
#' @return converted variable
#' @export
#'
#' @examples
#' 
#' pix-to_mm(x = 10, pix_conv = 0.01058)
#' 
#' 
pix_to_mm <- function(x, pix_conv = 0.01058){
  x <- x * pix_conv
}
