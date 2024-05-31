cmake_minimum_required(VERSION 3.1.0)
cmake_policy(SET CMP0072 NEW)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED YES) # Enforce the C++17 standard

set(BUILD_ASSIMP_TOOLS  ON)
set(ASSIMP_BUILD_STATIC_LIB ON)
set(ASSIMP_WARNINGS_AS_ERRORS OFF)

add_subdirectory(${CMAKE_SOURCE_DIR}/external/glad/)
add_subdirectory(${CMAKE_SOURCE_DIR}/external/glfw/)
add_subdirectory(${CMAKE_SOURCE_DIR}/external/glm/)
add_subdirectory(${CMAKE_SOURCE_DIR}/external/fmt/)
add_subdirectory(${CMAKE_SOURCE_DIR}/external/assimp/)
add_subdirectory(${CMAKE_SOURCE_DIR}/external/pugixml/)

find_package(OpenGL REQUIRED)

add_subdirectory(${CMAKE_SOURCE_DIR}/OGLRenderer)