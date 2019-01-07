#
# .R/.Rprofile
#

message("\n*** Loading user .Rprofile (~/.Rprofile) ***\n")

# package sync on Dropbox
.libPaths("/Users/ytamai/Dropbox/.R/library")

#
# 主に以下を参考
# https://github.com/heavywatal/rwtl/blob/master/.R/.Rprofile
# https://gist.github.com/amano41/4173965


# Disable annoying X11 popup
options(menu.graphics=FALSE)

# # Choose server
# options(download.file.method = "libcurl")
# options(repos=c(CRAN="https://cloud.r-project.org/"))
options(repos=list(CRAN="https://cran.rstudio.com/"));

# Show more warnings
options(warn=1,
        warnPartialMatchArgs=FALSE,
        warnPartialMatchAttr=TRUE,
        warnPartialMatchDollar=TRUE)

# 起動時にロードするパッケージを追加
# library(tidyverse)と記載すると後からdefaultPackagesが読み込まれるのでパスが上書きされる
options(defaultPackages = c(getOption("defaultPackages"), "tidyverse"))

# Show a summary of the call stack
options(showWarnCalls=TRUE, showErrorCalls=TRUE)

# Maximum number of rows to print(tbl_df)
options(tibble.print_max=30L)

# Number of rows to print(tbl_df) if exceeded the maximum
options(tibble.print_min=30L)

# Suppress annoying function
options(readr.num_columns=0L)

# print numeric values in fixed: default scipen=0
options(scipen=100)

# 
# Font
# 

# Mac OS X 環境では Quartz 描画をデフォルトに設定
if(capabilities("aqua")) {
  options(device="quartz");
}

## グラフィックスデバイスにフォント設定フックを追加
setHook(packageEvent("grDevices", "onLoad"), function(...) {
  
  ## Windows 環境のフォント設定
  if (.Platform$OS.type == "windows") {
    
    ## フォントデータベースはデフォルトのまま
    grDevices::windowsFonts(
      serif = grDevices::windowsFont("TT Times New Roman"),
      sans  = grDevices::windowsFont("TT Arial"),
      mono  = grDevices::windowsFont("TT Courier New")
    );
    
    ## フォントデータベースに明朝体とゴシック体を追加
    grDevices::windowsFonts(
      mincho = grDevices::windowsFont("TT MS Mincho"),
      gothic = grDevices::windowsFont("TT MS Gothic")
    );
    grDevices::postscriptFonts(
      mincho = grDevices::postscriptFonts()$Japan1,
      gothic = grDevices::postscriptFonts()$Japan1GothicBBB
    );
    grDevices::pdfFonts(
      mincho = grDevices::pdfFonts()$Japan1,
      gothic = grDevices::pdfFonts()$Japan1GothicBBB
    );
  }
  
  ## Mac OS X 環境のフォント設定
  if (capabilities("aqua")) {
    grDevices::quartzFonts(
      serif = grDevices::quartzFont(c("Hiragino Mincho Pro W3",
                                      "Hiragino Mincho Pro W6",
                                      "Hiragino Mincho Pro W3",
                                      "Hiragino Mincho Pro W6")),
      sans  = grDevices::quartzFont(c("Hiragino Kaku Gothic Pro W3",
                                      "Hiragino Kaku Gothic Pro W6",
                                      "Hiragino Kaku Gothic Pro W3",
                                      "Hiragino Kaku Gothic Pro W6"))
    );
  }
  

# 以下の「capabilities("X11")」があるとmacOSでXQuartzが起動してしまう

#   ## Linux 環境のフォント設定
#   if (capabilities("X11")) {
#     grDevices::X11.options(fonts=c(
#       "-kochi-gothic-%s-%s-*-*-%d-*-*-*-*-*-*-*",
#       "-adobe-symbol-medium-r-*-*-%d-*-*-*-*-*-*-*"));
#   }
  
  ## PostScript と PDF のフォント設定
  ## family="" で描画した文字列に使われる
  grDevices::ps.options (family="Japan1GothicBBB");
  grDevices::pdf.options(family="Japan1GothicBBB");
  
});

## 日本語を設定するための環境を作成
attach(NULL, name="JapanEnv");

