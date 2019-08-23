module Lolipop::Mc::Starter::Rails
  module Nodebrew
    def self.run
      begin
        @config = Lolipop::Mc::Starter::Rails::Config
        config = @config.load
        @ssh_command = config['ssh']
        if @ssh_command == @config::NOCHECK
          raise 'SSHコマンドの実行に失敗しました。SSH接続の設定を確認してください'
        end
        install_nodebrew
        check_env_path
      rescue => e
        puts '❌ ' + Paint[e.message, :red]
      end
    end

    def self.install_nodebrew
      stdout, stderr, status = Open3.capture3("#{@ssh_command} ls /var/app/.nodebrew")
      if status == 0
        puts '✅ ' + Paint['nodebrewはインストールされています', :green].to_s
        return
      end
      stdout, stderr, status = Open3.capture3("#{@ssh_command} wget git.io/nodebrew")
      stdout, stderr, status = Open3.capture3("#{@ssh_command} perl nodebrew setup")
      puts '✅ ' + Paint['nodebrewをインストールしました', :green].to_s
    end

    def self.check_env_path
      stdout, stderr, status = Open3.capture3("#{@ssh_command} env")
      md = stdout.match(/PATH=([^\s]+)/)
      raise '環境変数 `PATH` ありません。マネージドクラウドのプロジェクトではない可能性があります' unless md
      path = md[1]
      raise "環境変数 `PATH` にnodebrewのPATH設定がないようです。マネージドクラウドのプロジェクト詳細の `環境変数の設定と管理` で環境変数 `PATH` に `/var/app/.nodebrew/current/bin:#{path}` を設定して追加してください" unless path.match(/nodebrew/)
      stdout, stderr, status = Open3.capture3("#{@ssh_command} which nodebrew")
      if status == 0
        puts '✅ ' + Paint['環境変数 `PATH` の設定を確認しました', :green].to_s
        return
      end
      raise '環境変数 `PATH` の設定が間違っている可能性があります。マネージドクラウドのプロジェクト詳細の `環境変数の設定と管理` を確認してください'
    end

    def self.install_node_stable
    end

    def self.use_node_stable
    end

    def self.cleanup
    end
  end
end
