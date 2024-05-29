#pragma once

#include "imgui/imgui.h"

/***********************************************************************************/
// Forward Declarations 
struct GLFWwindow;
struct FrameStats;

/***********************************************************************************/
class GUISystem {
public:
	GUISystem() noexcept = default;

	GUISystem(GUISystem&&) = delete;
	GUISystem(const GUISystem&) = delete;
	GUISystem& operator=(GUISystem&&) = delete;
	GUISystem& operator=(const GUISystem&) = delete;

	void Init(GLFWwindow* windowPtr);
	void Render(const int framebufferWidth,
		const int framebufferHeight,
		const FrameStats& frameStats);
	void Shutdown() const;

private:
	ImGuiIO& io;
};
