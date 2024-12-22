#----------------------------------------------------------------------
#                    MODELO CREDIT - SCORING
#             Edward Cruz (Economia con Manzanitas)
#----------------------------------------------------------------------

# --------------- IMPORTANDO DATOS ---------------
print("Hola, mundo desde R en VS Code!")

setwd(getwd())
install.packages("tidyverse")
library(readr)
library(tidyverse)
library(hrbrthemes)

datos = read_csv("Data_Score.csv")
datos = as.data.frame(datos)
head(datos)
str(datos)

#  transformamos chr -> Factor (Nomimales)
datos = datos %>% 
  mutate(Sexo= as.factor(Sexo),
         Tipo_Empleo = as.factor(Tipo_Empleo),
         Estado_civil = as.factor(Estado_civil))

# transformamos chr -> Factor (Ordinal)

datos$Educacion = factor(datos$Educacion,
                                levels = c("Estudios Escolares","Estudios Tecnicos",
                                           "Estudios Universitarios","Estudios Posgrado"))

datos$Numero_entidades = factor(datos$Numero_entidades,
                                levels = c("1","2","3","4","5 o +"))

# --------------- ANALISIS EXPLORATORIO DE DATOS ---------------

#---- Variables Categoricas

summary(datos)

# Default
(t_Default =table(datos$Default))
round(prop.table(t_Default),3)*100 #el 12% son clientes en Default

(g1 = ggplot(datos, aes(as.factor(Default), fill = as.factor(Default)))+
    geom_bar()+
    labs(title = "Default del credito",x= "", y= "")+
    scale_fill_discrete(labels = c("puntual","moroso"))+
    theme_ipsum())

# Nivel Sexo
(t_Sexo = table(datos$Sexo))
round(prop.table(t_Sexo),3)*100

(g2 = ggplot(datos, aes(Sexo, fill = Sexo))+
  geom_bar()+
  labs(title = "Sexo",x= "", y= "")+
  theme_ipsum()+
  theme(legend.position = "none"))

# Nivel Educativo
(t_edu = table(datos$Educacion))
round(prop.table(t_edu),2)*100

(g3 = ggplot(datos, aes(Educacion, fill = Educacion))+
    geom_bar()+
    labs(title = " Educacion",x= "", y= "")+
    coord_flip()+
    theme_ipsum()+
    theme(legend.position = "none"))

# Nivel Categoria Empleo
(t_empleo = table(datos$Tipo_Empleo))
round(prop.table(t_empleo),3)*100

(g4 = ggplot(datos, aes(Tipo_Empleo, fill = Tipo_Empleo))+
    geom_bar()+
    labs(title = "Empleo",x= "", y= "")+
    coord_flip()+
    theme_ipsum()+
    theme(legend.position = "none"))

# Nivel Numero de Entidades
(t_entidad = table(datos$Numero_entidades))
round(prop.table(t_entidad),3)*100

(g5 = ggplot(datos, aes(Numero_entidades, fill = Numero_entidades))+
    geom_bar()+
    labs(title = "N entidades",x= "", y= "")+
    coord_flip()+
    theme_ipsum()+
    theme(legend.position = "none"))

install.packages("cowplot")
library(cowplot)
plot_grid(g1,g2,g3,g4,g5, nrow =2,  align = "hv")

#---- Variables numericas

# funcion de estadisticas

estadisticas = function(x){
 n <- length(x)
 media <- round(mean(x),2)
 mediana <- round(median(x),2)
 desvest <- round(sd(x),2)
 max <- round(max(x),2)
 min<-round(min(x),2)
 P10<-round(quantile(x, probs = 0.10),1)
 P20<-round(quantile(x, probs = 0.20),1)
 P30<-round(quantile(x, probs = 0.30),1)
 P40<-round(quantile(x, probs = 0.40),1)
 P60<-round(quantile(x, probs = 0.60),1)
 P50<-round(quantile(x, probs = 0.50),1)
 P70<-round(quantile(x, probs = 0.70),1)
 P80<-round(quantile(x, probs = 0.80),1)
 P90<-round(quantile(x, probs = 0.90),1)

Stat<- rbind(n,media, mediana, desvest, max, 
                          min,P10, P20,P30,
                          P40,P50,P60,P70,P80,P90)

Stat
}

estadisticas(datos$Experiencia)
estadisticas(datos$Utilizacion_tarjetas)
estadisticas(datos$Edad)

