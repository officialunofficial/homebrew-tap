cask "uno" do
  version "0.3.0"
  sha256 "5498c564f8bb60a73e14a3be16d035ae44b700ac76a22e04deab49c2642ba804"

  url "https://github.com/officialunofficial/uno-cli/releases/download/uno-cli-v#{version}/uno-cli-darwin-arm64.tar.gz"
  name "Uno CLI"
  desc "Command-line client for Uno"
  homepage "https://uno.fun"

  depends_on arch: :arm64

  shimscript = "#{staged_path}/uno.shim"
  binary shimscript, target: "uno"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/sh
      exec '#{staged_path}/uno-darwin-arm64' "$@"
    EOS
  end

  postflight do
    system_command "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
                   args:         ["-f", "#{staged_path}/Uno.app"],
                   must_succeed: false
  end
end
