% Examples matroids: M1=(E,F1) and M2=(E,F2) where E={1,2,3},F1={0,{1},{2},{1,2}),F2={0,{1},{2},{3}}

N=3;                           % number of elements in E.
K=10;                          % number of iterations k.
c=rand(N,1);                   % randomly assign real-number weights (c) to the elements of E.
F1={{},{1}, {2}, {1,2}};       % for the example in line 1, this would be F1. the integers indicate indices of c.
F2={{},{1}, {2}, {3}};         % for the example in line 1, this would be F2. the integers indicate indices of c.

k=0;X=0;c1=zeros(N,1);c2=c1; 
for y=1:(N - nnz(X))
    for i=1:2
        if ismember(y,X)==0;   % so far, it only works for single-element cases like {1} or {2} but not for {1,2}
            C(i,y)=union(X,y);
            
            
    end
end