# Graficos de densidad

(g6 = ggplot(datos, aes(x = Experiencia))+
  geom_histogram(color ="black", fill = "#AF7AC5")+
  labs(title = "Experiencia laboral", x ="", y = "")+
  theme_ipsum())

(g7 = ggplot(datos, aes(x = Utilizacion_tarjetas))+
  geom_histogram(color ="black", fill = "#F8C471")+
  labs(title = "Utilizacion de tarjetas", x ="", y = "")+
  theme_ipsum())

(g8 = ggplot(datos, aes(x = Edad))+
  geom_histogram(color ="black", fill = "#45B39D", bins = 15)+
  labs(title = "Edad", x ="", y = "")+
  theme_ipsum())

plot_grid(g6,g7,g8, nrow =2,  align = "hv")

# libreria ggally
library(GGally)

datos %>% 
  select(Default, Experiencia, Utilizacion_tarjetas,Edad) %>% 
  ggpairs(ggplot2::aes(colour=as.factor(Default)))


# --------------- DIVISION DATOS TRAIN TEST ---------------

install.packages("caret")
library(caret)

set.seed(123456)
muestra = createDataPartition(datos$Default, p = 0.7, list = F)

train = datos[muestra,]
test = datos[-muestra,]
dim(train)
dim(test)

#---------------- RIESGO EN GRUPOS ---------------

# Porcentaje de Default por Grupos
tasa_de_malos = mean(train$Default)

(g9 = train %>%
        group_by(Numero_entidades, Default) %>% 
        summarise(total = n()) %>% 
        spread(key = Default, value = total) %>% 
        mutate(tasa_malos = `1`/(`1`+ `0`)*100) %>% 
        ggplot(aes(x= Numero_entidades, y = tasa_malos))+
        geom_col(aes(fill = tasa_malos))+
        scale_fill_gradient2(low = "#F4A460",
                             high = "#6495ED")+
        geom_label(aes(label = round(tasa_malos,2)))+
        theme_ipsum()+
        labs(title = "Default Entidades", y = "", x= "")+
        theme(legend.position = "none"))

(g10 = train %>%
        group_by(Educacion, Default) %>% 
        summarise(total = n()) %>% 
        spread(key = Default, value = total) %>% 
        mutate(tasa_malos = `1`/(`1`+ `0`)*100) %>% 
        ggplot(aes(x= reorder(Educacion, tasa_malos), y = tasa_malos))+
        geom_col(aes(fill = tasa_malos))+
        coord_flip()+
        scale_fill_gradient2(low = "#FDEDEC",
                             high = "#B03A2E")+
        geom_label(aes(label = round(tasa_malos,2)))+
        theme_ipsum()+
        labs(title = "Default Educacion", y = "", x= "")+
        theme(legend.position = "none"))

(g11 = train %>%
        group_by(Estado_civil, Default) %>% 
        summarise(total = n()) %>% 
        spread(key = Default, value = total) %>% 
        mutate(tasa_malos = `1`/(`1`+ `0`)*100) %>% 
        ggplot(aes(x= reorder(Estado_civil, tasa_malos), y = tasa_malos))+
        geom_col(aes(fill = tasa_malos))+
        scale_fill_gradient2(low = "#FEF9E7",
                             high = "#D4AC0D")+
        geom_label(aes(label = round(tasa_malos,2)))+
        theme_ipsum()+
        labs(title = "Default Est. Civil", y = "", x= "")+
        theme(legend.position = "none"))

(g12 = train %>%
        group_by(Tipo_Empleo, Default) %>% 
        summarise(total = n()) %>% 
        spread(key = Default, value = total) %>% 
        mutate(tasa_malos = `1`/(`1`+ `0`)*100) %>% 
        ggplot(aes(x=reorder(Tipo_Empleo, tasa_malos), y = tasa_malos))+
        geom_col(aes(fill = tasa_malos))+
        coord_flip()+
        scale_fill_gradient2(low = "#E8F6F3",
                             high = "#0E6655")+
        geom_label(aes(label = round(tasa_malos,2)))+
        theme_ipsum()+
        labs(title = "Default Empleo", y = "", x= "")+
        theme(legend.position = "none"))

plot_grid(g9,g10,g11,g12, nrow =2,  align = "hv")


#----- Contribucion al Riesgo por Grupo

riesgo_global = mean(train$Default)

