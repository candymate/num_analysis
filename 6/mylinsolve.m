
% b must be column vector
function [x, L, U, P] = mylinsolve(A, b)
    [asize, ~] = size(A);
    P = eye(asize);
    T = [A b];
    
    for i = 1:asize-1
        % partial pivoting
        % if 1 row is left, we have to make it as exception
        % but for coding, I just added 1 zero row
        [~,I] = max([abs(T(i:asize,:)); zeros(1,asize+1)]);
        disp(I);
        disp(T);
        % row exchange
        if i ~= I(i)+i-1
            T([i I(i)+i-1],:) = T([I(i)+i-1 i],:);
            P([i I(i)+i-1],:) = P([I(i)+i-1 i],:); 
        end
        disp(T);
        
        for j = i+1:asize
            temp = T(j,i)/T(i,i);
            T(j,i+1:asize+1) = T(j,i+1:asize+1) - ...
                               T(i,i+1:asize+1)*temp;
            T(j,i) = temp;
        end
        disp(T);
    end
    
    L = eye(asize);
    U = zeros(asize);
    for i = 1:asize
        U(i,i:asize) = T(i,i:asize);
    end
    for i = 1:asize-1
        L(i+1,1:i) = T(i+1,1:i);
    end
    
    % perform back substitution
    x = T(:,asize+1);
    for i = 1:asize-1
        ir = asize - i + 1;
        for j = 1:ir-1
            x(j) = x(j) - x(ir)*T(j,ir)/T(ir,ir);
        end
    end
    for i = 1:asize
        x(i) = x(i)/T(i,i);
    end
end
