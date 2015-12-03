#!/usr/bin/env julia

include("lib/monkhorst-pack.jl")

lattice_constant = 2.47

bravais = [ sqrt(3)/2  1/2 0.0;
            sqrt(3)/2 -1/2 0.0;
            0.0  0.0 10.0 ]

bravais_lattice = lattice_constant*bravais

reciprocal_lattice = 2π*inv(bravais_lattice)'

G( n::Integer ) = reciprocal_lattice[n,:]

g_neighbors = collect( [ x*G(1)+y*G(2)+z*G(3) for x=-1:1:1, y=-1:1:1, z=-1:1:1 ] )


#for i in 1:length(kvec)
#  @printf("%14.8f%14.8f%14.8f\n", kvec[i]...)
#end

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
