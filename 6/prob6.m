clear;

A1 = [4 -1 1; -1 3 0; 1 0 2];
[L1,D1] = cholesky_factorization(A1);
A2 = [4 2 2; 2 6 2; 2 2 5];
[L2,D2] = cholesky_factorization(A2);
A3 = [4 0 2 1; 0 3 -1 1; 2 -1 6 3; 1 1 3 8];
[L3,D3] = cholesky_factorization(A3);
A4 = [4 1 1 1; 1 3 0 -1; 1 0 2 1; 1 -1 1 4];
[L4,D4] = cholesky_factorization(A4);

% print out results
disp("problem a"); disp("L"); disp(L1); disp("D"); disp(D1);
disp("problem b"); disp("L"); disp(L2); disp("D"); disp(D2);
disp("problem c"); disp("L"); disp(L3); disp("D"); disp(D3);
disp("problem d"); disp("L"); disp(L4); disp("D"); disp(D4);

% check if result is correct (result must be ones(n,n))
%L1*D1*L1' == A1
%L2*D2*L2' == A2
%L3*D3*L3' == A3
%L4*D4*L4' == A4
