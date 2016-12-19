pgamma(0.025,shape=10,scale=1,lower.tail = TRUE) #2.569021e-23
pgamma(0.975,shape=10,scale=1,lower.tail = FALSE) #0.9999999

#n: {70,11,66,5,20,4,35,40,29,8}
sum(70,11,66,5,20,4,35,40,29,8)
288/4.79 #60.12526
288/17.085 #16.85689

dgamma(70, shape=10, scale=1)
dgamma(11, shape=10, scale=1)
dgamma(66, shape=10, scale=1)
dgamma(5, shape=10, scale=1)
dgamma(20, shape=10, scale=1)
dgamma(4, shape=10, scale=1)
dgamma(35, shape=10, scale=1)
dgamma(40, shape=10, scale=1)
dgamma(29, shape=10, scale=1)
dgamma(8, shape=10, scale=1)

qgamma(0.025,shape=10,scale=1,lower.tail = TRUE) #4.795389
qgamma(0.975,shape=10,scale=1,lower.tail = FALSE) #4.795389
qgamma(0.975,shape=10,scale=1,lower.tail = TRUE) #17.0848

x<-seq(0,30,by=0.001)
length(x) #30001
y<-dgamma(x,shape=10,scale=1)
length(y) #30001
plot(x,y,
     xlab="X Values",
     ylab="Y Values",
     main="Gamma(Alpha=10,Beta=1)",
     type="p", col="blue")

#Cumulative Distribution 
pgamma(0.025,shape=10,scale=1) #2.569021e-23
dgamma(0.025,shape=10,scale=1) #1.025273e-20
qgamma(0.025,shape=10,scale=1) #4.795389
#length(which(y<=.00000000000000000000002569021))
#a = which(y<=.00000000000000000000002569021)
#max(a) #13
#y[13] #7.107471e-21
#x[13] #0.012
#30001*0.012 #360.012


#Cumulative Distribution 
pgamma(0.975,shape=10,scale=1) #8.847536e-08
dgamma(0.975,shape=10,scale=1) #8.276398e-07
qgamma(0.975,shape=10,scale=1) #17.0848
#length(which(y>=.00000008847536))
#b = which(y>=.00000008847536)
#min(b) #743 
#y[743] #8.945932e-08
#x[743] #0.742 
#30001*.742 #22260.74


x[4500]
y[4500] #0.023
x[17500]
y[17500] #0.0106


numb <- rep(0,30001)
cum <- rep(0,30001)
sum <- 0
x<-seq(0,30,by=0.001)
length(x)
for(i in 1:30001){
  numb[i] <- dgamma(x[i],shape=10,scale=1)
  sum <- sum + numb[i]
  cum[i] <- sum
}
numb
cum
tail(cum)
new <- cum/max(cum)
new[30001]
m = which(new>=.025)
z = which(new<=.975)
min(m) #4796
max(z) #17084 
x[4796] #4.795
x[17084] #17.083
abline(v=4.795, col="red")
abline(v=17.083, col="red")


# ****************************************************************************************** 
# ****************************************************************************************** 

theta <- seq(0,80,by=.01)
length(theta)

right <- 10*log(theta) + 288/theta
length(right) #8001
left <- 10*log(28.8) - log(1/8) + 10
left #45.6832
length(left)


sat <- ifelse(right>left,1,0)
sat[1609] 
sat[1610] #0
theta[1609] #16.08
sat[5931]
sat[5932] #0
theta[5932] #59.31
#Thus, 1/8 likelihood interval is [16.08,59.31]

zero<-rep(0,8002)
for(i in 1:8001){
  if(sat[i]==1 && sat[i+1]==0){
    zero[i] <-1 
  }
  else if(sat[i]==0 && sat[i+1]==1){
    zero[i] <- 1
  }
}
sum(zero)



# ****************************************************************************************** 
# Gamma Distribution (#5)
x<-seq(0,30,by=0.001)
y<-dgamma(x,shape=10,scale=1)
plot(x,y,
     xlab="X Values",
     ylab="Y Values",
     main="Gamma(Alpha=10,Beta=1)",
     type="p", col="blue")
abline(v=4.795, col="red")
abline(v=17.083, col="red")

# ****************************************************************************************** 
# Uniform Limiting Distribution (#6)
?runif
samples <- runif(1000*50, min = 0, max = 5)
mat1 <- matrix(samples, nrow=1000, ncol=50)
mat1
dim(mat1)
plot(mat1)


?sapply
c <- apply(mat1, max, MARGIN=1)
length(c) #1000
theta <- seq(0,4.995,by=0.005)
length(theta) #1000
y <- 1000*(theta - c)
length(y) #1000
plot(theta, y)


#theta = 5
#c = Y_n = max(X1,...X50)
#n = 50 
z_n <- 50*(5 - c)
hist(z_n)
hist(z_n, prob=T)
curve((1/5)*exp(-x/5))

# *************************
#Let x represent the largest values that Z_n could possibly be
x<-seq(0,49.95,by=.05)
length(x) #501
length(z_n) #1000
hist(z_n, prob=T)
curve((1/5)*exp(-x/5), col= "darkblue", lwd=2, add=TRUE, yaxt="n")
# *************************


# r code for simulating the coverage probability when
# the confidence interval is for the normal mean with
# unknown variance i.e. the confidence interval based
# on Student’s t distribution.
set.seed(11223344)
truemean=3
truesd=2
n=25
alpha=.05
samplemean=numeric(0)
samplevar=numeric(0)

#Conduct 1000 experiments each of size=25
for(i in 1:1000){
  X=rnorm(n,truemean,truesd)
  samplemean[i]=mean(X)
  samplevar[i]=var(X)}
upper=samplemean+qt(1-(alpha/2),n-1)*sqrt(samplevar/n)
lower=samplemean-qt(1-(alpha/2),n-1)*sqrt(samplevar/n)
result1=(lower <= truemean & truemean <=upper)
result1
result2=sum(lower <= truemean & truemean <=upper)/1000
result2 #948
result3=(1:1000)[!result1]
result3

#Conduct 1000 experiments each of size=25
for(i in 1:1000){
  X=rnorm(n,truemean,truesd)
  samplemean[i]=mean(X)
  samplevar[i]=var(X)}
upper=samplemean+qnorm(1-alpha/2)*truesd/sqrt(n)
lower=samplemean-+qnorm(1-alpha/2)*truesd/sqrt(n)
result1=(lower <= truemean & truemean <=upper)
result1
result2=sum(lower <= truemean & truemean <=upper)/1000
result2 #958
result3=(1:1000)[!result1]
result3
