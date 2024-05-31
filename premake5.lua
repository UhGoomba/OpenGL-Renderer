workspace "OGLRenderer"
    architecture "x64"
    configurations { "Debug", "Release" }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

singleheaderimplementation = { "%{wks.location}/external/stb/stb_image_implementation.cpp" }

project "OGLRenderer"
    location "OGLRenderer"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files { "%{prj.name}/src/**.h", "%{prj.name}/src/**.cpp", singleheaderimplementation }

    includedirs
    {
        "%{wks.location}/external/glm/",
        "%{wks.location}/external/glfw/include/",
        "%{wks.location}/external/glad/include/",
        "%{wks.location}/external/pugixml/include/",
        "%{wks.location}/external/fmt/include/",
        "%{wks.location}/external/imgui/include/",
        "%{wks.location}/external/assimp/assimp/include/",
        "%{wks.location}/external/assimp/_config_headers/",
        "%{wks.location}/external/stb/",
    }

    links
    {
        "glfw",
        "opengl32",
        "dwmapi",
        "glad",
        "pugixml",
        "fmt",
        "imgui",
        "assimp"
    }

    defines
    {
        "GLM_ENABLE_EXPERIMENTAL"
    }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "RELEASE" }
        optimize "On"
    
    filter { "system:windows" }
    -- Link with appropriate windows GLFW library (adjust names)
        links { "%{wks.location}/external/glfw/lib-mingw-w64/glfw3.dll" }
    filter { "system:linux" or "system:macosx" }
        -- Link with appropriate Unix GLFW library (adjust names)
        links { "glfw3" }

include "external/glfw"
include "external/glad"
include "external/pugixml"
include "external/fmt"
include "external/imgui"
include "external/assimp"