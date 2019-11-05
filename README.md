# SakigakeMTG2019
JSTさきがけ[多細胞]領域会議内のR講習会「Rでできる細胞間相互作用」で使用したソースコード

## Step.1: R言語のインストール

[Rのウェブサイト](https://cran.ism.ac.jp)にアクセスして、各OS（例: Windows, Mac OS X)ごとにコンパイル済みのRをダウンロード&インストールしてください。
2019/11/5現在で、最新版のRは3.6.1です。

## Step.2: Rパッケージのインストール

Rを起動し、Rのコンソール画面で以下のプログラムをコピー&ペーストしてください。

```r
# CRAN
install.packages("BiocManager", repos="http://cran.r-project.org")
# Bioconductor
library("BiocManager")
BiocManager::install(c("scTensor", "scTGIF"), update=TRUE, ask=FALSE)
```

## Step.3: scTensorの実行

Rのコンソール画面で以下のプログラムをコピー&ペーストしてください。

```r
source("scTensor.R")
```

## Step.4: scTGIFの実行

Rのコンソール画面で以下のプログラムをコピー&ペーストしてください。

```r
source("scTGIF.R")
```
