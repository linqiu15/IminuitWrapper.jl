function Minuit(fcn::Function, args...; kwds...)::Fit
    return mMinuit(fcn, args...; kwds...)
end

function migrad(f::Fit; ncall=0, iterate=5)
    #ncall:default 0 in official setting
    pycall(f.migrad, PyObject, ncall, iterate)
end

function minos(f::Fit, paras...)#; cl=(0.68), ncall=0)
    pycall(f.minos, PyObject, paras...)#, cl, ncall)
end
