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
        install_node_stable
        use_node_stable
        cleanup
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
      stdout, stderr, status = Open3.capture3("#{@ssh_command} nodebrew install stable")
      raise "Node.jsのインストールに失敗しました: #{stdout}" unless (status == 0 || stdout.match('already installed'))
      puts stdout
      puts '✅ ' + Paint["Node.jsをインストールしました", :green].to_s
    end

    def self.use_node_stable
      stdout, stderr, status = Open3.capture3("#{@ssh_command} nodebrew use stable")
      raise "nodebrew use stableに失敗しました: #{stderr}" unless status == 0
      puts stdout

      stdout, stderr, status = Open3.capture3("#{@ssh_command} which nodejs")
      raise "nodejsコマンドの差し替えに失敗しました: #{stderr}" unless status == 0
      unless stdout.match('/var/app/.nodebrew/current/bin/node')
        stdout, stderr, status = Open3.capture3("#{@ssh_command} ln -s /var/app/.nodebrew/current/bin/node /var/app/.nodebrew/current/bin/nodejs")
        raise "nodejsコマンドの差し替えに失敗しました: #{stderr}" unless status == 0
      end
      stdout, stderr, status = Open3.capture3("#{@ssh_command} nodejs -v")
      raise "nodejsコマンドの差し替えに失敗しました: #{stderr}" if stdout.match(/^v4/)
      puts stdout

      config = @config.load
      config['nodejs'] = stdout.strip
      @config.dump(config)
      puts '✅ ' + Paint["nodebrew use stableを実行しました。そしてstableバージョンをnodejsコマンドで実行できるようにしました", :green].to_s
    end

    def self.cleanup
      stdout, stderr, status = Open3.capture3("#{@ssh_command} rf -f /var/app/nodebrew")
      puts '✅ ' + Paint["cleanupを実行しました", :green].to_s
    end
  end
end
