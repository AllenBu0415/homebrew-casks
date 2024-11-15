cask "axure-rp-arm" do
  version "11.0.0.4118"
  sha256 "f1200965636d68d8a6154c807513fdc9736d51bc585021187f5cad937ca8c83d"

  url "https://d3uii9pxdigrx1.cloudfront.net/AxureRP-Setup-arm64.dmg",
      verified: "axure.cachefly.net/"
  name "Axure RP ARM"
  desc "Planning and prototyping tool for developers"
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