(g13 = train %>% 
  group_by(Sexo) %>% 
  summarise(riesgo = mean(Default),
            contribucion = riesgo/riesgo_global) %>%
  ggplot(aes(Sexo, contribucion))+ 
  geom_col(aes(fill = Sexo))+
  labs(title ="Sexo",
         y = "", x = "")+
  theme_ipsum()+
  theme(legend.position = "none")+
  geom_hline(yintercept = 1, size = 1))

(g14 = train %>% 
    group_by(Numero_entidades) %>% 
    summarise(riesgo = mean(Default),
              contribucion = riesgo/riesgo_global) %>%
    ggplot(aes(Numero_entidades, contribucion))+ 
    geom_col(aes(fill = Numero_entidades))+
    labs(title ="Entidades",
         y = "", x = "")+
    theme_ipsum()+
    theme(legend.position = "none")+
    geom_hline(yintercept = 1, size = 1.1))

(g15 = train %>% 
    group_by(Educacion) %>% 
    summarise(riesgo = mean(Default),
              contribucion = riesgo/riesgo_global) %>%
    ggplot(aes(fct_reorder(Educacion, contribucion, mean),
               contribucion))+ 
    geom_col(aes(fill = Educacion))+
    labs(title ="Educacion",
         y = "", x = "")+
    coord_flip()+
    theme_ipsum()+
    theme(legend.position = "none")+
    geom_hline(yintercept = 1, size = 1.2))

(g16 = train %>% 
    group_by(Estado_civil) %>% 
    summarise(riesgo = mean(Default),
              contribucion = riesgo/riesgo_global) %>%
    ggplot(aes(fct_reorder(Estado_civil,contribucion, mean),
                           contribucion))+ 
    geom_col(aes(fill = Estado_civil))+
    coord_flip()+
    labs(title ="Estado Civil",
         y = "", x = "")+
    theme_ipsum()+
    theme(legend.position = "none")+
    geom_hline(yintercept = 1, size = 1.1))

(g17 = train %>% 
    group_by(Tipo_Empleo) %>% 
    summarise(riesgo = mean(Default),
              contribucion = riesgo/riesgo_global) %>%
    ggplot(aes(fct_reorder(Tipo_Empleo,contribucion, mean),
               contribucion))+ 
    geom_col(aes(fill = Tipo_Empleo))+
    coord_flip()+
    labs(title ="Empleo",
         y = "", x = "")+
    theme_ipsum()+
    theme(legend.position = "none")+
    geom_hline(yintercept = 1, size = 1.1))

plot_grid(g14,g15,g16,g17, nrow =2,  align = "hv")

#---------------- ANALISIS WoE ---------------

#install.packages("smbinning", dependencies = T)
#install.packages("party")
library(smbinning)
library(party)

#ojo Smbinning no acepta nombre Default
#El target en Smninning es 1 = bueno
train$BUENO = ifelse(train$Default == 1,0,1) 

# Var Experiencia
plot(ctree( as.factor(Default) ~ Experiencia, train)) #pvalue = la prop de malos son iguales en las ramas sgts

smb_EXP = smbinning(train,y= "BUENO",x="Experiencia",p = 0.05)
smb_EXP$ivtable
par(mfrow = c(2,2))
smbinning.plot(smb_EXP,option="dist",sub="Experiencia")
smbinning.plot(smb_EXP,option="badrate",sub="Experiencia") 
smbinning.plot(smb_EXP,option="goodrate",sub="Experiencia")
smbinning.plot(smb_EXP,option="WoE",sub="Experiencia")

# Var Edad
plot(ctree( as.factor(Default) ~ Edad, train)) 
smb_Edad = smbinning(df=train,y= "BUENO",x="Edad",p = 0.05)
par(mfrow = c(2,2))
smbinning.plot(smb_Edad,option="dist",sub="Edad")
smbinning.plot(smb_Edad,option="badrate",sub="Edad") 
smbinning.plot(smb_Edad,option="goodrate",sub="Edad")
smbinning.plot(smb_Edad,option="WoE",sub="Edad")

# Var Utilizacion de tarjetas
plot(ctree( as.factor(Default) ~ Utilizacion_tarjetas, train))
smb_UT = smbinning(df=train,y= "BUENO",x="Utilizacion_tarjetas",p = 0.05)
par(mfrow = c(2,2))
smbinning.plot(smb_UT,option="dist",sub="% Tarjetas")
smbinning.plot(smb_UT,option="badrate",sub="% Tarjetas") 
smbinning.plot(smb_UT,option="goodrate",sub="% Tarjetas")
smbinning.plot(smb_UT,option="WoE",sub="% Tarjetas")

