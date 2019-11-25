# SakigakeMTG2019

JSTさきがけ[多細胞]領域会議内のR講習会「Rでできる細胞間相互作用」で使用したソースコード


## 事前準備
### 1. R言語のインストール

[Rのウェブサイト](https://cran.ism.ac.jp)にアクセスして、各OS（例: Windows, Mac OS X)ごとにコンパイル済みのRをダウンロード&インストールしてください（2019/11/25現在で、最新版のRは3.6.1です）


### 2. Rパッケージのインストール

Rを起動し、Rのコンソール画面で以下のプログラムをコピー&ペーストしてください

```R
# CRAN
install.packages(c("BiocManager", "remotes", "IRdisplay"),
	repos="https://cran.ism.ac.jp/")

# Bioconductor
BiocManager::install(c("SingleCellExperiment", "LRBase.Hsa.eg.db",
	"MeSH.Hsa.eg.db", "GSEABase", "msigdbr"), suppressUpdates=TRUE)

# GitHub
remotes::install_github("rikenbit/scTensor")
remotes::install_github("rikenbit/scTGIF")
```

RやRパッケージがうまくインストールできなった場合は、[Google Colaboratory](https://colab.research.google.com/notebooks/welcome.ipynb?hl=ja)でオンラインで動作確認できる環境も用意しているので、こちらをご確認ください

[Exercise1: Rの基本操作](https://colab.research.google.com/github/kokitsuyuzaki/SakigakeMTG2019/blob/master/exercise1/exercise1_Rintro.ipynb)

[Exercise2: scTensorのデモ](https://colab.research.google.com/github/kokitsuyuzaki/SakigakeMTG2019/blob/master/exercise2/exercise2_scTensor.ipynb)

[Exercise3: scTGIFのデモ](https://colab.research.google.com/github/kokitsuyuzaki/SakigakeMTG2019/blob/master/exercise3/exercise3_scTGIF.ipynb)

## Exercise1: Rの基本操作

コマンドライン環境（Mac: ターミナル、Windows: コマンドプロンプト）で以下のように実行してください

```bash
Rscript exercise1/exercise1_Rintro.R
```

または、R言語を起動後に、Rのコンソール画面で以下のプログラムをコピー&ペーストしてください

```R
source("exercise1/exercise1_Rintro.R")
```


## Exercise2: scTensorのデモ

コマンドライン環境（Mac: ターミナル、Windows: コマンドプロンプト）で以下のように実行してください

```bash
Rscript exercise2/exercise2_scTensor.R
```

または、R言語を起動後に、Rのコンソール画面で以下のプログラムをコピー&ペーストしてください

```R
source("exercise2/exercise2_scTensor.R")
```

## Exercise3: scTGIFのデモ（時間が余れば）

コマンドライン環境（Mac: ターミナル、Windows: コマンドプロンプト）で以下のように実行してください

```bash
Rscript exercise3/exercise3_scTGIF.R
```

または、R言語を起動後に、Rのコンソール画面で以下のプログラムをコピー&ペーストしてください

```R
source("exercise3/exercise3_scTGIF.R")
```
