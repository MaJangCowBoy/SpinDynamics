using StaticArrays
using LinearAlgebra
include("SpinSystem.jl");
include("Interactions.jl");

Lx = 10;  Ly = 10;  Lz = 3;  Lb = 2;
S = 1.5;  ene = 0.0;
dipoles = zeros(Float64, Lx, Ly, Lz, Lb, 3);  dipoles[:, :, :, :, 3] .= S;
interactions = Vector{Tuple{Matrix{Float64}, CartesianIndex, CartesianIndex}}()

# Create a SpinSystemLL instance
spin_sys = SpinSystemLL(Lx, Ly, Lz, Lb, dipoles, interactions)

# or use the constructor function
ss = SpinSystem(; Lx = Lx, Ly = Ly, Lz = Lz, Lb = Lb, dipoles = dipoles, interactions = interactions)

# Construct the list of interacting site pairs
J1 = 1.2;  Jmat = J1 * Matrix{Float64}(I, 3, 3);
construct_interactions!(ss,Jmat, Lx, Ly, Lz, 1, 0, 0, 1, 1)
construct_interactions!(ss,Jmat, Lx, Ly, Lz, 0, 1, 0, 1, 1)
construct_interactions!(ss,Jmat, Lx, Ly, Lz, 1, 1, 0, 1, 1)

MagEnergy(ss)