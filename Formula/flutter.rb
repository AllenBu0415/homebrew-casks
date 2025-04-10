class Flutter < Formula
  desc "UI toolkit for building applications for mobile, web and desktop"
  homepage "https://flutter.dev/"

  version "3.29.2"

  if Hardware::CPU.arm?
    url "https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_#{version}-stable.zip"
    sha256 "72e1ce7aa3eacf3f8554ba9995cccd732253737cf9cf010c7d8e55f7a0a2a5c2"
  else
    url "https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_#{version}-stable.zip"
    sha256 "1b6e7179dd69d08ec791df6dc18c4c9a99e4e0a9ee202ed2f2aa7627871e0967"
  end

  def install
    # 解压zip文件到指定目录
    prefix.install Dir["*"]
    
    # 创建符号链接以便于使用dart和flutter命令
    bin.install_symlink "#{prefix}/bin/dart" => "dart"
    bin.install_symlink "#{prefix}/bin/flutter" => "flutter"
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
end
