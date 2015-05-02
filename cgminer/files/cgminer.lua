m = Map("cgminer", translate("Configuration"), translate(""))

conf = m:section(TypedSection, "cgminer", "")
conf.anonymous = true
conf.addremove = false

conf:tab("default", translate("General Settings"))

pool1url = conf:taboption("default", Value, "pool1url", translate("Pool 1"))
pool1user = conf:taboption("default", Value, "pool1user", translate("Pool1 worker"))
pool1pw = conf:taboption("default", Value, "pool1pw", translate("Pool1 password"))
conf:taboption("default", DummyValue, "", translate(""))
pool2url = conf:taboption("default", Value, "pool2url", translate("Pool 2"))
pool2user = conf:taboption("default", Value, "pool2user", translate("Pool2 worker"))
pool2pw = conf:taboption("default", Value, "pool2pw", translate("Pool2 password"))
conf:taboption("default", DummyValue, "", translate(""))
pool3url = conf:taboption("default", Value, "pool3url", translate("Pool 3"))
pool3user = conf:taboption("default", Value, "pool3user", translate("Pool3 worker"))
pool3pw = conf:taboption("default", Value, "pool3pw", translate("Pool3 password"))
conf:taboption("default", DummyValue, "", translate(""))

pb = conf:taboption("default", ListValue, "pool_balance", translate("Pool Balance(Default: Failover)"))
pb.default = "  "
pb:value("  ", translate("Failover"))
pb:value("--balance", translate("Balance"))
pb:value("--load-balance", translate("Load Balance"))

pb = conf:taboption("default", ListValue, "bitmain_nobeeper", translate("Beeper ringing(Default: true)"))
pb.default = "  "
pb:value("  ", translate("true"))
pb:value("--bitmain-nobeeper", translate("false"))

pb = conf:taboption("default", ListValue, "bitmain_notempoverctrl", translate("Stop running when temprerature is over 80 degrees centigrade(Default: true)"))
pb.default = "  "
pb:value("  ", translate("true"))
pb:value("--bitmain-notempoverctrl", translate("false"))

--cf = conf:taboption("default", Value, "chip_frequency", translate("Chip Frequency(Default: 300)"))
--mc = conf:taboption("default", Value, "miner_count", translate("Miner Count(Default: 24)"))
--api_allow = conf:taboption("default", Value, "api_allow", translate("API Allow(Default: W:127.0.0.1)"))
--target=conf:taboption("default", Value, "target", translate("Target Temperature"))
--overheat=conf:taboption("default", Value, "overheat", translate("Overheat Cut Off Temperature"))
--more_options = conf:taboption("default", Value, "more_options", translate("More Options(Default: --quiet)"))

conf:tab("advanced", translate("Advanced Settings"))
pb = conf:taboption("advanced", ListValue, "freq", translate("Frequency")) 
pb.default = "18:218.75:1106"
pb:value("16:250:0982", translate("250M"))
pb:value("17:243.75:1306", translate("243.75M"))
pb:value("17:237.5:1286", translate("237.5M"))
pb:value("17:231.25:1206", translate("231.25M"))
pb:value("18:225:0882", translate("225M (S3+ default)"))
pb:value("18:218.75:1106", translate("218.75M (S3 default)")) 
pb:value("18:212.5:1086", translate("212.5M"))
pb:value("19:206.25:1006", translate("206.25M"))
pb:value("20:200:0782", translate("200M"))
pb:value("20:196:1f07", translate("196M"))
pb:value("20:193:0f03", translate("193M"))
pb:value("23:175:0d83", translate("175M"))
pb:value("27:150:0b83", translate("150M")) 
pb:value("33:125:0983", translate("125M"))
pb:value("40:100:0783", translate("100M"))
  
pb = conf:taboption("advanced", Value, "voltage", translate("voltage"),"Modify voltage, clkick Save &#38; Apply, and then re-power the miner.")
pb.default = "0000"
return m
