cask "axure-rp-arm" do
  version "11"
  sha256 :no_check  # 由于下载链接可能会变化，这里使用 :no_check 来避免校验失败

  if Hardware::CPU.arm?
    url "https://d3uii9pxdigrx1.cloudfront.net/AxureRP-Setup-arm64.dmg",
        verified: "axure.cachefly.net/"
    name "Axure RP ARM"
    desc "Planning and prototyping tool for developers (ARM version)"
  else
    url "https://d3uii9pxdigrx1.cloudfront.net/AxureRP-Setup.dmg",
        verified: "axure.cachefly.net/"
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
