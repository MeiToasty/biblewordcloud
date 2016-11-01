#Plotting Wordcloud written in R
#Just for fun no religious behind thoughts

# Plot the wordcloud

#install Packages before use
library(RColorBrewer)

library(wordcloud)

library(SnowballC)

library(NLP)

library(tm)

?wordcloud

#change your working directory
singleString <- paste(readLines("bibel.txt"), collapse=" ")


#Removing some unecessary Chars 
singleString <- gsub("\\n", "", singleString)

singleString <- gsub("[0-9]+", "", singleString)

singleString <- gsub(":", "", singleString)

singleString <- gsub(",", "", singleString)

singleString <- gsub("\"", "", singleString)


#Wrap to Corpus
bible <- Corpus(VectorSource(singleString))


#Remove some more words
bible <- tm_map(bible, PlainTextDocument)

bible <- tm_map(bible, stemDocument, language = "german")

bible <- tm_map(bible, removeWords, stopwords("german"))

bible <- tm_map(bible, removeWords,c("und", "dass",","))


#Plot wordcloud
wordcloud(bible, max.words = 15, random.order = FALSE,
          colors = brewer.pal(11, "Spectral"))


