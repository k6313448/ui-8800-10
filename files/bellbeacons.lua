module("luci.controller.bellbeacons", package.seeall)
function index()
	entry({"admin", "services"}, cbi("bellbeacons"), _("Bluetooth Sniffer"), 99).dependent = true
end
