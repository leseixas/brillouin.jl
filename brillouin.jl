#!/usr/bin/env julia

lattice_constant = 2.47

bravais = [ sqrt(3)/2  1/2 0.0;
            sqrt(3)/2 -1/2 0.0;
            0.0  0.0 10.0 ]

bravais_lattice = lattice_constant*bravais

reciprocal_lattice = 2π*inv(bravais_lattice)'

G( n::Integer ) = reciprocal_lattice[n,:]

g_neighbors = collect( [ x*G(1)+y*G(2)+z*G(3) for x=-1:1:1, y=-1:1:1, z=-1:1:1 ] )


##
## Monkhorst-Pack algorithm
##

#gamma_shift( n::Vector ) = map(int,map(iseven,n))

mp_point( x::Integer, l::Integer ) = (2*x - 1 - l)/(2*l)

mp_point_shift( x::Integer, l::Integer ) = ( 2*x - 1 - l + Int(iseven(l)))/(2*l)

# Monkhorst-Pack algorithm in crystallographic coordinates
mp_crystal( n::Vector ) = collect([ [ mp_point(i, n[1]), mp_point(j, n[2]), mp_point(k, n[3]) ] for i=1:n[1], j=1:n[2], k=1:n[3] ])

mp_crystal_sort( n::Vector ) = sort( mp_crystal(n), by=norm )

gamma_crystal( n::Vector ) = collect([ [ mp_point_shift(i, n[1]), mp_point_shift(j, n[2]), mp_point_shift(k, n[3]) ] for i=1:n[1], j=1:n[2], k=1:n[3] ])

gamma_crystal_sort( n::Vector ) = sort( gamma_crystal(n), by=norm )

#function gamma_crystal
#end

# Counter of k-points in BZ
#  num_k( n::Vector ) = length( mp_crystal(n) )

# Converstion of k-points to cartesian coordinates
mp_cart( n::Vector ) = [ reciprocal_lattice'*mp_crystal(n)[i] for i=1:length(mp_crystal(n)) ]

gamma_cart( n::Vector ) = [ reciprocal_lattice'*gamma_crystal(n)[i] for i=1:length(gamma_crystal(n)) ]

# sorting k-points by norm

mp_cart_sort( n::Vector ) = sort( mp_cart(n), by=norm )

gamma_cart_sort( n::Vector ) = sort( gamma_cart(n), by=norm )

kvec = gamma_cart_sort([10,10,1])

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
