# CV template written in LaTex

## Notes

### Compilation
Compilation requires to use `xelatex`, whereas I normally tend to use `pdflatex` (either on its own or as part of `latexmk`). Thus, the possible options are:

-   Create a configuration file `.latexmkrc` with the following content:
    ```
    $pdflatex = "xelatex %O %S";
    $bibtex_use = "0"; # Optional
    ```

-   Add shebang at the top of the root file (depends on the text editor at hand):
    ```
    % For TexShop
    %!TEX TS-program = xelatex

    % For Atom and 'latex' plugin
    %!TEX engine = xelatex
    ```

> **NOTE:** Option with configuration file is more robust then shebang. For instance, the latter would not work with my custom script for compiling Tex files.
