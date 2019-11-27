########################################
############## データ型 #################
########################################

################ 数値 ###################
# 整数と浮動小数点数は全てnumeric
1
is(1)
2.1
is(2.1)

# 四則演算（数字）
1 + 1 # 足し算
3 - 1 # 引き算
6 * 2 # 掛け算
4 / 2 # 割り算
2^5 # 2の5乗
log10(5) # 5の常用対数値

############### 文字列 ###################
# ""や''で囲む
"SAKIGAKE"
is("SAKIGAKE")

is(1) # 1は数値
is("1") # ""で囲むと文字列

try(1 + "1") # 数値と文字列を足すことはできない
paste0("SAKIGAKE", "5") # 文字列同士を連結することはできる
paste0("SAKIGAKE", 5) # paste0関数の仕様で、文字列と数値を連結することはできる

############### 論理値 ###################
TRUE
is(TRUE)
FALSE
is(FALSE)

# 真偽
1 == 1 # これはTRUE（==は同じという意味）
1 == 2 # これはFALSE
"SAKIGAKE" == "SAKIGAKE" # これはTRUE
"SAKIGAKE" == "CREST" # これはFALSE
"SAKIGAKE" != "CREST" # これはTRUE（!=は違うという意味）

################ 因子 ###################
# 同じものが複数
JST <- factor(c("SAKIGAKE", "SAKIGAKE",
	"CREST", "CREST", "CREST",
	"ACT-X", "ACT-X", "ACT-X"))
nlevels(JST) # 3つある
levels(JST) # SAKIGAKE, CREST, ACT-Xがある

############ 型変換（キャスト）#############
as.numeric("12345")
as.character(JST) # 因子を文字列に変換する
as.numeric(JST) # 因子が数値になる？（よくバグの原因になる）
# 参考
# http://cse.naro.affrc.go.jp/takezawa/r-tips/r/25.html



########################################
############# データ構造 #################
########################################

############## ベクトル ##################
# スカラは長さ1のベクトル
is(1)
# c()でベクトルを作成
A <- c(2, 3, 1)
B <- c(-2, 1, -2)
# 各要素へのアクセス, Rは1-origin
A[1]
A[2]
A[3]
A[4] # 要素にないとNAになる
# 最大値、最小値、平均値、中央値
max(A)
min(A)
mean(B)
median(B)
# 要素ごとの掛け算（他の言語と違うところ）
A * B
# ベクトル同士の内積
A %*% B
# 文字例でもベクトル
C <- c("A", "B", "C", "A", "AA")
# Aがどこの場所にあるか
which(C == "A")
# lengthと組み合わせて使うことが多い
length(which(C == "A"))

################ 行列 ###################
# matrix()で行列を作成
E <- matrix(runif(6), nrow=2, ncol=3)
E[1,]
E[,2]
# 行数、列数
nrow(E)
ncol(E)
dim(E)
# cbind、rbind
cbind(A, B)
rbind(E, A, B)
# 行レベルでの和、列レベルでの和・平均値
rowSums(E)
colSums(E)
rowMeans(E)
colMeans(E)

########### データフレーム ###############
# 行列は一つの型しか扱えない
# 複数の型（数値、文字、TRUE/FALSE、因子など）を扱いたいときはデータフレーム
data(iris)
head(iris)
iris$Petal.Length # $で各列にアクセスできる

############### リスト ###################
# 行列で表現できないようなデータもリストで表現できる
G <- list(X = c(1,2,3),
    Y = matrix(runif(9), nrow=3),
    Z = TRUE)
G$X # $で各要素にアクセスできる
G$Y
G$Z

############### 配列 ###################
# 普段はあまり使わないが、3次元以上の行列（例: テンソル）を表現する時などに
H <- array(1:10, dim=c(1,2,3))
H[1,1,3]

############### その他 ###################
str(G)
str(iris)
x <- runif(10)
y <- runif(10)
lr <- lm(y ~ x)
str(lr)
lr$coefficients

################ if-else ################
SAKIGAKE <- "SAKIGAKE"
CREST <- "CREST"
if(SAKIGAKE == CREST){
    print("Same!!!")
}else{
    print("Different...")
}

################## 繰り返し #################
I <- 1:20
for(i in 1:length(I)){
    print(I[i])
}

j <- 1
while(j <= 20){
    print(I[j])
    j <- j + 1
}

# foreachはパッケージをロードすれば使える
# http://qiita.com/hoxo_m/items/04903cbbe9d023f0ed6d


############### function #############
jijou <- function(x){
    if(is.numeric(x)){
        x^2
    }else{
        stop("x is not numeric!!!")
    }
}
jijou(3)
try(jijou("3"))


######## apply関数ファミリー ###########
apply(matrix(1:12, nrow=3), 1, mean)
apply(matrix(1:12, nrow=3), 2, var)
sapply(-3:3, abs)
lapply(list(A=1:3, B=matrix(1:12, nrow=3)), print)

y <- "SAKIGAKE"
sapply(1:5, function(x, y){
    cat(paste0(y, x, "\n"))
}, y=y)


############# ディレクトリ操作 ###########
(d <- getwd()) # ()内の実行と、結果の出力を同時に行う
setwd("../") # 一つ上のディレクトリに移動
getwd()
setwd(d) # 元いたところに戻る
getwd()

############## ファイル操作 ##############
# TSVのI/O
write.table(iris, "iris.txt")
iris.tsv <- read.table("iris.txt")

# CSVのI/O
write.csv(iris, "iris.csv")
iris.csv <- read.csv("iris.csv")

# バイナリデータのI/O
save(iris, file="iris.RData")
load("iris.RData")

# 全オブジェクトのI/O
save.image("20160806_SAKIGAKE.RData")
load("20160806_SAKIGAKE.RData")

############# システム関数 ##############
system("ls", intern=TRUE)  # UNIXコマンドをRから呼び出す
system("whoami", intern=TRUE)  # ユーザー名
system("pwd", intern=TRUE)  # getwd()と同じ
system("Rscript --version", intern=TRUE)  # Rscriptのバージョン
system("rm -rf iris*", intern=TRUE)  # irisから始めるファイルは削除

# 参考
# http://orangain.hatenablog.com/entry/20100916/1284631280
