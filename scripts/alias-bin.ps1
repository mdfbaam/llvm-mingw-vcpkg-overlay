function Alias-Bin-Single-Item {
    param (
        [string]$SourceFile
    )

    Push-Location -Path "$PSScriptRoot\.."
    $target_file = Get-ChildItem $SourceFile

    Set-Location -Path ".\bin\"
    $target = $target_file | Resolve-Path -Relative
    $link   = $target_file.Name

    $link = [System.IO.Path]::ChangeExtension($link, ".bat")

    if (Test-Path "$link") {
        Write-Output "[Warning]: $link -> $target already exists, skipping..."
    } else {
        Write-Output "[Create]: $link -> $target"

        $script = "@cd /D `"%~dp0`"`n" + "@$target %*"
        Out-File -FilePath $link -InputObject $script -Encoding ASCII
    }

    Pop-Location
}

function Alias-Bin-Dir-Items {
    param (
        [string]$SourceDirectory,
        [string]$Filter = ''
    )

    Push-Location -Path "$PSScriptRoot\.."

    if ($Filter) {
        $target_files = Get-ChildItem $SourceDirectory -Filter $Filter
    } else {
        $target_files = Get-ChildItem $SourceDirectory
    }

    for ($i = 0; $i -lt $target_files.Count; $i++) {
        $current_target = $target_files[$i] | Resolve-Path -Relative
        if (Test-Path -Path $current_target -PathType Leaf) {
            Alias-Bin-Single-Item -SourceFile $current_target
        }
    }

    Pop-Location
}

# ---------
# Toolchain
# ---------

# LLVM
Alias-Bin-Dir-Items   "./toolchain/llvm/bin"
# Ninja
Alias-Bin-Single-Item "./toolchain/ninja/ninja.exe"
# CMake
Alias-Bin-Single-Item "./toolchain/cmake/bin/cmake.exe"
Alias-Bin-Single-Item "./toolchain/cmake/bin/cmcldeps.exe"
Alias-Bin-Single-Item "./toolchain/cmake/bin/cpack.exe"
Alias-Bin-Single-Item "./toolchain/cmake/bin/ctest.exe"

# ---------
# Packaging
# ---------

# VCPKG
Alias-Bin-Single-Item "./packages/vcpkg/upstream/vcpkg.exe"

# ---------
# Tools
# ---------

# bottom
Alias-Bin-Single-Item "./tools/cli/bottom/btm.exe"

# fdfind
Alias-Bin-Single-Item "./tools/cli/fd/fd.exe"

# ripgrep
Alias-Bin-Single-Item "./tools/cli/ripgrep/rg.exe"

# git
Alias-Bin-Dir-Items   "./tools/cli/git/cmd"
Alias-Bin-Single-Item "./tools/cli/git/git-lfs/git-lfs.exe"

# neovim
Alias-Bin-Dir-Items   "./tools/cli/nvim/bin" "*.exe"


