# 2025-11-20T16:33:03.877083
import vitis

client = vitis.create_client()
client.set_workspace(path="vitis_hls")

vitis.dispose()

