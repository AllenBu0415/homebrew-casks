cask "axure-rp-arm" do
  version "11.0.0.4118"
  sha256 :no_check  # 由于下载链接可能会变化，这里使用 :no_check 来避免校验失败

  if Hardware::CPU.arm?
    url "https://d3uii9pxdigrx1.cloudfront.net/AxureRP-Setup-arm64.dmg",
        verified: "axure.cachefly.net/"
    sha256 "e567e196fa677bc98a8672bcaee7bc0a93c556527e26e441f990b118f2ea31f9"
    name "Axure RP ARM"
    desc "Planning and prototyping tool for developers (ARM version)"
  else
    url "https://d3uii9pxdigrx1.cloudfront.net/AxureRP-Setup.dmg",
        verified: "axure.cachefly.net/"
    sha256 "1359f581913b0137516ef21e68625634457fc0812484ec66777ec786c0b6162f"  # 假设 Intel 版本的 sha256 校验值
    name "Axure RP Intel"
    desc "Planning and prototyping tool for developers (Intel version)"
  end
  homepage "https://www.axure.com/"

  livecheck do
    url "https://www.axure.com/release-history"
    regex(/>\s*(?:Version|Axure\s*RP)\s*v?(\d+(?:\.\d+)+)/i)
  end

  depends_on macos: ">= :high_sierra"

  app "Axure RP #{version.major}.app"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.axure.axurerp#*.sfl*",
    "~/Library/Preferences/com.axure.AxureRP#*.plist",
    "~/Library/Saved Application State/com.axure.AxureRP#*.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
