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

### 3. Python言語、pip、Jupyterのインストール（任意）

講習資料は[Jupyter Notebook](https://jupyter.org)でも実装してあります

[実行方法3](https://github.com/kokitsuyuzaki/SakigakeMTG2019#実行方法3-jupyter-notebook)のように、手元の計算機で実行したい場合は、jupyterコマンドのインストールが必要です

JupyterはPythonパッケージの一つです

Pythonの言語のインストールには、以下のページなどを参考にしてください

https://www.python.jp/install/install.html

https://techacademy.jp/magazine/15571

コマンドライン環境（Mac: ターミナル、Windows: コマンドプロンプト）で、以下を実行することで、pipコマンド経由でjupyterをインストールすることができます

```bash
python3 --version # 3.7.5以上のPythonがインストールできていることを確認
pip3 --version # 19.3.1以上のpipコマンドがインストールできていることを確認
pip3 install jupyter
```

もし上記の手順で、インストールがうまくいかなかった場合は、[Google Colaboratory](https://colab.research.google.com/notebooks/welcome.ipynb?hl=ja)でオンラインでJupyter Notebookの動作を確認できる環境も用意しているので、当日はこちらをご確認ください

[Exercise1: Rの基本操作](https://colab.research.google.com/github/kokitsuyuzaki/SakigakeMTG2019/blob/master/exercise1/exercise1_Rintro.ipynb)

[Exercise2: scTensorのデモ](https://colab.research.google.com/github/kokitsuyuzaki/SakigakeMTG2019/blob/master/exercise2/exercise2_scTensor.ipynb)

[Exercise3: scTGIFのデモ](https://colab.research.google.com/github/kokitsuyuzaki/SakigakeMTG2019/blob/master/exercise3/exercise3_scTGIF.ipynb)

## 実行方法1: Rのコンソール画面

R言語を起動後に、Rのコンソール画面で以下のプログラムをコピー&ペーストしてください

```R
download.file("https://github.com/kokitsuyuzaki/SakigakeMTG2019/archive/master.zip",
    "SakigakeMTG2019.zip")
unzip("SakigakeMTG2019.zip")
setwd("SakigakeMTG2019-master")
source("exercise1/exercise1_Rintro.R") # Exercise1: Rの基本操作
source("exercise2/exercise2_scTensor.R") # Exercise2: scTensorのデモ
source("exercise3/exercise3_scTGIF.R") # Exercise3: scTGIFのデモ
```


## 実行方法2: コマンドライン

コマンドライン環境（Mac: ターミナル、Windows: コマンドプロンプト）で以下のように実行してください

```bash
git clone https://github.com/kokitsuyuzaki/SakigakeMTG2019
cd SakigakeMTG2019
Rscript exercise1/exercise1_Rintro.R # Exercise1: Rの基本操作
Rscript exercise2/exercise2_scTensor.R # Exercise2: scTensorのデモ
Rscript exercise3/exercise3_scTGIF.R # Exercise3: scTGIFのデモ
```


## 実行方法3: Jupyter Notebook

[事前準備3](https://github.com/kokitsuyuzaki/SakigakeMTG2019#3-python言語pipjupyterのインストール任意)の段階で、jupyterコマンドが事前にインストールされている場合にのみできるやり方です

```bash
git clone https://github.com/kokitsuyuzaki/SakigakeMTG2019
cd SakigakeMTG2019
jupyter notebook exercise1/exercise1_Rintro.ipynb # Exercise1: Rの基本操作
jupyter notebook exercise2/exercise2_scTensor.ipynb # Exercise2: scTensorのデモ
jupyter notebook exercise3/exercise3_scTGIF.ipynb # Exercise3: scTGIFのデモ
```