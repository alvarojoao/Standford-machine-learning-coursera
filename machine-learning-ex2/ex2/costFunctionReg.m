function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

soma = 0;
reg = 0;
for i = 1:m
    soma = soma+(-y(i)*log(sigmoid(X(i,:)*theta))-(1-y(i))*log(1-sigmoid(X(i,:)*theta)));
end
for n= 2:length(theta)
    reg = reg+theta(n)^2;
end
J = (1/m)*soma + (lambda/(2*m))*reg;
for j= 1:length(theta)
   grad(j) = (1/m)*sum((sigmoid(X*theta)-y).*X(:,j)) + (j>1)*(lambda/m)*theta(j);
end




% =============================================================

end