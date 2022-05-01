# Autogenerated wrapper script for Luna_jll for i686-w64-mingw32-cxx03
export libluna, luna

using FFTW_jll
using Zlib_jll
JLLWrappers.@generate_wrapper_header("Luna")
JLLWrappers.@declare_library_product(libluna, "libluna.dll")
JLLWrappers.@declare_executable_product(luna)
function __init__()
    JLLWrappers.@generate_init_header(FFTW_jll, Zlib_jll)
    JLLWrappers.@init_library_product(
        libluna,
        "bin\\libluna.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        luna,
        "bin\\luna.exe",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
