# Autogenerated wrapper script for Luna_jll for aarch64-linux-musl-cxx11
export libluna, luna

using FFTW_jll
using Zlib_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libluna`
const libluna_splitpath = ["lib", "libluna.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libluna_path = ""

# libluna-specific global declaration
# This will be filled out by __init__()
libluna_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libluna = "libluna.so"


# Relative path to `luna`
const luna_splitpath = ["bin", "luna"]

# This will be filled out by __init__() for all products, as it must be done at runtime
luna_path = ""

# luna-specific global declaration
function luna(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(luna_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Luna")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (FFTW_jll.PATH_list, Zlib_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (FFTW_jll.LIBPATH_list, Zlib_jll.LIBPATH_list,))

    global libluna_path = normpath(joinpath(artifact_dir, libluna_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libluna_handle = dlopen(libluna_path)
    push!(LIBPATH_list, dirname(libluna_path))

    global luna_path = normpath(joinpath(artifact_dir, luna_splitpath...))

    push!(PATH_list, dirname(luna_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

