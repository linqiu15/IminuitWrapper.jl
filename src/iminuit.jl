abstract type AbstractMinuit end

struct Minuit <: AbstractMinuit
    o::PyObject
end

struct MigradAndHesse <: AbstractMinuit
    errordef::Float64
end


const LEAST_SQUARES = MigradAndHesse(mMinuit.LEAST_SQUARES)
const LIKELIHOOD = MigradAndHesse(mMinuit.LIKELIHOOD)


function Minuit(fcn, pars; optimizer::MigradAndHesse=LEAST_SQUARES)::Minuit
    o = mMinuit(fcn, pars)
    o.errordef = optimizer.errordef
    o
end

function migrad(o::Minuit)
    pycall(o.migrad, PyObject)
end

function hesse(o::Minuit)
    pycall(o.hesse, PyObject)
end

function minos(o::Minuit)
    pycall(o.minos, PyObject)
end