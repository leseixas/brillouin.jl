#!/usr/bin/env julia

## brillouin.jl
#
#    Author: Leandro Seixas <seixasle@gmail.com>
#            Centre for Advanced 2D Materials (CA2DM),
#            National University of Singapore (NUS)
#            Singapore
#

using YAML
#using DataFrames
#using JulieTest
#using Gadfly

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
