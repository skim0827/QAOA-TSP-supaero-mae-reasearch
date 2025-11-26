# 2025-11-20T16:22:22.781734
import vitis

client = vitis.create_client()
client.set_workspace(path="vitis_hls")

vitis.dispose()

