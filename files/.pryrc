# http://aylog.tumblr.com/post/127455013886/rb-readlineをあれする微妙な方法
Pry.config.history.should_save = false

# http://attonblog.blogspot.jp/2015/04/pry-rails-multibyte-char.html
Pry.history.instance_eval do
  @saver = ->(line) { save_to_file (line.force_encoding(STDIN.external_encoding))}
end

begin
  require 'hirb'
rescue LoadError
  # Missing goodies, bummer
end

if defined? Hirb
  # Slightly dirty hack to fully support in-session Hirb.disable/enable toggleing
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      @old_print = Pry.config.print
      Pry.config.print = proc do |output, value|
        Hirb::View.view_or_page_output(value) || @out_print.call(output, value)
      end
      Pry.config.print = proc do |*args|
        Hirb::View.view_or_page_output(args[1]) || @old_print.call(*args)
      end
    end

    def disable_output_method
      Pry.config.print = @old_print
      @output_method = nil
    end
  end

  Hirb.enable
end

Pry.commands.alias_command 'c', 'continue'  # デバッグから抜けてプログラムを実行する
Pry.commands.alias_command 's', 'step'      # 矢印の指している関数の内部に入って1行進める
Pry.commands.alias_command 'n', 'next'      # 現在の関数内で1行進める
Pry.commands.alias_command 'f', 'finish'    # 現在の関数から抜ける
Pry.commands.alias_command 'b', 'break'     # 新しいブレークポイントをセットする
