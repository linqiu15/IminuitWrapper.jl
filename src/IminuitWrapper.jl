module IminuitWrapper
using PyCall
import Conda

include("init.jl")
include("iminuit.jl")
end # module