#---------------- CREANDO CATEGORIAS ---------------

#--- Categorizamos Var numericas en Train y test

train = train %>% 
  mutate(rango_experiencia = case_when(Experiencia <=19 ~ 1,
                                       Experiencia <=39 ~ 2,
                                       Experiencia <=204 ~ 3,
                                       TRUE ~ 4),
         rango_Edad = case_when(Edad <= 25 ~ 1,
                                Edad <= 30 ~ 2,
                                Edad <= 41 ~ 3,
                                Edad <= 47 ~ 4,
                                TRUE ~ 5),
         rango_tarjetas = case_when(Utilizacion_tarjetas <=14 ~ 1,
                                    Utilizacion_tarjetas <=33 ~ 2,
                                    Utilizacion_tarjetas <=50 ~ 3,
                                    Utilizacion_tarjetas <= 72 ~ 4,
                                    Utilizacion_tarjetas <= 89 ~ 5,
                                    TRUE ~ 6))
  

test = test %>% 
  mutate(rango_experiencia = case_when(Experiencia <=19 ~ 1,
                                       Experiencia <=39 ~ 2,
                                       Experiencia <=204 ~ 3,
                                       TRUE ~ 4),
         rango_Edad = case_when(Edad <= 25 ~ 1,
                                Edad <= 30 ~ 2,
                                Edad <= 41 ~ 3,
                                Edad <= 47 ~ 4,
                                TRUE ~ 5),
         rango_tarjetas = case_when(Utilizacion_tarjetas <=14 ~ 1,
                                    Utilizacion_tarjetas <=33 ~ 2,
                                    Utilizacion_tarjetas <=50 ~ 3,
                                    Utilizacion_tarjetas <= 72 ~ 4,
                                    Utilizacion_tarjetas <= 89 ~ 5,
                                    TRUE ~ 6))
#-- Transformando a var ordinales

train = train %>% 
  mutate(rango_experiencia = factor(rango_experiencia, 
                                    labels = c("<=19","<=39","<=204",">204")),
         rango_Edad = factor(rango_Edad, 
                                    labels = c("<=25","<=30","<=41","<=47",">41")),
         rango_tarjetas = factor(rango_tarjetas, 
                                    labels = c("<=14","<=33","<=50","<=72","<=89",">89")))
         
test = test %>% 
  mutate(rango_experiencia = factor(rango_experiencia, 
                                    labels = c("<=19","<=39","<=204",">204")),
         rango_Edad = factor(rango_Edad, 
                             labels = c("<=25","<=30","<=41","<=47",">41")),
         rango_tarjetas = factor(rango_tarjetas, 
                                 labels = c("<=14","<=33","<=50","<=72","<=89",">89")))

#--- Funcion WOE para categoricas

tabla_woe = function(x_cat, y) {
   Tabla=table(x_cat, y)
   DF_WOE=data.frame(malos=Tabla[,2],buenos=Tabla[,1])
   DF_WOE$buenos_prop = DF_WOE$buenos/sum( DF_WOE$buenos)
   DF_WOE$malos_prop = DF_WOE$malos/sum( DF_WOE$malos)
   DF_WOE$WOE=log(DF_WOE$buenos_prop/DF_WOE$malos_prop)
   DF_WOE$IV=(DF_WOE$buenos_prop - DF_WOE$malos_prop)*DF_WOE$WOE
   DF_WOE
}

tabla_woe(train$Educacion, train$Default)
tabla_woe(train$Sexo, train$Default)
tabla_woe(train$Tipo_Empleo, train$Default)
tabla_woe(train$Estado_civil, train$Default)
tabla_woe(train$Numero_entidades, train$Default)

#--- Transformando a Logaritmo
train = train %>% 
  mutate(log_exp = log(Experiencia),
         log_Edad = log(Edad),
         log_tarjeta = ifelse(Utilizacion_tarjetas>0, log(Utilizacion_tarjetas),0))

test = test %>% 
  mutate(log_exp = log(Experiencia),
         log_Edad = log(Edad),
         log_tarjeta = ifelse(Utilizacion_tarjetas>0, log(Utilizacion_tarjetas),0))

#--histograma en logaritmo

