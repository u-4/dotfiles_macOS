#'
# .R/.Rprofile
#

# package sync on Dropbox
.libPaths("/Users/ytamai/Dropbox/99_References/90_Sync/R/library")

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

# ## 起動時にロードするパッケージを追加→完全に環境固まったら考えよう
# ## tidyverseとか色々だけど、ある程度明示しないと他人に見せる時に困るし。
# local({
#   pkgs <- getOption("defaultPackages");
#   options(defaultPackages=c(pkgs, "lattice", "car"));
# });

# Show a summary of the call stack
options(showWarnCalls=TRUE, showErrorCalls=TRUE)

# Maximum number of rows to print(tbl_df)
options(tibble.print_max=30L)

# Number of rows to print(tbl_df) if exceeded the maximum
options(tibble.print_min=30L)

# Suppress annoying function
options(readr.num_columns=0L)

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
# .First = function() {
#     if (interactive()) {
#         cran = c('tidyverse', 'devtools', 'extrafont')
#         github = c()
#         options(defaultPackages=c(getOption('defaultPackages'), cran, github))
#         if (.Platform$GUI != 'AQUA' && Sys.getenv('EMACS') == '') {
#             utils::loadhistory(file=Sys.getenv('R_HISTFILE'))
#         }
#         print(utils::sessionInfo(), locale=FALSE)
#         cat(date(), '\n')
#         cat(getwd(), '\n')
#         cat('Loading:', cran, github, '\n')
#     }
# }
# 
# .Last = function() {try({
#     if (interactive()) {
#         if (.Platform$GUI != 'AQUA' && Sys.getenv('EMACS') == '') {
#             utils::savehistory(file=Sys.getenv('R_HISTFILE'))
#         }
#         print(ls(envir=globalenv(), all.names=TRUE))
#         print(utils::sessionInfo(), locale=FALSE)
#     }
# })}
