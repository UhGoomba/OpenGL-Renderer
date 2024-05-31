
project(OGLRenderer VERSION 1.0.0)

set(SOURCE_FILES
	src/main.cpp
)

set(IMGUI_SOURCES
    ${CMAKE_SOURCE_DIR}/external/imgui/imgui.cpp
    ${CMAKE_SOURCE_DIR}/external/imgui/imgui_demo.cpp
    ${CMAKE_SOURCE_DIR}/external/imgui/imgui_draw.cpp
    ${CMAKE_SOURCE_DIR}/external/imgui/imgui_tables.cpp
    ${CMAKE_SOURCE_DIR}/external/imgui/imgui_widgets.cpp
	${CMAKE_SOURCE_DIR}/external/imgui/backends/imgui_impl_opengl3.cpp
	${CMAKE_SOURCE_DIR}/external/imgui/backends/imgui_impl_glfw.cpp
)

set(SINGLE_HEADER_IMPLEMENTATION
	${CMAKE_SOURCE_DIR}/external/stb/stb_image_implementation.cpp
)

add_executable(${PROJECT_NAME} ${SOURCE_FILES} ${SINGLE_HEADER_IMPLEMENTATION} ${IMGUI_SOURCES})

# copy resources folder
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy resources $<TARGET_FILE_DIR:${PROJECT_NAME}>/resources)

# link and inculde
target_link_libraries(${PROJECT_NAME} PUBLIC glad glfw assimp glm fmt pugixml OpenGL::GL)
target_include_directories(${PROJECT_NAME} PUBLIC src ${CMAKE_SOURCE_DIR}/external/imgui ${CMAKE_SOURCE_DIR}/external/stb/include)