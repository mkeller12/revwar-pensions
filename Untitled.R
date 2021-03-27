
library(tidyverse)
library(readxl)
pensions <- read_excel(("~/Desktop/Oregon/Publications:Manuscripts/Pensions_Paper/pension-index.xlsx"),
                       skip = 1,
                       col_names = c("name", "index", "timeserved", "injury", "injtype"
                       , "property", "yespension", "1818approve","approveyear", "pensionamt",
                       "revoke1820", "revokerich","revokeprop", "rejectmilitia", "reinstate?", 
                       "reinstyear", "notes"))
summary(pensions)
colnames(pensions)

#making categorical numeric#
pensions$property <- as.numeric(pensions$property)
pensions$pensionamt <- as.numeric(pensions$pensionamt)

#making N/A actually NA#
pensions$injtype [pensions$injtype=="N/A"] <- NA
pensions$approveyear [pensions$approveyear=="N/A"] <- NA
pensions$revoke1820 [pensions$revoke1820=="N/A"] <- NA
pensions$revokerich [pensions$revokerich=="N/A"] <- NA
pensions$revokeprop [pensions$revokeprop=="N/A"] <-NA
pensions$rejectmilitia [pensions$rejectmilitia=="N/A"] <- NA
pensions$`reinstate?`[pensions$`reinstate?`=="N/A"] <- NA
pensions$reinstyear [pensions$reinstyear=="N/A"] <- NA

#making Y/N into binary variables#
pensions$injury <- ifelse(pensions$injury=="Y", 1, 
                          ifelse(pensions$injury=="N", 0, NA))
pensions$yespension <- ifelse(pensions$yespension=="Y", 1, 
                          ifelse(pensions$yespension=="N", 0, NA))
pensions$`1818approve` <- ifelse(pensions$`1818approve`=="Y", 1, 
                          ifelse(pensions$`1818approve`=="N", 0, NA))
pensions$revoke1820 <- ifelse(pensions$revoke1820=="Y", 1, 
                          ifelse(pensions$revoke1820=="N", 0, NA))
pensions$revokerich <- ifelse(pensions$revokerich=="Y", 1, 
                          ifelse(pensions$revokerich=="N", 0, NA))
pensions$revokeprop <- ifelse(pensions$revokeprop=="Y", 1, 
                          ifelse(pensions$revokeprop=="N", 0, NA))
pensions$rejectmilitia <- ifelse(pensions$rejectmilitia=="Y", 1, 
                          ifelse(pensions$rejectmilitia=="N", 0, NA))
pensions$`reinstate?` <- ifelse(pensions$`reinstate?`=="Y", 1, 
                          ifelse(pensions$`reinstate?`=="N", 0, NA))












