# Read dataset
url<-"https://archive.ics.uci.edu/ml/machine-learning-databases/00373/drug_consumption.data"
DrugConsumption <- as.data.frame(read.table(file = url, header = FALSE, dec = ".", sep = ","))

#convert names
colnames(DrugConsumption)<-c("ID",	"Age",	"Gender",	"Education",	"Country",	"Ethnicity",	"Nscore",	"Escore",	"Oscore",	"Ascore",	"Cscore",	"Impulsive",	"SS",	"Alcohol",	"Amphet",	"Amyl",	"Benzos",	"Caff",	"Cannabis",	"Choc",	"Coke",	"Crack",	"Ecstasy",	"Heroin",	"Ketamine",	"Legalh",	"LSD",	"Meth",	"Mushrooms",	"Nicotine",	"Semer",	"VSA")

require(knnGarden)
library(knnGarden)

require(car)
library(car)
#####
##### Recoding all pre-normalized values to their original values to apply a different kind of normalization. ####
####

#Age - Recoding
DrugConsumption$Age<-recode(DrugConsumption$Age,"-0.95197=1;
                                   -0.07854=2;
                                    0.49788=3;
                                    1.09449=4;
                                    1.82213=5;
                                    2.59171=6")
#Gender -Recoding
DrugConsumption$Gender<-recode(DrugConsumption$Gender,"0.48246=1;-0.48246=2")
#Education-Recoding
DrugConsumption$Education<-recode(DrugConsumption$Education,"-2.43591=1;-1.73790=2;-1.43719=3;-1.22751=4;-0.61113=5;-0.05921=6;0.45468=7;1.16365=8;1.98437=9")
table(DrugConsumption$Education)
#Country -Recoding
DrugConsumption$Country<-recode(DrugConsumption$Country,"-0.09765=1;0.24923=2;0.21128=3;-0.46841=4;-0.28519=5;0.96082=6;-0.57009=7")
#Ethnicity - Recoding
table(DrugConsumption$Ethnicity)
DrugConsumption$Ethnicity<-recode(DrugConsumption$Ethnicity,"-0.50212=1;-1.10702=2;1.90725=3;0.12600=4;-0.22166=5;0.11440=6;-0.31685=7")
#NSCORE- Recoding
table(DrugConsumption$Nscore)
DrugConsumption$Nscore<-recode(DrugConsumption$Nscore,"
                        -3.46436=12;
                        -3.15735=13;
                        -2.75696=14;
                        -2.52197=15;
                        -2.42317=16;
                        -2.34360=17;
                        -2.21844=18;
                        -2.05048=19;
                        -1.86962=20;
                        -1.69163=21;
                        -1.55078=22;
                        -1.43907=23;
                        -1.32828=24;
                        -1.19430=25;
                        -1.05308=26;
                        -0.92104=27;
                        -0.79151=28;
                        -0.67825=29;
                        -0.58016=30;
                        -0.46725=31;
                        -0.34799=32;
                        -0.24649=33;
                        -0.14882=34;
                        -0.05188=35;
                        0.04257=36;
                        0.13606=37;
                        0.22393=38;
                        0.31287=39;
                        0.41667=40;
                        0.52135=41;
                        0.62967=42;
                        0.73545=43;
                        0.82562=44;
                        0.91093=45;
                        1.02119=46;
                        1.13281=47;
                        1.23461=48;
                        1.37297=49;
                        1.49158=50;
                        1.60383=51;
                        1.72012=52;
                        1.83990=53;
                        1.98437=54;
                        2.12700=55;
                        2.28554=56;
                        2.46262=57;
                        2.61139=58;
                        2.82196=59;
                        3.27393=60")
#ESCORE - Recoding
table(DrugConsumption$Escore)
DrugConsumption$Escore<-recode(DrugConsumption$Escore,"
                           -3.27393=16;
                           -3.00537=18;
                           -2.72827=19;
                           -2.53830=20;
                           -2.44904=21;
                           -2.32338=22;
                           -2.21069=23;
                           -2.11437=24;
                           -2.03972=25;
                           -1.92173=26;
                           -1.76250=27;
                           -1.63340=28;
                           -1.50796=29;
                           -1.37639=30;
                           -1.23177=31;
                           -1.09207=32;
                           -0.94779=33;
                           -0.80615=34;
                           -0.69509=35;
                           -0.57545=36;
                           -0.43999=37;
                           -0.30033=38;
                           -0.15487=39;
                           0.00332=40;
                           0.16767=41;
                           0.32197=42;
                           0.47617=43;
                           0.63779=44;
                           0.80523=45;
                           0.96248=46;
                           1.11406=47;
                           1.28610=48;
                           1.45421=49;
                           1.58487=50;
                           1.74091=51;
                           1.93886=52;
                           2.12700=53;
                           2.32338=54;
                           2.57309=55;
                           2.85950=56;
                           3.00537=58;
                           3.27393=59")

#OSCORE- Recoding
table(DrugConsumption$Oscore)
DrugConsumption$Oscore<-recode(DrugConsumption$Oscore," 
                        -3.27393=24;
                        -2.85950=26;
                        -2.63199=28;
                        -2.39883=29;
                        -2.21069=30;
                        -2.09015=31;
                        -1.97495=32;
                        -1.82919=33;
                        -1.68062=34;
                        -1.55521=35;
                        -1.42424=36;
                        -1.27553=37;
                        -1.11902=38;
                        -0.97631=39;
                        -0.84732=40;
                        -0.71727=41;
                        -0.58331=42;
                        -0.45174=43;
                        -0.31776=44;
                        -0.17779=45;
                        -0.01928=46;
                        0.14143=47;
                        0.29338=48;
                        0.44585=49;
                        0.58331=50;
                        0.72330=51;
                        0.88309=52;
                        1.06238=53;
                        1.24033=54;
                        1.43533=55;
                        1.65653=56;
                        1.88511=57;
                        2.15324=58;
                        2.44904=59;
                        2.90161=60
                        ")
#ASCORE-Recoding
table(DrugConsumption$Ascore)
DrugConsumption$Ascore<-recode(DrugConsumption$Ascore," 
                        -3.46436=12;
                        -3.15735=16;
                        -3.00537=18;
                        -2.90161=23;
                        -2.78793=24;
                        -2.70172=25;
                        -2.53830=26;
                        -2.35413=27;
                        -2.21844=28;
                        -2.07848=29;
                        -1.92595=30;
                        -1.77200=31;
                        -1.62090=32;
                        -1.47955=33;
                        -1.34289=34;
                        -1.21213=35;
                        -1.07533=36;
                        -0.91699=37;
                        -0.76096=38;
                        -0.60633=39;
                        -0.45321=40;
                        -0.30172=41;
                        -0.15487=42;
                        -0.01729=43;
                        0.13136=44;
                        0.28783=45;
                        0.43852=46;
                        0.59042=47;
                        0.76096=48;
                        0.94156=49;
                        1.11406=50;
                        1.2861=51;
                        1.45039=52;
                        1.61108=53;
                        1.81866=54;
                        2.03972=55;
                        2.23427=56;
                        2.46262=57;
                        2.75696=58;
                        3.15735=59;
                        3.46436=60")

#Cscore - Recoding
table(DrugConsumption$Cscore)
DrugConsumption$Cscore<-recode(DrugConsumption$Cscore,"
                        -3.46436=17;
                        -3.15735=19;
                        -2.90161=20;
                        -2.72827=21;
                        -2.57309=22;
                        -2.42317=23;
                        -2.30408=24;
                        -2.18109=25;
                        -2.04506=26;
                        -1.92173=27;
                        -1.78169=28;
                        -1.64101=29;
                        -1.51840=30;
                        -1.38502=31;
                        -1.25773=32;
                        -1.13788=33;
                        -1.01450=34;
                        -0.89891=35;
                        -0.78155=36;
                        -0.65253=37;
                        -0.52745=38;
                        -0.40581=39;
                        -0.27607=40;
                        -0.14277=41;
                        -0.00665=42;
                        0.12331=43;
                        0.25953=44;
                        0.41594=45;
                        0.58489=46;
                        0.7583=47;
                        0.93949=48;
                        1.13407=49;
                        1.30612=50;
                        1.46191=51;
                        1.63088=52;
                        1.81175=53;
                        2.04506=54;
                        2.33337=55;
                        2.63199=56;
                        3.00537=57;
                        3.46436=59")


DrugConsumption$Cannabis<-recode(DrugConsumption$Cannabis, "c('CL0','CL1')='0'; else ='1'")

DrugConsumption$Coke<-recode(DrugConsumption$Coke, "c('CL0','CL1')='0'; else ='1'")

DrugConsumption$Ecstasy<-recode(DrugConsumption$Ecstasy,"c('CL0','CL1')='0'; else ='1'")

DrugConsumption$Country<-NULL
DrugConsumption$Ethnicity<-NULL


#########################CORRELATION METRICS##############################################

library(corrplot)

b<-cor(DrugConsumption[,2:11],use = "all.obs",method="pearson")
corrplot(b,method ="number",is.corr = FALSE,diag = FALSE,col = "black",tl.col = "black")


##############   CONVERT TARGET ATTRIBUTE CLASSES FROM NUMERIC TO FACTORS  ############

DrugConsumption$Cannabis <- as.factor(DrugConsumption$Cannabis)
DrugConsumption$Coke <- as.factor(DrugConsumption$Coke)
DrugConsumption$Ecstasy <- as.factor(DrugConsumption$Ecstasy)

############### 0-1 NORMALIZATION ###########
require(clusterSim)
library(clusterSim)
set.seed(55)
DrugConsumption[,2:11] <-data.Normalization(DrugConsumption[,2:11],type="n4",normalization="column")

###############  TRAIN vs. TEST FOR EVERYONE ########
require(caret)
library(caret)
set.seed(1)
trainIndexes <- createDataPartition(y = DrugConsumption$Cannabis, p = .70, list = FALSE) 
trainIndexes[1:30]
train <- DrugConsumption[trainIndexes,]
test <- DrugConsumption[-trainIndexes,]

############# SPLITTING TRAIN VS. TEST DATA FOR CANNABIS, COKE and ECSTASY CLASSES ######
trainAttributes<-train[,2:11]
trainClassesCannabis <- train[[17]]
trainClassesCoke <- train[[19]]
trainClassesEcstasy <- train[[21]]


testAttributes <- test[,2:11]
testClassesCannabis <- test[[17]]
testClassesCoke <- test[[19]]
testClassesEcstasy <- test[[21]]

#Considering the sample size of the dataset, 7 was chosen for k value
k_value<-7

#######################   CANNABIS ################################


#Euclidean
set.seed(86)
model1<-knnVCN(trainAttributes,trainClassesCannabis,testAttributes,k_value,ShowObs=FALSE,method="euclidean",p=2)

model1<-as.factor(unlist(model1))

table1 <- confusionMatrix(data = model1, reference = testClassesCannabis, mode = "everything",positive="1")
table1

#Maximum
set.seed(86)
model2<-knnVCN(trainAttributes,trainClassesCannabis,testAttributes,k_value,ShowObs=F,method="maximum",p=2)

model2<-as.factor(unlist(model2))

table2 <- confusionMatrix(data = model2, reference = testClassesCannabis, mode = "everything", positive = "1")
table2

#Manhattan
set.seed(86)
model3<-knnVCN(trainAttributes,trainClassesCannabis,testAttributes,k_value,ShowObs=F,method="manhattan",p=2)

model3<-as.factor(unlist(model3))

table3 <- confusionMatrix(data = model3, reference = testClassesCannabis, mode = "everything")
table3

#Canberra
set.seed(86)
model4<-knnVCN(trainAttributes,trainClassesCannabis,testAttributes,k_value,ShowObs=F,method="canberra",p=2)

model4<-as.factor(unlist(model4))

table4 <- confusionMatrix(data = model4, reference = testClassesCannabis, mode = "everything")
table4




###############   COKE     ##############################

#Euclidean
set.seed(87)
model5<-knnVCN(trainAttributes,trainClassesCoke,testAttributes,k_value,ShowObs=F,method="euclidean",p=2)

model5<-as.factor(unlist(model5))

table5 <- confusionMatrix(data = model5, reference = testClassesCoke, mode = "everything")
table5

#Maximum
set.seed(87)
model6<-knnVCN(trainAttributes,trainClassesCoke,testAttributes,k_value,ShowObs=F,method="maximum",p=2)

model6<-as.factor(unlist(model6))

table6 <- confusionMatrix(data = model6, reference = testClassesCoke, mode = "everything")
table6

#manhattan
set.seed(87)
model7<-knnVCN(trainAttributes,trainClassesCoke,testAttributes,k_value,ShowObs=F,method="manhattan",p=2)

model7<-as.factor(unlist(model7))

table7 <- confusionMatrix(data = model7, reference = testClassesCoke, mode = "everything")
table7

#Canberra
set.seed(87)
model8<-knnVCN(trainAttributes,trainClassesCoke,testAttributes,k_value,ShowObs=F,method="canberra",p=2)

model8<-as.factor(unlist(model8))

table8 <- confusionMatrix(data = model8, reference = testClassesCoke, mode = "everything")
table8




################ ECSTASY ###########################

#Euclidean
set.seed(88)
model9<-knnVCN(trainAttributes,trainClassesEcstasy,testAttributes,k_value,ShowObs=F,method="euclidean",p=2)

model9<-as.factor(unlist(model9))

table9 <- confusionMatrix(data = model9, reference = testClassesEcstasy, mode = "everything")
table9


#maximum
set.seed(88)
model10<-knnVCN(trainAttributes,trainClassesEcstasy,testAttributes,k_value,ShowObs=F,method="maximum",p=2)

model10<-as.factor(unlist(model10))

table10 <- confusionMatrix(data = model10, reference = testClassesEcstasy, mode = "everything")
table10



#manhattan
set.seed(88)
model11<-knnVCN(trainAttributes,trainClassesEcstasy,testAttributes,k_value,ShowObs=F,method="manhattan",p=2)

model11<-as.factor(unlist(model11))

table11 <- confusionMatrix(data = model11, reference = testClassesEcstasy, mode = "everything")
table11


#canberra
set.seed(88)
model12<-knnVCN(trainAttributes,trainClassesEcstasy,testAttributes,k_value,ShowObs=F,method="canberra",p=2)

model12<-as.factor(unlist(model12))

table12 <- confusionMatrix(data = model12, reference = testClassesEcstasy, mode = "everything")


###################### PRINT ACCURACY SCORES OF CANNABIS CLASS #######################################


CannabisPrint<-cbind(c("Accuracy_Euclidean","Accuracy_Maximum","Accuracy_Manhattan","Accuracy_Canberra"),
                     c(table1$overall[1],table2$overall[1],table3$overall[1],table4$overall[1]))
colnames(CannabisPrint)<-NULL
rownames(CannabisPrint)<-NULL

print(CannabisPrint)

###################### PRINT ACCURACY SCORES OF COKE CLASS #######################################


CokePrint<-cbind(c("Accuracy_Euclidean","Accuracy_Maximum","Accuracy_Manhattan","Accuracy_Canberra"),
                     c(table5$overall[1],table6$overall[1],table7$overall[1],table8$overall[1]))
colnames(CokePrint)<-NULL
rownames(CokePrint)<-NULL

print(CokePrint)

###################### PRINT ACCURACY SCORES OF ECSTASY CLASS #######################################

EcstasyPrint<-cbind(c("Accuracy_Euclidean","Accuracy_Maximum","Accuracy_Manhattan","Accuracy_Canberra"),
                 c(table9$overall[1],table10$overall[1],table11$overall[1],table12$overall[1]))
colnames(EcstasyPrint)<-NULL
rownames(EcstasyPrint)<-NULL

print(EcstasyPrint)

#################### PRINT ALL ACCURACY SCORES ################################################
tableAll<-cbind(c("Accuracy_Euclidean","Accuracy_Maximum","Accuracy_Manhattan","Accuracy_Canberra"),
           CannabisPrint[,2],CokePrint[,2],EcstasyPrint[,2])
colnames(tableAll)<-c("Accuracy Values","Cannabis","Coke","Ecstasy")
print(tableAll)

