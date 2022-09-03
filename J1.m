function are_we_in_J1 = J1(G,roots)                                                       % G is the incidence matrix, "roots" tells us which vertices are roots.

G_incoming = G>0                                                                          % Remove all outgoing edges from G
G_incoming_to_roots = roots'.*G_incoming                                                  % Remove all edges not entering a root
Are_any_edges_entering_a_root=sum(sum(G_incoming_to_roots))>0                             % non-0 if there's edges entering a root, 0 otherwise.
% Are_any_edges_entering_a_root = sum(sum(roots'.*(G>0)))>0                               % non-0 if there's edges entering a root, 0 otherwise. [more compact]
  
G_incoming_to_nonRoots  = (1-roots)'.*G_incoming                                          % Remove all edges not entering a non-root
Are_more_than_k_edges_entering_a_nonRoot = sum(sum(G_incoming_to_nonRoots,2)>nnz(roots))  % non-0 if there's more than k edges entering any non-root, 0 otherwise.
% Are_more_than_k_edges_entering_a_nonRoot = sum(sum((1-roots)'.*(G>0),2)>nnz(roots))     % non-0 if there's more than k edges entering any non-root, 0 otherwise. [more comapct]
  
are_we_in_J1 = (Are_any_edges_entering_a_root+Are_more_than_k_edges_entering_a_nonRoot)<1 % 1 if the input is in J1, 0 otherwise.
