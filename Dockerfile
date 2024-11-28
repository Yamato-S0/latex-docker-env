FROM texlive/texlive:latest

RUN apt-get update && apt-get install -y \
    latexmk \
    texlive-lang-japanese \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    fonts-noto-cjk \
    fonts-ipafont-gothic \
    fonts-ipafont-mincho \
    dvipdfmx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# フォントマップの設定
RUN kanji-config-updmap-sys ipaex && \
    mktexlsr && \
    updmap-sys