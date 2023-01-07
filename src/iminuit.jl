abstract type AbstractMinuit end

struct Minuit <: AbstractMinuit
    o::PyObject
end


function Minuit(fcn, pars; optimizer=1.0)::Minuit
    o = mMinuit(fcn, pars)
    o.errordef = optimizer
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