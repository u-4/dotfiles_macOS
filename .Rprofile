#
# .R/.Rprofile
#
message("\n*** Loading user .Rprofile (~/.Rprofile) ***\n")

# 主に以下を参考
# https://github.com/heavywatal/rwtl/blob/master/.R/.Rprofile
# https://gist.github.com/amano41/4173965

# CRAN repos from rstudio and extra from macos.rbind.org by Yihui Xie
options(repos = c(
  CRAN = 'https://cran.rstudio.com',
  CRANextra = 'https://macos.rbind.org'
))


# Disable annoying X11 popup
options(menu.graphics=FALSE)

# Show more warnings
options(warn=1,
        warnPartialMatchArgs=FALSE,
        warnPartialMatchAttr=TRUE,
        warnPartialMatchDollar=TRUE)

# set .libPaths
if (!dir.exists(file.path("~", ".R_LIBS"))) {
  dir.create(file.path("~", ".R_LIBS"))
}
.libPaths(file.path("~", ".R_LIBS"))

# 起動時にロードするパッケージを追加
# library(tidyverse)と記載すると後からdefaultPackagesが読み込まれるのでパスが上書きされる

local({
  if (!file.exists(file.path(getwd(), "packrat", "init.R"))) {
    original_default <- getOption("defaultPackages")
    pkgs <- c("tidyverse", "magrittr", "viridis")
    pkgs <- pkgs[sapply(pkgs, function(x) {return(ifelse((requireNamespace(x, quietly = TRUE)), TRUE, FALSE))})]
    options(defaultPackages = c(original_default, pkgs))
    # getOption("defaultPackages")
  }
})

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
      serif = grDevices::quartzFont(c("Hiragino Mincho Pro W3", # 標準
                                      "Hiragino Mincho Pro W6", # ボールド
                                      "Hiragino Mincho Pro W3", # イタリック
                                      "Hiragino Mincho Pro W6"  # ボールドイタリック
                                      )),
      sans  = grDevices::quartzFont(c("Hiragino Kaku Gothic Pro W3", # 標準
                                      "Hiragino Kaku Gothic Pro W6", # ボールド
                                      "Hiragino Kaku Gothic Pro W3", # イタリック
                                      "Hiragino Kaku Gothic Pro W6"  # ボールドイタリック
                                      ))
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


#
# ggplot2関連の設定
#

# ggplot2がインストールされていなければ`ggplot2::`系は呼び出さない
if (requireNamespace("ggplot2", quietly = TRUE)) {
  ## ggplot2でのフォント設定
  ggplot2::theme_set(ggplot2::theme_bw(base_family="sans"))

  ## ggplot2の色設定
  options(ggplot2.continuous.colour = "viridis",
          ggplot2.continuous.fill = "viridis")
}

#
# Record sessionInfo automatically
#

# https://rviews.rstudio.com/2017/04/19/r-for-enterprise-understanding-r-s-startup/
# Reproducibility is a critical part of any analysis done in R. One challenge for reproducible scripts and documents is tracking the version of R packages used during an analysis.
# The following code can be added to a .Rprofile file within an RStudio project to automatically log the sessionInfo() after every RStudio session.
# This log could be referenced if an analysis needs to be run at a later date and fails due to a package discrepancy.
# rstudioapiがなくても動くように改造（正確にはない時にエラーなしで処理しないように）
# ただしgetwd()がプロジェクトのルートからは変わらないことを前提にしている……

.Last <- function(){
  if (interactive()) {
    ## check to see if we're in an RStudio project (requires the rstudioapi package)
    if (Sys.getenv("RSTUDIO") != "1") {
      return(NULL)
    }
    if (as.logical(sum(grepl(".Rproj", list.files())))) {
      pth = getwd()
      ## append date + sessionInfo to a file called sessionInfoLog
      cat("Recording session info into the project's sesionInfoLog file...")
      info <- capture.output(sessionInfo())
      info <- paste("\n----------------------------------------------",
                  paste0('Session Info for ', Sys.time()),
                  paste(info, collapse = "\n"),
                  sep  = "\n")
      f <- file.path(pth, "sessionInfoLog")
      cat(info, file = f, append = TRUE)
    }
  }
}

message("\n*** Successfully loaded user .Rprofile ***\n")

# source projectdir/.Rprofile
# R --vanilla returns "" to Sys.getenv("R_USER")
if ((Sys.getenv("R_USER", unset = getwd()) != getwd()) && (file.exists(file.path(getwd(), ".Rprofile")))) {
  source(file.path(getwd(), ".Rprofile"))
}

