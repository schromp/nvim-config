#!/usr/bin/env python
import sys, base64, nacl.public, subprocess

# Define your 1Password account domain
OP_ACCOUNT = "check24individualreisen.1password.com"
# Fetch secret key from 1Password
secret_key_base64 = subprocess.check_output([
    "op", "--account", OP_ACCOUNT, "read", "op://admin/salt-nacl/sk"
], text=True).strip()

sk_bytes = base64.b64decode(secret_key_base64)
sk = nacl.public.PrivateKey(sk_bytes)
b = nacl.public.SealedBox(sk)

data = sys.stdin.buffer.read()
print(b.decrypt(base64.b64decode(data)).decode())
