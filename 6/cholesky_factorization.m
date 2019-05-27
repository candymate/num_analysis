
function [L, D] = cholesky_factorization(A)
    [asize, ~] = size(A);
    v = zeros(1, asize);
    L = eye(asize);
    D = zeros(1, asize);
    for i = 1:asize
        for j = 1:i-1
            v(j) = L(i,j)*D(j);
        end
        D(i) = A(i,i);
        for j = 1:i-1
            D(i) = D(i) - L(i,j)*v(j);
        end
        for j = i+1:asize
            L(j,i) = A(j,i);
            for k = 1:i-1
                L(j,i) = L(j,i) - L(j,k)*v(k);
            end
            L(j,i) = L(j,i) / D(i);
        end
    end
    D = diag(D);