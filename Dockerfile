FROM texlive/texlive:latest

RUN apt-get update && apt-get install -y \
    latexmk \
    texlive-lang-japanese \
    texlive-fonts-recommended \
    texlive-latex-extra \
    texlive-fonts-extra \
    fonts-noto-cjk \
    fonts-ipafont-gothic \
    fonts-ipafont-mincho \
    dvipdfmx \
    perl \
    cpanminus \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# フォントマップの設定
RUN kanji-config-updmap-sys ipaex && \
    mktexlsr && \
    updmap-sys

RUN tlmgr init-usertree && \
    tlmgr install latexindent && \
    cpanm Log::Log4perl Log::Dispatch::File YAML::Tiny File::HomeDir Unicode::GCString