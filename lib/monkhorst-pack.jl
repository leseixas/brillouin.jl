##
## Monkhorst-Pack algorithm
##

#gamma_shift( k::Vector ) = map(int,map(iseven,k))

mp_point( x::Integer, l::Integer ) = (2*x - 1 - l)/(2*l)

mp_point_shift( x::Integer, l::Integer ) = ( 2*x - 1 - l + Int(iseven(l)))/(2*l)

# Monkhorst-Pack algorithm in crystallographic coordinates
mp_crystal( n::Vector ) = collect([ [ mp_point(i, n[1]), mp_point(j, n[2]), mp_point(k, n[3]) ] for i=1:n[1], j=1:n[2], k=1:n[3] ])

mp_crystal_sort( k::Vector ) = sort( mp_crystal(k), by=norm )

gamma_crystal( n::Vector ) = collect([ [ mp_point_shift(i, n[1]), mp_point_shift(j, n[2]), mp_point_shift(k, n[3]) ] for i=1:n[1], j=1:n[2], k=1:n[3] ])

gamma_crystal_sort( k::Vector ) = sort( gamma_crystal(k), by=norm )

#function gamma_crystal
#end

# Counter of k-points in BZ
#  num_k( n::Vector ) = length( mp_crystal(n) )

# Converstion of k-points to cartesian coordinates
mp_cart( n::Vector ) = [ reciprocal_lattice'*mp_crystal(n)[i] for i=1:length(mp_crystal(n)) ]

gamma_cart( k::Vector ) = [ reciprocal_lattice'*gamma_crystal(k)[i] for i=1:length(gamma_crystal(k)) ]

# sorting k-points by norm

mp_cart_sort( k::Vector ) = sort( mp_cart(k), by=norm )

gamma_cart_sort( k::Vector ) = sort( gamma_cart(k), by=norm )