## フォントを設定するフック関数を定義
assign("familyset_hook", function() {
  winfontdevs = c("windows", "win.metafile", "png",
                  "bmp", "jpeg", "tiff", "RStudioGD");
  macfontdevs = c("quartz", "quartz_off_screen", "RStudioGD");
  devname = strsplit(names(dev.cur()), ":")[[1L]][1];
  if ((.Platform$OS.type == "windows") && (devname %in% winfontdevs)) {
    par(family="gothic");
  }
  if (capabilities("aqua") && (devname %in% macfontdevs)) {
    par(family="sans");
  }
}, pos="JapanEnv");

## 作図関数にフォント設定フックを追加
setHook("plot.new", get("familyset_hook", pos="JapanEnv"));
setHook("persp",    get("familyset_hook", pos="JapanEnv"));


## ggplot2でのフォント設定
ggplot2::theme_set(ggplot2::theme_bw(base_family="sans"))
# デフォルトのtheme_bwだけに設定している

## ggplot2の色設定
options(ggplot2.continuous.colour = "viridis",
        ggplot2.continuous.fill = "viridis")

## ggpubrでのフォント設定
# ggXXX(..., ..., font.family = "sans")
# で個別対応か。

# # Font（オリジナル）→うまくいかないので諦めて手動設定に
# setHook(packageEvent("grDevices", "onLoad"), function(...) {
#     grDevices::pdfFonts(
#         serif= grDevices::pdfFonts()$Palatino,
#         mincho= grDevices::pdfFonts()$Japan1,
#         gothic= grDevices::pdfFonts()$Japan1GothicBBB
#     )
#     grDevices::pdf.options(family="serif")
#     if (capabilities("aqua")) {
#         .styles = c('', ' Bold', ' Italic', ' Bold Italic')
#         grDevices::quartzFonts(
#             serif=  grDevices::quartzFont(
#                     paste0('Noto Serif', .styles)),
#             sans=   grDevices::quartzFont(
#                     paste0('Source Sans Pro', .styles)),
#             mono=   grDevices::quartzFont(
#                     paste0('Ubuntu Mono', .styles)),
#             mincho= grDevices::quartzFont(
#                     paste0("Hiragino Mincho ProN W", c(3, 6, 3, 6))),
#             gothic= grDevices::quartzFont(
#                     paste0("Hiragino Kaku Gothic ProN W", c(3, 6, 3, 6)))
#         )
#         grDevices::quartz.options(family='sans')  # does not work
#         attach(NULL, name="QuartzEnv")
#         assign("set_family", function() {
#             if (names(dev.cur()) == "quartz") {par(family="sans")}
#         }, pos="QuartzEnv")
#         setHook("plot.new", get("set_family", pos="QuartzEnv"))
#     }
# })
# 
# setHook(packageEvent("extrafont", "attach"), function(...) {
#     if (is.null(extrafont::fonts())) {return(invisible())}
#     tryCatch({
#         grDevices::pdfFonts(
#           sans= grDevices::pdfFonts()$`Source Sans Pro`,
#           mono= grDevices::pdfFonts()$`Ubuntu Mono`)
#     }, error=warning)
# })
# 


#
# Record sessionInfo automatically
#

# https://rviews.rstudio.com/2017/04/19/r-for-enterprise-understanding-r-s-startup/
# Reproducibility is a critical part of any analysis done in R. One challenge for reproducible scripts and documents is tracking the version of R packages used during an analysis.
# The following code can be added to a .Rprofile file within an RStudio project to automatically log the sessionInfo() after every RStudio session.
# This log could be referenced if an analysis needs to be run at a later date and fails due to a package discrepancy.

.Last <- function(){
  if (interactive()) {
    
    ## check to see if we're in an RStudio project (requires the rstudioapi package)
    if (!requireNamespace("rstudioapi"))
      return(NULL)
    pth <- rstudioapi::getActiveProject()
    if (is.null(pth))
      return(NULL)
    
    ## append date + sessionInfo to a file called sessionInfoLog
    cat("Recording session info into the project's sesionInfoLog file...")
    info <-  capture.output(sessionInfo())
    info <- paste("\n----------------------------------------------",
                  paste0('Session Info for ', Sys.time()),
                  paste(info, collapse = "\n"),
                  sep  = "\n")
    f <- file.path(pth, "sessionInfoLog")
    cat(info, file = f, append = TRUE)
  }
}

message("\n*** Successfully loaded user .Rprofile ***\n")

# source projectdir/.Rprofile
if (Sys.getenv("R_USER") != getwd()) {
  if (file.exists(paste0(getwd(), "/.Rprofile"))) {
    source(paste0(getwd(), "/.Rprofile"))
  }
}


