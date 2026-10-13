cask "uno" do
  version "0.1.0"
  sha256 "42e233cb79cfdda80d0ffd5dc58d4c8e06baab91fe29a09b479df6ec39d49dd6"

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
