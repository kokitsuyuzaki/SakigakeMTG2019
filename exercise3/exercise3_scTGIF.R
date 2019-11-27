#############################################
################## scTGIF ###################
#############################################
# パッケージロード
library("scTGIF")
library("SingleCellExperiment")
library("GSEABase")
library("msigdbr")

# 以下は
# example("reportTGIF")
# の実行することと同じ

# テストデータ
data("DistalLungEpithelium") # 発現量行列
data("label.DistalLungEpithelium") # 細胞型ラベル
data("pca.DistalLungEpithelium") # PCAの二次元座標

par(ask=FALSE)
plot(pca.DistalLungEpithelium, col=label.DistalLungEpithelium,
	pch=16, main="Distal lung epithelium dataset",
	xlab="PCA1", ylab="PCA2", bty="n")
text(0.1, 0.05, "AT1", col="#FF7F00", cex=2)
text(0.07, -0.15, "AT2", col="#E41A1C", cex=2)
text(0.13, -0.04, "BP", col="#A65628", cex=2)
text(0.125, -0.15, "Clara", col="#377EB8", cex=2)
text(0.09, -0.2, "Cilliated", col="#4DAF4A", cex=2)

# Load the gmt file from MSigDB
# Only "Entrez Gene ID" can be used in scTGIF
# e.g. gmt <- GSEABase::getGmt(
#     "/PATH/YOU/SAVED/THE/GMTFILES/h.all.v6.0.entrez.gmt")
# Here we use msigdbr to retrieve mouse gene sets

# Mouse遺伝子セット (NCBI GeneID)
m_df <- msigdbr(species = "Mus musculus",
	category = "H")[, c("gs_name", "entrez_gene")]

# GeneSetCollectionに変換
hallmark = unique(m_df$gs_name)
gsc <- lapply(hallmark, function(h){
    target = which(m_df$gs_name == h)
    geneIds = unique(as.character(m_df$entrez_gene[target]))
    GeneSet(setName=h, geneIds)
})
gmt <- GeneSetCollection(gsc)

# SingleCellExperimentオブジェクト
sce <- SingleCellExperiment(
    assays = list(counts = DistalLungEpithelium))
reducedDims(sce) <- SimpleList(PCA=pca.DistalLungEpithelium)

# ユーザー独自の正規化関数（オプション）
CPMED <- function(input){
    libsize <- colSums(input)
    median(libsize) * t(t(input) / libsize)
}

# 正規化（オプション）
normcounts(sce) <- log10(CPMED(counts(sce)) + 1)

# 設定（関係する情報がmetadata(sce)に登録される
sce2 <- settingTGIF(sce, gmt, reducedDimNames="PCA",
    assayNames="normcounts")

# 行列同時分解
sce2 <- calcTGIF(sce2, rank=7)

# HTMLレポート出力（ネットに繋がっている必要有り）
reportTGIF(sce2,
    html.open=TRUE,
    title="scTGIF Report for DistalLungEpithelium dataset",
    author="Koki Tsuyuzaki")