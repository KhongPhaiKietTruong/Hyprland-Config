-- This file will not be overwritten across dots-hyprland updates.
-- The file name is for the sake of organization and does not matter
-- See the corresponding files in ~/.config/hypr/hyprland for examples
---@diagnostic disable: undefined-global

-- Gỡ các phím tắt mặc định không sử dụng
hl.unbind("SUPER + Tab")
hl.unbind("CTRL + ALT + Delete")
hl.unbind("CTRL + SUPER + T")
hl.unbind("CTRL + SUPER + ALT + T")
hl.unbind("CTRL + SUPER + SHIFT + D")
hl.unbind("SUPER + G")
hl.unbind("SUPER + Period")
hl.unbind("SUPER + SHIFT + A")
hl.unbind("SUPER + SHIFT + ALT + mouse:273")
hl.unbind("CTRL + SUPER + SHIFT + ALT + W")
hl.unbind("CTRL + SUPER + V")
for i = 1, 10 do
	hl.unbind("SUPER + ALT + " .. (i % 10))
end
-- gỡ super alt + mũi tên di chuyển cửa sổ qua workspace khác
local key2 = "SUPER + ALT + mouse_"
hl.unbind(key2 .. "down")
hl.unbind(key2 .. "up")

hl.unbind("SUPER + Up")
hl.unbind("SUPER + Down")
hl.unbind("SUPER + Left")
hl.unbind("SUPER + Right")
hl.unbind("SUPER + ALT + F")
hl.unbind("SUPER + SHIFT + Page_Up")
hl.unbind("SUPER + SHIFT + Page_Down")
-- Tiện ích
-- Mở btop
hl.unbind("CTRL + SHIFT + Escape")
hl.unbind("SUPER + T")
hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty -1 fish -c btop"), { description = "Utilities: Open Task Manager" })

-- Mở File Manager
hl.unbind("SUPER + E")
hl.bind("SUPER + E", hl.dsp.exec_cmd("kitty -1 fish -c yazi"), { description = "App: File manager" })
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd("thunar"), { description = "App: File manager" })

-- Chụp màn hình
hl.unbind("SUPER + SHIFT + S")
hl.bind("SUPER + Grave", hl.dsp.global("quickshell:regionScreenshot"), { description = "Utilities: Screen snip" })
hl.bind("SUPER + SHIFT + Grave", hl.dsp.exec_cmd("flameshot gui"), { description = "Utilities: Screen snip" })

-- Chỉnh phím tắt cửa sổ
-- togglesplit window
hl.bind("SUPER + U", hl.dsp.layout("togglesplit"))

-- Move focus window (Vim keys)
hl.unbind("SUPER + H")
hl.unbind("SUPER + J")
hl.unbind("SUPER + K")
hl.unbind("SUPER + L")
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))

-- Move window / Swap window
hl.unbind("SUPER + SHIFT + H")
hl.unbind("SUPER + SHIFT + J")
hl.unbind("SUPER + SHIFT + K")
hl.unbind("SUPER + SHIFT + L")
hl.bind("SUPER + SHIFT + L", hl.dsp.window.swap({ direction = "right" }), { description = "Window: Swap right" })
hl.bind("SUPER + SHIFT + H", hl.dsp.window.swap({ direction = "left" }), { description = "Window: Swap left" })
hl.bind("SUPER + SHIFT + K", hl.dsp.window.swap({ direction = "up" }), { description = "Window: Swap up" })
hl.bind("SUPER + SHIFT + J", hl.dsp.window.swap({ direction = "down" }), { description = "Window: Swap down" })

-- Gửi workspace qua chỗ khác (Rút gọn bằng vòng lặp Lua API)
for i = 1, 10 do
	local key_code = 9 + i -- code:10 tương ứng với số 1, code:19 tương ứng với số 10
	hl.bind(
		"SUPER + SHIFT + code:" .. key_code,
		hl.dsp.window.move({ workspace = tostring(i) }),
		{ description = "Move window to workspace " .. i }
	)
end
-- Lock máy tính
hl.unbind("SUPER + O")
hl.bind("SUPER + O", hl.dsp.exec_cmd("loginctl lock-session"), { description = "System: Lock session" })

-- Vào session hệ thống (tắt, reboot, ...)
hl.bind("SUPER + Escape", hl.dsp.global("quickshell:sessionToggle"), { description = "Shell: Toggle session menu" })

-- Gửi vào scratchpad
hl.unbind("SUPER + ALT + S")
hl.bind(
	"SUPER + SHIFT + S",
	hl.dsp.window.move({ workspace = "special:special", follow = false }),
	{ description = "Window: Send to scratchpad" }
)

hl.bind(
	"CTRL + SUPER + P",
	hl.dsp.exec_cmd("qs -c ii ipc call panelFamily cycle"),
	{ description = "Shell: toggle panelFamily" }
)
