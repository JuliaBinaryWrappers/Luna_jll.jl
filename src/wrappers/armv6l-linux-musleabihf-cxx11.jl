# Autogenerated wrapper script for Luna_jll for armv6l-linux-musleabihf-cxx11
export libluna, luna

using FFTW_jll
using Zlib_jll
JLLWrappers.@generate_wrapper_header("Luna")
JLLWrappers.@declare_library_product(libluna, "libluna.so")
JLLWrappers.@declare_executable_product(luna)
function __init__()
    JLLWrappers.@generate_init_header(FFTW_jll, Zlib_jll)
    JLLWrappers.@init_library_product(
        libluna,
        "lib/libluna.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        luna,
        "bin/luna",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
