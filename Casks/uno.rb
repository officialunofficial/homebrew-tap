cask "uno" do
  version "0.6.0"
  sha256 "51c2ec010c32436eea9b44830542041cff960fc2be1114b0fce2ed2784d7dd39"

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
