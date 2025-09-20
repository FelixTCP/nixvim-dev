function nixvim-dev {
    param (
        [string[]]$Args
    )

    #podman run -it --rm `
    #    -v "$HOME\.ssh\id_rsa:/root/.ssh/id_rsa" `
    #    -v "$HOME\.ssh\id_rsa.pub:/root/.ssh/id_rsa.pub" `
    #    -v "%WORKSPACE%:/workspace" `
    #    nixvim-dev @Args
}
