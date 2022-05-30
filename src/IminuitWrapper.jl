module IminuitWrapper
using PyCall: PyObject, pycall, PyNULL, PyAny, PyVector, pyimport_conda, pyimport, pytype_mapping
import PyCall: PyObject, pycall
# import PyCall: hasproperty # Base.hasproperty in Julia 1.2
import Base: convert, ==, isequal, hash, hasproperty, haskey
# using PyCall: PyNULL, pyimport, PyObject, pycall
import Conda

include("init.jl")
include("FitStructs.jl")
include("iminuit.jl")
end # module
