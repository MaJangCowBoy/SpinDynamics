using StaticArrays
using LinearAlgebra
include("SpinSystem.jl");
include("Interactions.jl");

Lx = 10;  Ly = 10;  Lz = 3;  Lb = 2;
S = 1.5;  ene = 0.0;
dipoles = zeros(Float64, Lx, Ly, Lz, Lb, 3);  dipoles[:, :, :, :, 3] .= S;
interactions = Vector{Tuple{Matrix{Float64}, CartesianIndex, CartesianIndex}}()
# Create a SpinSystemLL instance
spin_sys = SpinSystemLL(Lx, Ly, Lz, Lb, dipoles, ene, interactions)

# Construct the list of interacting site pairs
Jmat = [1.2 0 0; 0 1.2 0; 0 0 1.2];
construct_interactions!(spin_sys,Jmat, Lx, Ly, Lz, 1, 0, 0, 1, 1)
construct_interactions!(spin_sys,Jmat, Lx, Ly, Lz, 0, 1, 0, 1, 1)
construct_interactions!(spin_sys,Jmat, Lx, Ly, Lz, 1, 1, 0, 1, 1)

MagEnergy(spin_sys)