# ==========================================
# IndonesiaRaya RStudio View Wrapper
# ==========================================

# intiv() -> opens data in spreadsheet-like viewer
intiv <- function(x) {
  if (interactive()) {
    View(x)
  } else {
    message("intiv() only works in an interactive R session (like RStudio).")
  }
}
