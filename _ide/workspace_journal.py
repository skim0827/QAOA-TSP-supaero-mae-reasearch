# 2025-11-27T14:00:33.959507
import vitis

client = vitis.create_client()
client.set_workspace(path="QAOA-TSP-supaero-mae-reasearch")

comp = client.get_component(name="vitis_app")
comp.build()

platform = client.create_platform_component(name = "vitis_platform",hw_design = "$COMPONENT_LOCATION/../../rp_vivado/qaoa_wrapper.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0")

platform = client.get_component(name="vitis_platform")
status = platform.build()

comp.build()

