function obs(G,roots,max_number_of_iterations)
  
weighted_matroid_intersection(G(:),@F1(G,roots),@F2(G,roots),max_number_of_iterations) 
