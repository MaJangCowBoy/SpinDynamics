mutable struct SpinSystemLL{T}
  Lx::Int
  Ly::Int
  Lz::Int
  Lb::Int
  dipoles::Array{T, 5}
  interactions::Vector{Tuple{Matrix{Float64}, CartesianIndex, CartesianIndex}}
  # List of interacting site pairs with interaction matrix J_matrix
end

function SpinSystem(; Lx = 0, Ly = 0, Lz = 0, Lb = 0, dipoles = zeros(Float64, 0, 0, 0, 0, 0), interactions = [])
  return SpinSystemLL{Float64}(Lx, Ly, Lz, Lb, dipoles, interactions)
end