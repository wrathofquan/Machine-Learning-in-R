### Challenge 3 solution decision tree

# view structure of Mroz
str(Mroz)

# isolate Y response variable ("wc")
Y_dt <- Mroz$wc

# designate X predictor variables, excluding "wc" (thus, [,-5])
X_dt <- Mroz[,-5] 

# construct the tree
dt2 <- rpart(Y_dt ~ ., data=X_dt, method="anova")

# view results
printcp(dt2)

plotcp(dt2)

summary(dt2)

# plot
rpart.plot(dt2)

### control
?rpart.control # view help file

# set our parameters inside the "control" hyperparameter:
# minsplit = minimum number of observations that must exist in a node for a split to be attempted
# cp = "complexity parameter" - this will prune splits that are not worthwhile; cross-validation will prune off all splits that do not improve the model fit 

dt_control <- rpart.control(minsplit=20, cp=0.001)

dt3 <- rpart(Y_dt ~ ., data=X_dt, method="anova", control=dt_control)

printcp(dt3)
plotcp(dt3)
summary(dt3)

rpart.plot(dt3)