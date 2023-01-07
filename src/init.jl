# Adapting from https://github.com/fkguo/IMinuit.jl/blob/master/src/init.jl

const iminuit = PyNULL()
const mMinuit = PyNULL()
const iminuit_version = "iminuit==2.18.0"

function __init__()
    msg = ""

    # test if iminuit=2.18.0 installed
    try
        _version = pyimport("iminuit").__version__
        if _version != "2.18.0"
            msg = "The current version of iminuit is $_version and it will be changed to 2.18.0!"
        end
    catch
        msg = "There is no iminuit found in the current python path and iminuit=2.18.0 will be installed."
    end


    if msg != ""
        # install iminuit=2.18.0
        println(msg)
        if (!haskey(ENV, "PYTHON") || ENV["PYTHON"] == "")
            Conda.add("iminuit=2.18.0")
        else
            cmd = [ENV["PYTHON"], "-m", "pip", "install", iminuit_version]
            run(`$cmd`)
        end
    end

    #initialize iminuit and mMinuit;iminuit.Minuit==mMinuit
    copy!(iminuit, pyimport("iminuit"))
    copy!(mMinuit, iminuit.Minuit)
end