(g18 = ggplot(train, aes(x = log_exp))+
    geom_histogram(color ="black", fill = "#AF7AC5")+
    labs(title = "log Experiencia laboral", x ="", y = "")+
    theme_ipsum())

(g19 = ggplot(train, aes(x = log_tarjeta))+
    geom_histogram(color ="black", fill = "#F8C471")+
    labs(title = "log Utilizacion de tarjetas", x ="", y = "")+
    theme_ipsum())

(g20 = ggplot(train, aes(x = log_Edad))+
    geom_histogram(color ="black", fill = "#45B39D", bins = 15)+
    labs(title = "log Edad", x ="", y = "")+
    theme_ipsum())

plot_grid(g18,g19,g20, nrow =2,  align = "hv")
plot_grid(g6,g7,g8, nrow =2,  align = "hv")


#---------------- MODELOS LOGISTICO ---------------

names(train)
modelo_niveles = glm(Default ~ Sexo + Tipo_Empleo + Estado_civil+ Numero_entidades +
                               Experiencia + Edad + Utilizacion_tarjetas,
                               family=binomial(link = "logit"), 
                               data= train)

modelo_categorias = glm(Default ~ Sexo + Tipo_Empleo + Estado_civil+ Numero_entidades +
                                  rango_experiencia+ rango_Edad + rango_tarjetas,
                                  family=binomial(link = "logit"), 
                                  data= train)

modelo_log = glm(Default ~ Sexo + Tipo_Empleo + Estado_civil+ Numero_entidades +
                           log_exp + log_Edad + log_tarjeta,
                           family=binomial(link = "logit"), 
                           data= train)

summary(modelo_niveles)
summary(modelo_categorias)
summary(modelo_log)

# Imprimiendo los modelos
library(stargazer)
stargazer(modelo_niveles,modelo_categorias, modelo_log, 
          title= "comparacion de modelos",
          model.names = T,
          column.labels = c("niveles", "categorias", "logaritmo"),
          type="html", 
          out="models.html")

# Eleccion con criterios de informacion
AIC(modelo_niveles); BIC(modelo_niveles)
AIC(modelo_categorias); BIC(modelo_categorias) #menor criterio de info
AIC(modelo_log); BIC(modelo_log)

# Prediccion de la probablilidad de Default en test

y_prob_mn = predict(modelo_niveles,    newdata = test[,-1], type="response")
y_prob_mc = predict(modelo_categorias, newdata = test[,-1], type="response")
y_prob_ml = predict(modelo_log, newdata = test[,-1], type="response")

summary(y_prob_mn)
summary(y_prob_mc)
summary(y_prob_ml)

#---------------- METRICAS DE EVALUACION ---------------

y_test = test$Default

# Calculo del area debajo de la Curva ROC (AUC)
#install.packages("pROC")
#install.packages("ROCR")
library(ROCR)
library(pROC)

roc_mn = roc(response = y_test, predictor = y_prob_mn)
roc_mc = roc(response = y_test, predictor = y_prob_mc)
roc_ml = roc(response = y_test, predictor = y_prob_ml)

# Area bajo la curva ROC
roc_mn$auc
roc_mc$auc #mejor ajuste
roc_ml$auc

# Grafico ROC
pred_mn = prediction(y_prob_mn,y_test)
pred_mc = prediction(y_prob_mc,y_test)
pred_ml = prediction(y_prob_ml,y_test)

perf_mn = performance(pred_mn,"tpr","fpr")
perf_mc = performance(pred_mc,"tpr","fpr")
perf_ml = performance(pred_mc,"tpr","fpr")

par(mfrow = c(2,2))
plot.roc(roc_mn, print.auc=TRUE, main = "Niveles",
         print.thres = "best",  col="#CB4335",
         xlab="1-Especificidad",ylab="Sensibilidad")

plot.roc(roc_mc, print.auc=TRUE, main = "Categoricas",
         print.thres = "best", col="#884EA0",
         xlab="1-Especificidad",ylab="Sensibilidad")

plot.roc(roc_ml, print.auc=TRUE, main = "Logaritmo",
         print.thres = "best", col="#F39C12",
         xlab="1-Especificidad",ylab="Sensibilidad")

# Indicador KS
(KS_mn = max(attr(perf_mn,'y.values')[[1]]-attr(perf_mn,'x.values')[[1]]))
(KS_mc = max(attr(perf_mc,'y.values')[[1]]-attr(perf_mc,'x.values')[[1]]))
(KS_ml = max(attr(perf_ml,'y.values')[[1]]-attr(perf_ml,'x.values')[[1]]))

