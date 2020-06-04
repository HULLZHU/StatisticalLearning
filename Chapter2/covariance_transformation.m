m = 5000; % 5000 records
n = 5; % 100 features
% auto-covariance matrix - When X is 1-dimension
X = randn(m,1);
auto_cov_mat1 = cov(X);
auto_cov_mat2 = sum((X-mean(X)).*(X-mean(X)))/(m-1);

% auto-covariance matrix - When X is n-dimension
X = randn(m,5);
auto_cov_mat3 = cov(X); %使用MATLAB自带的函数
auto_cov_mat4 = zeros(n,n);

for i = 1:n %使用for-loop来进行实现
    for j = 1:n
        if(i <= j) %对称矩阵，可以减少一半计算量
            vec1 = X(:,i);
            vec2 = X(:,j);
            auto_cov_mat4(i,j) = (vec1-mean(vec1))'*(vec2-mean(vec2))/(m-1);
            auto_cov_mat4(j,i) = auto_cov_mat4(i,j);
        end
    end
end

