##generate hydrophobicity descriptors
library("protr")
sequences = readFASTA("train_set.txt")

#

#PAAC

x2 = t(sapply(sequences, props = c("Hydrophobicity", "Hydrophilicity", "SideChainMass"), lambda = 7, w = 0.05, customprops = NULL, extractPAAC))
x4 <- round(x2, digits=5)
##replace NA in between cells with -99999
x4[is.na(x4)] <- -99999 			
write.table(x4, file='PAAC.tsv', quote=FALSE, sep='\t', col.names = NA)

#CTD, Composition descriptor
x3 = t(sapply(sequences, extractCTDC)) 
x5 <- round(x3, digits=5)
##replace NA in between cells with -99999
x5[is.na(x5)] <- -99999 			
write.table(x5, file='CTDC.tsv', quote=FALSE, sep='\t', col.names = NA)
