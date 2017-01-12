function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

%Defining values of C and sigma to test
C_test = [0.01 0.03 0.1 0.3 1 3 10 30]';

sigma_test = [0.01 0.03 0.1 0.3 1 3 10 30]';

min_prediction_error = 1000000000000;

%Nested for-loops to test all combinations of C and sigma
for i = 1:length(C_test)
    
    for j = 1:length(sigma_test)
        
        %SVM model trained for each C and Sigma combination
        model = svmTrain(X,y, C_test(i), @(x1, x2) gaussianKernel(x1, x2, sigma_test(j)));
        
        predictions = svmPredict(model, Xval);
        
        %Prediction error calculated for each C and sigma combination
        prediction_error = mean(double(predictions ~= yval));
        
        %If prediction error is smaller than any previous, store that error
        %as well as corresponding i and j values
        if prediction_error < min_prediction_error
            
            min_prediction_error = prediction_error;
            
            min_Csigma = [i j];
            
        end
        
    end 
    
    
end

%Setting corresponding C and sigma values that minimize prediction error on
%the training set

C = C_test(min_Csigma(1));
sigma = sigma_test(min_Csigma(2));



% =========================================================================

end
