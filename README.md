# CV and Cover Letter templates written in LaTeX

## Notes

### Media files
Put all photos, images that you wish to include in CV or cover letter in `imgs/`. This directory is appended `\graphicspath`, therefore, you don't need to specify it when refer to media files.

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

### Credit
This template is based on [Awesome-CV](https://github.com/posquit0/Awesome-CV) project.

### Contact
You are free to take these `*.tex, *.cls, *.sty` files and modify it to create your own CV or cover letter. Please don't use my resume for anything else without my permission, though!
