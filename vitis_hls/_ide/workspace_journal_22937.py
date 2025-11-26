# 2025-11-19T14:01:13.183435
import vitis

client = vitis.create_client()
client.set_workspace(path="vitis_hls")

comp = client.create_hls_component(name = "rp_qaoa",cfg_file = ["hls_config.cfg"],template = "empty_hls_component")

comp = client.get_component(name="rp_qaoa")
comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

vitis.dispose()

