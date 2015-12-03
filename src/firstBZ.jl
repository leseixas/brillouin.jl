## First Brillouin Zone

#function fbz_filter(n)
#  ks_set = Set()
#  for g=1:length(g_neighbors)
#    if dot(n,collect(g_neighbors[g]))/2 < norm(g_neighbors[g])/4
#    then
#     push!(ks_set,n)
#    end
#  end
#  return collect(ks_set)
#end
