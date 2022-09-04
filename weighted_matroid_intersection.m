function weighted_matroid_intersection(c,@F1({args}),@F2({args}),K) % K is the maximum number of iterations that we'll allow.

k=0;X={};c1=c;c2=0*c1;                                              % Step 1 of Korte & Vygen  

for y=1:(length(c) - nnz(X))
    for i=1:2
        if ismember(y,X)==0;                                        % so far, it only works for single-element cases like {1} or {2} but not for {1,2}
            C(i,y)=union(X,y);


        end
    end
end
