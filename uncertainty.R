#TODO: move to github
#TODO: format as knitr
rm(list = ls())
ls()
detach()
lapply(c("ggplot2", "psych", "RCurl"), library, character.only=T)
setwd("/Users/rpietro/Google Drive/")
options(RCurlOptions = list(capath = system.file("CurlSSL", "cacert.pem", package = "RCurl"), ssl.verifypeer = FALSE))
uncertainty.data <- getURL("https://docs.google.com/spreadsheet/pub?key=0Apzq-MEcBqz4dHptaG1TR0FZR2tjUUozRjUxSDRvZGc&single=true&gid=0&output=csv")
read.csv(textConnection(uncertainty.data))
#uncertainty.data <- read.table("uncertainty/uncertainty.csv", header=TRUE, sep = ",")
names(uncertainty.data)


#checking data set as a whole
attach(uncertainty.data)
# str (uncertainty.data)
# head(uncertainty.data)
# class(NumberWordsInTitle)

#data conversion
#TODO: below has to deal with using as.numeric(as.character(
# articleYear<-as.numeric(articleYear)
# NumberWordsInArticle <- as.numeric(NumberWordsInArticle)
# describe.by(NumberWordsInArticle)
# NumberWordsInTitle <- as.numeric(NumberWordsInTitle)

#plots
#TODO: below has to handle with a function
jpeg("uncertainty/NumberWordsInTitle.jpg")
qplot (as.numeric(as.character(articleYear)), as.numeric(as.character(NumberWordsInTitle)), geom = c("point", "smooth"), span = 0.2, main="Number of words in the title over time", xlab="Years", ylab="Number of words in the title")
dev.off()

jpeg("uncertainty/NumberWordsInArticle.jpg")
qplot (as.numeric(as.character(articleYear)), main="Number of words in the article over time", xlab="Years", ylab="Number of words in the article", as.numeric(as.character(NumberWordsInArticle)), geom = c("point", "smooth"), span = 0.2)
dev.off()

jpeg("uncertainty/TitleVsArticle.jpg")
qplot (as.numeric(as.character(NumberWordsInTitle)), as.numeric(as.character(NumberWordsInArticle)), geom = c("point", "smooth"), span = 0.2, main="Number of words in the article vs. title", xlab="Number of words in the title", ylab="Number of words in the article")
dev.off()

jpeg("uncertainty/TOTLexicalPACLIsInArticleVerbsButNotModalVerbs.jpg")
qplot (as.numeric(as.character(articleYear)), as.numeric(as.character(TOTLexicalPACLIsInArticleVerbsButNotModalVerbs)), geom = c("point", "smooth"), span = 0.2, main="Number of lexical PACLIs in the article over time, including verbs but not modal verbs", xlab="Years", ylab="Number of words in the article")
dev.off()

jpeg("uncertainty/TOTLexicalPACLIsInArticleVerbsButNotModalVerbs.jpg")
qplot (as.numeric(as.character(articleYear)), as.numeric(as.character(TOTLexicalPACLIsInArticleVerbsButNotModalVerbs)), geom = c("point", "smooth"), span = 0.2)
dev.off()

jpeg("uncertainty/TOTLexicalPACLIsinArticleNonVerbs.jpg")
qplot (as.numeric(as.character(articleYear)), as.numeric(as.character(TOTLexicalPACLIsinArticleNonVerbs)), geom = c("point", "smooth"), span = 0.2)
dev.off()

jpeg("uncertainty/TOTLexicalPACLIsModalVerbs.jpg")
qplot (as.numeric(as.character(articleYear)), as.numeric(as.character(TOTLexicalPACLIsModalVerbs)), geom = c("point", "smooth"), span = 0.2)
dev.off()

jpeg("uncertainty/TOTMorpho.syntacticPACLIsInArticleConditionalMood.jpg")
qplot (as.numeric(as.character(articleYear)), as.numeric(as.character(TOTMorpho.syntacticPACLIsInArticleConditionalMood)), geom = c("point", "smooth"), span = 0.2)
dev.off()

jpeg("uncertainty/TOTMorpho.syntacticPACLIsInArticleIfAsIfWhether.jpg")
qplot (as.numeric(as.character(articleYear)), as.numeric(as.character(TOTMorpho.syntacticPACLIsInArticleIfAsIfWhether)), geom = c("point", "smooth"), span = 0.2)
dev.off()

#main variables of interest: articleType, articleYear, NumberWordsInTitle, NumberWordsInArticle, TOTLexicalPACLIsInArticleVerbsButNotModalVerbs, TOTLexicalPACLIsinArticleNonVerbs, TOTLexicalPACLIsModalVerbs, TOTMorpho.syntacticPACLIsInArticleConditionalMood, TOTMorpho.syntacticPACLIsInArticleIfAsIfWhether


#detach(uncertainty.data)

#write.table(uncertainty.data, file="/Users/rpietro/Desktop/uncertaintyData2.csv")