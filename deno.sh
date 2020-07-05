NOTICE "安装 Deno"

if curl -fsSL https://deno.land/x/install/install.sh | sh; then
    echo "export DENO_INSTALL=/root/.deno" >> ~/.bashrc
    echo "export PATH=$DENO_INSTALL/bin:$PATH" >> ~/.bashrc

    export DENO_INSTALL=/root/.deno
    export PATH=$DENO_INSTALL/bin:$PATH
else
    WARN "deno 安装失败"
fi