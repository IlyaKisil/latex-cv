# CV and Cover Letter templates written in LaTeX

## Notes

### Media files
Put all photos, images that you wish to include in CV or cover letter in `imgs/`. This directory is appended `\graphicspath`, therefore, you don't need to specify it when refer to media files.

### Compilation
Compilation requires to use `xelatex`. Obviously, everyone has different preferences for compiling LaTeX documents. Here is a list of possible options:

-   If you have a Unix like OS, then you can use `create_pdf.sh` script, for example:
    ```
    ./create_pdf.sh --file=main-cv.tex
    ```
    For more details see `./create_pdf.sh --help`


-   If you are using `latexmk` to create pdf, then don't forget to add a configuration file `.latexmkrc` with the following content:
    ```
    $pdflatex = "xelatex %O %S";
    ```

-   If you are compiling source files from text editors, then I would suggest to add shebang at the top of the root file (depends on the text editor at hand):
    ```
    % For TexShop
    %!TEX TS-program = xelatex

    % For Atom and 'latex' plugin
    %!TEX engine = xelatex
    ```
    Alternatively, this can be specified in editor or plugin settings.

> **NOTE:** Option with configuration file is more robust then shebang, since it standardises `latexmk` behaviour invoked by text editor or via command line.

### Credit
This template is based on [Awesome-CV](https://github.com/posquit0/Awesome-CV) project.

### Contact
You are free to take these `*.tex, *.cls, *.sty` files and modify it to create your own CV or cover letter. Please don't use my resume for anything else without my permission, though!
