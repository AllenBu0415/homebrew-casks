class Flutter < Formula
  desc "UI toolkit for building applications for mobile, web and desktop"
  homepage "https://flutter.dev/"

  version "3.29.2"

  if Hardware::CPU.arm?
    url "https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_#{version}-stable.zip"
    sha256 :no_check  # 由于下载链接可能会变化，这里使用 :no_check 来避免校验失败
  else
    url "https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_#{version}-stable.zip"
    sha256 :no_check  # 由于下载链接可能会变化，这里使用 :no_check 来避免校验失败
  end

  def install
    # 解压zip文件到指定目录
    prefix.install Dir["*"]

    # 创建符号链接以便于使用dart和flutter命令
    bin.install_symlink "#{prefix}/bin/dart" => "dart"
    bin.install_symlink "#{prefix}/bin/flutter" => "flutter"
    
    # 创建额外的符号链接或执行其他安装步骤
    (HOMEBREW_PREFIX/"share/flutter").install_symlink Dir["#{prefix}/*"]
  end

  def caveats
    <<~EOS
      To complete the installation of Flutter, you need to manually run the following command:
      
        flutter doctor
      
      This will guide you through the additional steps required to start using Flutter.
    EOS
  end

  test do
    system "#{bin}/flutter", "--version"
  end

  # 定义哪些文件或目录将在卸载时被移除
  zap trash: "~/.flutter"
end
