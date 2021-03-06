module LibCURL

typealias time_t Int
typealias size_t Csize_t
typealias curl_off_t Int64

include("lC_exports_h.jl")
include("lC_common_h.jl")


libcurl = :libcurl

include("lC_curl_h.jl")

curl_easy_setopt(handle, opt, ptrval::Array) = ccall((:curl_easy_setopt, "libcurl"), CURLcode, (Ptr{CURL}, CURLoption, Ptr{Void}), handle, opt, pointer(ptrval))  
curl_easy_setopt(handle, opt, ptrval::Integer) = ccall((:curl_easy_setopt, "libcurl"), CURLcode, (Ptr{CURL}, CURLoption, Clong), handle, opt, ptrval)  
curl_easy_setopt{T}(handle, opt, ptrval::Ptr{T}) = ccall((:curl_easy_setopt, "libcurl"), CURLcode, (Ptr{CURL}, CURLoption, Ptr{T}), handle, opt, ptrval)  
curl_easy_setopt(handle, opt, ptrval::String) = ccall((:curl_easy_setopt, "libcurl"), CURLcode, (Ptr{CURL}, CURLoption, Ptr{Uint8}), handle, opt, ptrval)  
# @c CURLcode curl_easy_setopt (Ptr{CURL}, CURLoption, Clong...) libcurl
# @c CURLcode curl_easy_setopt (Ptr{CURL}, CURLoption,Ptr{Void}...) libcurl
# @c CURLcode curl_easy_setopt (Ptr{CURL}, CURLoption,Ptr{Uint8}...) libcurl

curl_multi_setopt(handle, opt, ptrval::Array) = ccall((:curl_multi_setopt, "libcurl"), CURLMcode, (Ptr{CURLM}, CURLMoption, Ptr{Void}), handle, opt, pointer(ptrval))  
curl_multi_setopt(handle, opt, ptrval::Integer) = ccall((:curl_multi_setopt, "libcurl"), CURLMcode, (Ptr{CURLM}, CURLMoption, Clong), handle, opt, ptrval)  
curl_multi_setopt{T}(handle, opt, ptrval::Ptr{T}) = ccall((:curl_multi_setopt, "libcurl"), CURLMcode, (Ptr{CURLM}, CURLMoption, Ptr{T}), handle, opt, ptrval)  
curl_multi_setopt(handle, opt, ptrval::String) = ccall((:curl_multi_setopt, "libcurl"), CURLMcode, (Ptr{CURLM}, CURLMoption, Ptr{Uint8}), handle, opt, ptrval)  
# @c CURLcode curl_multi_setopt (Ptr{CURL}, CURLoption, Clong...) libcurl
# @c CURLcode curl_multi_setopt (Ptr{CURL}, CURLoption,Ptr{Void}...) libcurl
# @c CURLcode curl_multi_setopt (Ptr{CURL}, CURLoption,Ptr{Uint8}...) libcurl

curl_easy_getinfo(handle, opt, ptrval::Array) = ccall((:curl_easy_getinfo, "libcurl"), CURLcode, (Ptr{CURL}, CURLoption, Ptr{Void}), handle, opt, pointer(ptrval))  
curl_easy_getinfo(handle, opt, ptrval::String) = ccall((:curl_easy_getinfo, "libcurl"), CURLcode, (Ptr{CURL}, CURLoption, Ptr{Uint8}), handle, opt, ptrval)  
# @c CURLcode curl_easy_getinfo (Ptr{CURL}, CURLoption,Ptr{Clong}...) libcurl
# @c CURLcode curl_easy_getinfo (Ptr{CURL}, CURLoption,Ptr{Cdouble}...) libcurl
# @c CURLcode curl_easy_getinfo (Ptr{CURL}, CURLoption,Ptr{Uint8}...) libcurl

include("lC_defines_h.jl")

include("Mime_ext.jl")
export Mime_ext

end
