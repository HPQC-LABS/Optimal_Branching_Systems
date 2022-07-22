% This is a modified version of MATLAB's rref (from Revision: 5.9.4.3 $  $Date: 2006/01/18 21:58:54) which calculates row-reduced echelon form in GF(2).  Useful for linear codes. Tolerance was removed because YOLO, and because all values should only be 0 or 1. Original: https://gist.github.com/esromneb/652fed46ae328b17e104, Fork that prints more information: https://gist.github.com/nrenga/3c0ee3af2fb8ca38dcf9113376cae381 (Feb. 28, 2018), Fork that's more compact: https://gist.github.com/ndattani/d77e70364a988bb55701337dd525ace2 (May 30 2022)
% Returns the matrix M of row operations on A, i.e., Arref = M*A, and the matrix N of column operations which if applied to Arref results in a matrix of the form [I_rnk, 0; 0, 0] for the first m columns, where rnk is the gf(2) rank of A, i.e., (Arref*N)_{1:m,1:m} = (M*A*N)_{1:m,1:m} = [I_rnk, 0; 0, 0]. For a square matrix A, Arref*N = M*A*N = [I_rnk, 0; 0, 0].

function [Arref, M, N, rnk] = g2rref(A)

[Arref, M] = gf2redref(A);
[Ardiag, Nt] = gf2redref(Arref');
N = Nt';
rnk = sum(diag(Ardiag));

    function [Arref, Row_ops] = gf2redref(A)
        [m,n] = size(A);
        Row_ops = eye(m);
        Arref = [A, Row_ops];
        nr = size(Arref, 2);
        
        i = 1; j = 1; % Loop over the entire matrix.        
        while (i <= m) && (j <= n)
            while (Arref(i,j) == 0) && (j <= n)
                k = find(Arref(i:m,j),1) + i - 1;  % Find value and index of largest element in the remainder of column j.
                
                if (isempty(k))
                    j = j + 1;
                    continue;
                else
                    Arref([i k],j:nr) = Arref([k i],j:nr); % Swap i-th and k-th rows.
                end
            end         
            if (Arref(i,j) == 1) && (j <= n)
                aijn = Arref(i,j:nr); % Save the right hand side of the pivot row            
                col = Arref(1:m,j);   % Column we're looking at
                col(i) = 0; % Never Xor the pivot row against itself
                flip = col*aijn; % This builds an matrix of bits to flip
                Arref(1:m,j:nr) = xor( Arref(1:m,j:nr), flip ); % Xor the right hand side of the pivot row with all the other rows
                j = j + 1;
            end
            i = i + 1;
        end
        Row_ops = Arref(1:m,(n+1):nr);
        Arref = Arref(1:m,1:n);
    end
end
