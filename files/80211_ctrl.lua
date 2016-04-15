module("luci.controller.80211_ctrl", package.seeall)
function index()
	entry({"admin", "mesh_80211"}, cbi("80211_cbi"), _("Bellnet Mesh"), 100)
end