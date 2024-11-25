# ベースイメージ
FROM texlive/texlive:latest

# LaTeX用の補助ツールをインストール（必要に応じて拡張）
RUN apt-get update && apt-get install -y \
    latexmk \
    && apt-get clean