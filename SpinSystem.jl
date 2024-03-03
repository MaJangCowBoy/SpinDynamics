mutable struct SpinSystemLL{T}
  Lx::Int
  Ly::Int
  Lz::Int
  Lb::Int
  dipoles::Array{T, 5}
  energy::Float64  
  # Total energy of the system
  interactions::Vector{Tuple{Matrix{Float64}, CartesianIndex, CartesianIndex}}
  # List of interacting site pairs with interaction matrix J_matrix
end

function SpinSystem()
  return SpinSystemLL{Float64}(0, 0, 0, 0, zeros(Float64, 0, 0, 0, 0, 0), 0.0, [])
end