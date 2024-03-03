include("SpinSystem.jl");

# Define method to set interaction between two sites
function construct_interactions!(spin_sys::SpinSystemLL{Float64},
                                 Jx::Matrix{Float64}, 
                                 Lx::Int ,  Ly::Int,  Lz::Int,  
                                 dLx::Int, dLy::Int, dLz::Int,  
                                 b1::Int ,  b2::Int )
  for i1 = 1:Lx, j1 = 1:Ly, k1 = 1:Lz, l1 = 1:Lb
    i2 = mod1(i1 + dLx, Lx);  i2 == 0 ? i2 = Lx : i2 = i2;  
    j2 = mod1(j1 + dLy, Ly);  j2 == 0 ? j2 = Ly : j2 = j2;    
    k2 = mod1(k1 + dLz, Lz);  k2 == 0 ? k2 = Lz : k2 = k2;
    push!(spin_sys.interactions, (Jx, CartesianIndex((i1, j1, k1, b1)), CartesianIndex((i2, j2, k2, b2))))
  end
  return interactions;
end

function MagEnergy(spin_sys::SpinSystemLL{Float64})
  energy = 0.0
  for (J, idx1, idx2) in spin_sys.interactions
    energy += dot(spin_sys.dipoles[idx1,:], J * spin_sys.dipoles[idx2,:])
  end
  return energy
end