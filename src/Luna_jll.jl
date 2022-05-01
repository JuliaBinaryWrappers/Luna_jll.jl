# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule Luna_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("Luna")
JLLWrappers.@generate_main_file("Luna", UUID("5c9374ce-fdac-595e-b98d-9d97a97a2302"))
end  # module Luna_jll
