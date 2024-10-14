# Start with an Ubuntu image
FROM openresty/openresty:bookworm

RUN apt-get update && \
    apt-get install -y \
        ca-certificates \
        luarocks \
        && rm -rf /var/lib/apt/lists/*

# Install LuaRocks and Lua modules
RUN luarocks install lua-resty-http \
    && luarocks install lua-resty-session \
    && luarocks install lua-resty-openidc

# Remove the default configuration file and copy the custom one
COPY nginx.conf /etc/nginx/nginx.conf

