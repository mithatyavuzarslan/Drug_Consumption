# Drug_Consumption_kNN


Mithat Yavuzarslan


mail: mithatyavuzarslan@gmail.com


*This is an attempt to use kNN algorithm with different distance measures (Euclidean, Maximum, Manhattan, and Canberra) on Drug Consumption dataset retrieved from UCI. The dataset consists of personal measurements of patients and their consumption data for several drugs. 

** I have transformed Cannabis, Coke and Ecstasy consumption classes to binary (User, Non-User) and applied kNN algorithm with Euclidean, Maximum, Manhattan, and Canberra distance measures for each drug consumption class.

*** Since the kNN function of class package in R is only using euclidean distance by default, knnVCN function in knnGarden package was used to seperately build models with different distance measures.

**** At the bottom section of the code, accuracy scores of the models with 4 measures were compared but a summarized comparison of the best classifiers between the original research conducted by Ferhman et al. (2017) and this attempt can be checked from this image: 


<img width=“964” alt=“comparison” src=“https://github.com/mithatyavuzarslan/Drug_Consumption_kNN/blob/master/image/comparison.png”>

 
 

 
References

Fehrman, E., Muhammad, A. K., Mirkes, E. M., Egan, V., & Gorban, A. N. (2017). The Five Factor Model of personality and evaluation of drug consumption risk. In Data Science (pp. 231-242). Springer, Cham.

Original Owners of Database:

1. Elaine Fehrman,
Men's Personality Disorder and National Women's Directorate,
Rampton Hospital, Retford,
Nottinghamshire, DN22 0PD, UK,
Elaine.Fehrman '@' nottshc.nhs.uk

2. Vincent Egan,
Department of Psychiatry and Applied Psychology,
University of Nottingham,
Nottingham, NG8 1BB, UK,
Vincent.Egan '@' nottingham.ac.uk

3. Evgeny M. Mirkes
Department of Mathematics,
University of Leicester,
Leicester, LE1 7RH, UK,
em322 '@' le.ac.uk

Donor:
Evgeny M. Mirkes
Department of Mathematics,
University of Leicester,
Leicester, LE1 7RH, UK,
em322 '@' le.ac.uk


