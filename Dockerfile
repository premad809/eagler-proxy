FROM qwedfrnhgef/eagler-viaversion:latest

# Find and overwrite the forwarding.secret file.
# The COPY command puts your file into the image at build time.
# We target the most common Velocity working directory paths:
COPY forwarding.secret /velocity/forwarding.secret
COPY forwarding.secret /app/forwarding.secret
COPY forwarding.secret /server/forwarding.secret

# Also patch velocity.toml if the secret is hardcoded there
# (this command is safe to run even if the file doesn't exist)
RUN find / -name "velocity.toml" 2>/dev/null | xargs -I{} \
    sed -i 's/forwarding-secret = ".*"/forwarding-secret = "mySuperSecretToken123"/' {} || true

RUN find / -name "forwarding.secret" 2>/dev/null | \
    xargs -I{} sh -c 'echo "mySuperSecretToken123" > "{}"' || true
