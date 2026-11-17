cask "uno" do
  version "0.5.2"
  sha256 "0fcf6ccef9d248aabc6c8a5f8a750733fa935a97e3633f6d051297718e5123e5"

  url "https://github.com/officialunofficial/uno-cli/releases/download/uno-cli-v#{version}/uno-cli-darwin-arm64.tar.gz"
  name "Uno CLI"
  desc "Command-line client for Uno"
  homepage "https://uno.fun/"

  depends_on arch: :arm64

  shimscript = "#{staged_path}/uno.shim"
  binary shimscript, target: "uno"

  preflight_steps do
    write_file "uno.shim", <<~EOS
      #!/bin/sh
      exec '{{staged_path}}/uno-darwin-arm64' "$@"
    EOS
  end

  postflight_steps do
    run "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
        args:         ["-f", "{{staged_path}}/Uno.app"],
        must_succeed: false
  end
end
