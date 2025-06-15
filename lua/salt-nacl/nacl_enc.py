#!/usr/bin/env python
import sys, base64, nacl.public, subprocess

# Define your 1Password account domain
OP_ACCOUNT = "check24individualreisen.1password.com"

# Fetch secret key from 1Password
public_key_base64 = subprocess.check_output([
    "op", "--account", OP_ACCOUNT, "read", "op://admin/salt-nacl/pk"
], text=True).strip()

pk_bytes = base64.b64decode(public_key_base64)
pk = nacl.public.PublicKey(pk_bytes)
b = nacl.public.SealedBox(pk)

data = sys.stdin.buffer.read()
# Strip last newline that echo adds, since `-n` does not seem to work there
if data[-1] == 10:
    data = data[:-1]
print(base64.b64encode(b.encrypt(data)).decode())