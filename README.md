# ロリポップ！マネージドクラウド スターター for Ruby on Rails

## インストール

```ruby
gem install lolipop-mc-starter-rails
```

## Usage

`lolipop-mc-starter-rails` をインストールしたあとに、 `mc-rails` コマンドが使えるようになります。

### `mc-rails check`

Railsプロジェクトのソースコードがあるディレクトリで `mc-rails check` を実行すると、ロリポップ！マネージドクラウドにデプロイするまでに必要な設定についてチェックしてくれます

```ruby
$ cd your_rails/
$ mc-rails check
```

### `mc-rails database`

Railsプロジェクトのデータベース設定に必要な環境変数 `DATABASE_URL` を簡単に作成できます

```ruby
$ mc-rails database
```

## License

the [MIT License](https://opensource.org/licenses/MIT).
