# 2025-11-20T16:53:29.418412
import vitis

client = vitis.create_client()
client.set_workspace(path="vitis_hls")

comp = client.get_component(name="rp_qaoa")
comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

comp.run(operation="PACKAGE")

vitis.dispose()

