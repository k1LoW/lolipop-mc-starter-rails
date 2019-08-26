# ロリポップ！マネージドクラウド スターター for Ruby on Rails [![Gem](https://img.shields.io/gem/v/lolipop-mc-starter-rails.svg)](https://rubygems.org/gems/lolipop-mc-starter-rails)

## インストール

```console
$ gem install lolipop-mc-starter-rails
```

## 使い方

`lolipop-mc-starter-rails` をインストールしたあとに、 `mc-rails` コマンドが使えるようになります。

### `mc-rails check`

Railsプロジェクトのソースコードがあるディレクトリで `mc-rails check` を実行すると、ロリポップ！マネージドクラウドにデプロイするまでに必要な設定についてチェックしてくれます

```console
$ cd your_rails/
$ mc-rails check
```

### `mc-rails database`

Railsプロジェクトのデータベース設定に必要な環境変数 `DATABASE_URL` を簡単に作成できます

```console
$ mc-rails database
```

### `mc-rails nodebrew`

Railsプロジェクトに[nodebrew](https://github.com/hokaccha/nodebrew)を利用して、Node.jsのstableバージョンをインストールします

```console
$ mc-rails nodebrew
```

## ライセンス

the [MIT License](https://opensource.org/licenses/MIT).