#---------------- PUNTO DE CORTE ---------------

# Grafico Sensibilidad-Especificidad (best Models)
sensibilidad = roc_mc$sensitivities
especificidad = roc_mc$specificities
punto_corte = roc_mc$thresholds

data_roc = data.frame(sensibilidad, especificidad, punto_corte)
data_roc %>% 
  gather(-punto_corte, key = "indicador", value = "valor") %>% 
  ggplot(aes(x = punto_corte, y = valor, color = indicador))+
  geom_line(size = 2)+
  #geom_point()+
  ggtitle("Sensibilidad vs Especificidad")+
  theme_ipsum()

# Punto de Corte (sens = Espe)
data_roc %>% 
  mutate(diff_risk = abs(sensibilidad - especificidad) ) %>% 
  filter(!(is.infinite(punto_corte))) %>% 
  arrange(diff_risk) %>% 
  head(1)

# Punto de Corte por Percentiles
quantiles = quantile(y_prob_mc, probs = c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1))

rango_prob = case_when(y_prob_mc<= quantiles[1] ~ round(quantiles[1]*100,2),
                       y_prob_mc<= quantiles[2] ~ round(quantiles[2]*100,2),
                       y_prob_mc<= quantiles[3] ~ round(quantiles[3]*100,2),
                       y_prob_mc<= quantiles[4] ~ round(quantiles[4]*100,2),
                       y_prob_mc<= quantiles[5] ~ round(quantiles[5]*100,2),
                       y_prob_mc<= quantiles[6] ~ round(quantiles[6]*100,2),
                       y_prob_mc<= quantiles[7] ~ round(quantiles[7]*100,2),
                       y_prob_mc<= quantiles[8] ~ round(quantiles[8]*100,2),
                       y_prob_mc<= quantiles[9] ~ round(quantiles[9]*100,2),
                       y_prob_mc<= quantiles[10] ~round(quantiles[10]*100,2))
table(rango_prob)

# tabla cruzada de Default por rango de probabilidad
(tabla_rango = table(rango_prob, test$Default))

(tabla_rango_prob=round(prop.table(tabla_rango, margin = 1)*100,2))
(tabla_rango_prop =round(prop.table(tabla_rango, margin = 2)*100,2))

#graf de de prob de defaul por rango
data_rango_prop = data.frame(tabla_rango_prop)
data_rango_prop = rename(data_rango_prop, c(punto_corte = "rango_prob",
                                            Default = "Var2",
                                            proporcion ="Freq"))

data_rango_prop$punto_corte = as.numeric(as.character(data_rango_prop$punto_corte))

# Proporcion de malos vs Proporcion de buenos
ggplot(data_rango_prop, aes(x= punto_corte,
                            y = proporcion,
                            color = Default))+
  geom_line(size = 1.2)+
  geom_point(size = 2)+
  ggtitle("Proporcion de buenos vs malos por corte")+
 scale_color_manual(values = c("#7D3C98", "#7FB3D5"), 
                     labels =c("buenos","malos") )+
  theme_ipsum()+
  theme(legend.position = "top")


# Distancia minima de riesgo por Corte
data_rango_prop %>% 
  spread(key = Default, value =  proporcion) %>% 
  mutate(dif = `1`-`0`) %>% 
  ggplot(aes(as.factor(punto_corte), dif))+
  geom_bar(aes(fill = dif),stat = "identity", position = "dodge")+
  geom_label(aes(label = round(dif,2)))+
  theme_ipsum()+
  ggtitle("Distancia entre buenos y malos por corte")+
  theme(legend.position = "none")

#---------------- MATRIZ DE CONFUSION ---------------
# Creando punto de corte
table(test$Default)
y_pred_50 = factor(ifelse(y_prob_mc >= 0.5,1,0)) #punto de corte 50%
y_pred_se = factor(ifelse(y_prob_mc >= 0.1161154,1,0)) #punto de corte por esp =sens
y_pred_pc = factor(ifelse(y_prob_mc >= 0.0978,1,0)) #punto de corte por percentiles

(MC_se = table(y_test, y_pred_se))

y_test =test$Default
y_test = factor(y_test, levels = c("1","0"))

confusionMatrix(y_pred_50, y_test)
confusionMatrix(y_pred_se,y_test)
confusionMatrix(y_pred_pc,y_test)











