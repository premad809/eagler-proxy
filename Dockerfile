FROM qwedfrnhgef/eagler-viaversion:latest

RUN echo -n "d03o2hS1bFGz" > /velocity/forwarding.secret && \
    echo -n "d03o2hS1bFGz" > /app/forwarding.secret && \
    echo -n "d03o2hS1bFGz" > /server/forwarding.secret && \
    echo -n "d03o2hS1bFGz" > /forwarding.secret && \
    find / -name "forwarding.secret" 2>/dev/null | \
      xargs -I{} sh -c 'echo -n "d03o2hS1bFGz" > "{}"' || true && \
    find / -name "velocity.toml" 2>/dev/null | \
      xargs -I{} sed -i 's/forwarding-secret = ".*"/forwarding-secret = "d03o2hS1bFGz"/' {} || true
