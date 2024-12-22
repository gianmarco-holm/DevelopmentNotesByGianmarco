#-------------- Crear tabla de Cosechas ----------

setwd("D:/CrediScoring/2 Analisis de Cosechas")

library(readxl)
library(tidyverse)
library(hrbrthemes)
t = read_excel("Atrasos.xlsx", sheet = "t")
t_1 = read_excel("Atrasos.xlsx", sheet = "t+1") 
t_2 = read_excel("Atrasos.xlsx", sheet = "t+2")
t_3 = read_excel("Atrasos.xlsx", sheet = "t+3")
t_4 = read_excel("Atrasos.xlsx", sheet = "t+4")
t_5 = read_excel("Atrasos.xlsx", sheet = "t+5")
t_6 = read_excel("Atrasos.xlsx", sheet = "t+6")
t_7 = read_excel("Atrasos.xlsx", sheet = "t+7")
t_8 = read_excel("Atrasos.xlsx", sheet = "t+8")
t_9 = read_excel("Atrasos.xlsx", sheet = "t+9")
t_10 = read_excel("Atrasos.xlsx", sheet = "t+10")
t_11 = read_excel("Atrasos.xlsx", sheet = "t+11")
t_12 = read_excel("Atrasos.xlsx", sheet = "t+12")


#unimos las bases
cosecha  = t %>% 
  left_join(select(t_1,ID,AtrasoFeb23, SaldoFeb23), by = "ID") %>% 
  left_join(select(t_2,ID,AtrasoMar23,SaldoMar23), by = "ID") %>% 
  left_join(select(t_3,ID,AtrasoAbr23,SaldoAbr23), by = "ID") %>% 
  left_join(select(t_4,ID,AtrasoMay23,SaldoMay23), by = "ID") %>% 
  left_join(select(t_5,ID,AtrasoJun23,SaldoJun23), by = "ID") %>% 
  left_join(select(t_6,ID,AtrasoJul23,SaldoJul23), by = "ID") %>% 
  left_join(select(t_7,ID,AtrasoAgo23,SaldoAgo23), by = "ID") %>% 
  left_join(select(t_8,ID,AtrasoSep23,SaldoSep23), by = "ID") %>% 
  left_join(select(t_9,ID,AtrasoOct23,SaldoOct23), by = "ID") %>% 
  left_join(select(t_10,ID,AtrasoNov23,SaldoNov23), by = "ID") %>% 
  left_join(select(t_11,ID,AtrasoDic23,SaldoDic23), by = "ID") %>% 
  left_join(select(t_12,ID,AtrasoEne24,SaldoEne24), by = "ID")



#Calculando el deterioro

cosecha = cosecha %>% 
  mutate(mora1 = ifelse(AtrasoFeb23>=30, SaldoFeb23,0),
         mora2 = ifelse(AtrasoMar23>=30, SaldoMar23,0),
         mora3 = ifelse(AtrasoAbr23>=30, SaldoAbr23,0),
         mora4 = ifelse(AtrasoMay23>=30, SaldoMay23,0),
         mora5 = ifelse(AtrasoJun23>=30, SaldoJun23,0),
         mora6 = ifelse(AtrasoJul23>=30, SaldoJul23,0),
         mora7 = ifelse(AtrasoAgo23>=30, SaldoAgo23,0),
         mora8 = ifelse(AtrasoSep23>=30, SaldoSep23,0),
         mora9 = ifelse(AtrasoOct23>=30, SaldoOct23,0),
         mora10 = ifelse(AtrasoNov23>=30, SaldoNov23,0),
         mora11 = ifelse(AtrasoDic23>=30, SaldoDic23,0),
         mora12 = ifelse(AtrasoEne24>=30, SaldoEne24,0))


         
#-------- Estimacion de la PD --------

cosecha = cosecha %>% 
  mutate(Atraso_Maximo = pmax(AtrasoFeb23, AtrasoMar23, AtrasoAbr23, 
                              AtrasoMay23, AtrasoJun23, AtrasoJul23,
                              AtrasoAgo23, AtrasoSep23, AtrasoOct23, 
                              AtrasoNov23, AtrasoDic23, AtrasoEne24, na.rm = T ),
         Default = ifelse(Atraso_Maximo>=30,1,0))


(PD_total = mean(cosecha$Default))

cosecha %>% 
  group_by(Agencia) %>% 
  summarise(casos = n(),
            PD = sum(Default, na.rm = T)/casos) %>% 
  ggplot(aes(x = Agencia, y = PD))+
  geom_col(aes(fill = Agencia))+
  theme_ipsum()+
  geom_hline(yintercept = PD_total )








