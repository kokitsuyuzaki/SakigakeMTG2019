#############################################
################# scTensor ##################
#############################################
# パッケージロード
library("scTensor")
library("SingleCellExperiment")
library("LRBase.Hsa.eg.db")
library("MeSH.Hsa.eg.db")

# 以下は
# example("cellCellReport")
# の実行することと同じ

# テストデータ
data(GermMale) # 発現量行列
data(labelGermMale) # 細胞型ラベル
data(tsneGermMale) # t-SNEの二次元座標

# SingleCellExperimentオブジェクト
sce <- SingleCellExperiment(assays=list(counts = GermMale))
reducedDims(sce) <- SimpleList(TSNE=tsneGermMale$Y)

# ユーザー独自の正規化関数（オプション）
CPMED <- function(input){
    libsize <- colSums(input)
    median(libsize) * t(t(input) / libsize)
}

# 正規化（オプション）
normcounts(sce) <- log10(CPMED(counts(sce)) + 1)

# 設定（関係する情報がmetadata(sce)に登録される
cellCellSetting(sce, LRBase.Hsa.eg.db, labelGermMale, names(labelGermMale))

# ランク推定
rks <- cellCellRanks(sce, assayNames="normcounts")

# CCIテンソル分解
cellCellDecomp(sce, ranks=rks$selected, assayNames="normcounts")

# HTMLレポート出力（ネットに繋がっている必要有り）
cellCellReport(sce, reducedDimNames="TSNE", assayNames="normcounts",
    title="Cell-cell interaction within Germline_Male, GSE86146",
    author="Koki Tsuyuzaki", html.open=TRUE, upper=2,
    goenrich=TRUE, meshenrich=FALSE, reactomeenrich=FALSE,
    doenrich=FALSE, ncgenrich=FALSE, dgnenrich=FALSE)
