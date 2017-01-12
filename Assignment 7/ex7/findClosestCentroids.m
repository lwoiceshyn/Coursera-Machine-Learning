function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

%Go through every example
for i = 1:size(X,1)
    
    c = zeros(K,1);
    
    %Compare the example's distance to each centroid
    for j = 1:K
        %This nested loop allows features of any dimension to be evaluated
        for l = 1:size(X,2)
        c(j) = c(j) + (X(i,l)-centroids(j,l))^2; 
        end
        c(j) = sqrt(c(j))^2;
    end
    
    %Finds which centroid distance is the smallest
    [C D] = min(c);
    
    %Assigns that centroid to the index vector
    idx(i) = D;
end





% =============================================================

end

