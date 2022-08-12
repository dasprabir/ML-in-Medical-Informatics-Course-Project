function [theta_new, J_history] = gradientDescent(X, y, theta, alpha, num_iters)

%   GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

%   Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================

prediction = X*theta;
sumerr = sum((prediction-y).^2);
J = (sumerr)/(2*m);
J_history(iter) = J;
% theta(1) = theta(1) - (alpha/m)*sum((prediction-y).*X(:,1));
% theta(2) = theta(2) - (alpha/m)*sum((prediction-y).*X(:,2));
for i = 1:size(X,2)
theta(i) = theta(i) - (alpha/m)*sum((prediction - y).*X(:,i));
theta_new(iter,i)=theta(i);
end;


    %   Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    %   Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %


    % ============================================================
    % Save the theta values per iteration
%     theta_new(iter,1)=theta(1);
%     theta_new(iter,2)=theta(2);
    % Save the cost J in every iteration    
    J_history(iter,1) = computeCost(X, y, theta);

end
%
end
