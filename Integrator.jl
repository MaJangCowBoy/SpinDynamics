function LLD_step!(spin_array::SpinSystem{T}, heff::Array{T, 5}, dt::Float64) where T
    dims = spin_array.dimensions
    x, y, z, b = dims
    for i in 1:x, j in 1:y, k in 1:z, l in 1:b
      s = spin_array.data[i, j, k, l, :]
      h_eff = heff[i, j, k, l, :]
      dsdt = cross(s, h_eff)
      spin_array.data[i, j, k, l, :] += dt * dsdt
    end
  end