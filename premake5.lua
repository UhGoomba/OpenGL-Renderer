workspace "OGLRenderer"
    architecture "x64"
    configurations { "Debug", "Release" }

OutputDir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "OGLRenderer"
    location "OGLRenderer"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. OutputDir .. "/%{prj.name}")
    objdir ("bin-obj/" .. OutputDir .. "/%{prj.name}")

    files { "%{prj.name}/src/**.h", "%{prj.name}/src/**.cpp" }

    includedirs
    {
        "%{wks.location}/external/glm/"
    }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "RELEASE" }
        optimize "On"