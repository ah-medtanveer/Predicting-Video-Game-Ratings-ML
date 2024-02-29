library(caret)
library(ggplot2)

test_dataset <- read.csv("/Users/ahmed/Documents/DAT 301/Project 1/test_esrb.csv")

colnames(test_dataset)
colnames(test_dataset[, -1][, -1])

test_dataset <- test_dataset[, -1][, -1]

# colnames(clean_DS)

# Attempting to use Logistical Regression
# model <- glm(esrb_rating ~ ., data = test_dataset, family = binomial)

unique(test_dataset$esrb_rating)


#Ok lets try forest then...
library(randomForest)


test_dataset$esrb_rating <- as.factor(test_dataset$esrb_rating)

# training <- test_dataset[trainIndex, ]
# testing <- test_dataset[-trainIndex, ]



model <- randomForest(esrb_rating ~ ., ntree = 10000 ,data = test_dataset)


print(model)


new_data <- read.csv("/Users/ahmed/Documents/DAT 301/Project 1/Video_games_esrb_rating.csv")

predictions <- predict(model, newdata = new_data)
confusionMatrix(predictions, as.factor(new_data$esrb_rating))

summary(predictions)

new_predictions <- predict(model, newdata = new_data)

# print(length(unique(new_data$esrb_rating)))

print("Actual Number: ")
table(new_data$esrb_rating)
print("Predicted Number: ")
summary(new_predictions)


colnames(new_data)

plot(model)

print(model)


testst <- read.csv("test_esrb.csv")


# library(gbm)
# model <- gbm(esrb_rating ~ ., data = test_dataset, distribution = "multinomial", n.trees = 1000)



# library(rpart)
# model <- rpart(ESRB_rating ~ ., data = your_data, method = "class")
# 

#   
# 
# library(e1071)
# model <- svm(ESRB_rating ~ ., data = your_data, kernel = "radial")
# 
# 
# library(gbm)
# model <- gbm(ESRB_rating ~ ., data = your_data, distribution = "multinomial", n.trees = 1000)
# 
# library(nnet)
# model <- nnet(ESRB_rating ~ ., data = your_data, size = 10)


# head(test_dataset)
# 
# 
# 
# training_dataset <- createDataPartition(test_dataset$esrb_rating, p = 0.8,
#                                         list = FALSE,
#                                         times = 1)
# 
# # trainIndex <- createDataPartition(test_dataset$esrb_rating, p = 0.8, 
# #                                   list = FALSE, 
# #                                   times = 1)
# # 
# # training <- test_dataset[trainIndex, ]
# # testing <- test_dataset[-trainIndex, ]
# 
# good_Train <- test_dataset[training_dataset, ]
# good_Test <- test_dataset[-training_dataset, ]
# 
# 
# head(training_dataset)
# head(good_Train)
# head(good_Test)
# 
# 
# # Train the random forest model
# library(randomForest)
# 
# 
# # colnames(good_Train2)
# 
# # good_Train <- model.matrix(~ ., data = good_Train)
# model <- randomForest(esrb_rating ~ . + 0, data = good_Train)
# 
# str(good_Train2)
# 
# # model # model # model <- randomForest(esrb_ratingET + esrb_ratingM + esrb_ratingT ~ . + 0, data = good_Train2)
# 
